#!/bin/bash
# Run script for SP-E3SM early science runs on summit
# 
# Branch for this simulation camppaign:
# E3SM-Project/ACME-ECP.git/crjones/crm/summit_early_science (commit fdee19e)
# 
# See https://confluence.exascaleproject.org/x/SIOWAw for further details 


create_newcase=true
dosetup=true
dobuild=true
dosubmit=false

### BASIC INFO FOR create_newcase
case_name=earlyscience.FC5AV1C-H01A.ne120.sp1_64x1_1000m.20190222
compset=FC5AV1C-H01A
resolution=ne120_ne120
project=atm111
machine=summit
compiler=pgigpu
pecount=36864x1

### CRM details specified in CAM_CONFIG_OPTS
# additional options specified directly in CAM_CONFIG_OPTS include:
#    -phys cam5 -use_SPCAM -crm_adv MPDATA -nlev 72 -crm_nz 58
#    -microphys mg2 -rad rrtmg -chem none -pcols 256
crm_nx=64
crm_ny=1
crm_nx_rad=4
crm_ny_rad=1
crm_dx=1000
crm_dt=5
sp_micro=sam1mom
cppdefs="'-DCRJONESDEBUG -DSP_DIR_NS -DSP_MCICA_RAD'"

### local directory info
repo_dir=$HOME/git_repos/ACME-ECP
case_dir_root=$repo_dir/Cases
case_dir=$repo_dir/Cases/$case_name
cime_dir=$repo_dir/cime/scripts

### create case:
if [ "$create_newcase" = true ] ; then
    cd $case_dir_root
    $cime_dir/create_newcase -compset $compset -res $resolution -project $project -mach $machine -case $case_name -compiler $compiler -pecount $pecount
fi

cd $case_dir
### case setup:
if [ "$dosetup" = true ] ; then
    ./case.setup
fi

### build options:
./xmlchange CAM_CONFIG_OPTS="-phys cam5 -use_SPCAM -crm_adv MPDATA -nlev 72 -microphys mg2 -crm_nz 58 -rad rrtmg -chem none -crm_nx ${crm_nx} -crm_ny ${crm_ny} -crm_dx ${crm_dx} -crm_dt ${crm_dt} -crm_nx_rad $crm_nx_rad -crm_ny_rad $crm_ny_rad -SPCAM_microp_scheme $sp_micro -cppdefs $cppdefs -pcols 256"
./xmlchange ATM_PIO_NETCDF_FORMAT="64bit_data"   # note: this may not actually do anything ...
if [ "$dobuild" = true ] ; then
    ./case.build
fi

### Run options
./xmlchange ATM_NCPL=288
./xmlchange RUN_STARTDATE=0001-01-01
./xmlchange STOP_OPTION=nmonths
./xmlchange STOP_N=4
./xmlchange REST_OPTION=nmonths
./xmlchange REST_N=2
./xmlchange RESUBMIT=0

### namelist options
rm user_nl_cam
cat <<EOF >> user_nl_cam
  ! prescribed aerosol options
  prescribed_aero_cycle_yr = 01
  prescribed_aero_file = 'mam4_0.9x1.2_L72_2000clim_c170323.nc'
  prescribed_aero_datapath = '/gpfs/alpine/world-shared/csc190/e3sm/cesm/inputdata/atm/cam/chem/trop_mam/aero'
  use_hetfrz_classnuc = .false.
  prescribed_aero_type = 'CYCLICAL'
  aerodep_flx_type = 'CYCLICAL'
  aerodep_flx_datapath = '/gpfs/alpine/world-shared/csc190/e3sm/cesm/inputdata/atm/cam/chem/trop_mam/aero'
  aerodep_flx_file = 'mam4_0.9x1.2_L72_2000clim_c170323.nc'
  aerodep_flx_cycle_yr = 01

  ! enable surface flux smoothing (stability requirement ?)
  srf_flux_avg = 1

  ! dycore options
  se_nsplit = 5
  rsplit = 1

  ! radiation every 30 minutes
  iradlw = 6
  iradsw = 6

  ! crm mean-state acceleration
  use_crm_accel = .true.
  crm_accel_factor = 4.
  crm_accel_uv = .true.

  ! file i/o
  nhtfrq = 0,-1,-3,-1
  mfilt = 1,120,40,120
  avgflag_pertape = 'A','A','A','I'

  ! hourly 2D fields
  fincl2 = 'PRECT','TMQ','LHFLX','SHFLX','TS','PS','FLNT','FSNT','FSNS','FLNS','SWCF','LWCF','TGCLDLWP','TGCLDIWP'

  ! daily 3D fields + budget terms (3-hourly even better for tropical/mcs dynamics)
  fincl3 = 'T','Q','Z3','U','V','OMEGA','CLDLIQ','CLDICE','QRL','QRS'

  ! CRM-fields near SGP site (halo of 9 crms)
  fincl4 = 'CRM_U:I','CRM_W:I','CRM_T:I','CRM_QV:I','CRM_QC:I','CRM_QI:I','CRM_QPC:I','CRM_QPI:I','CRM_QRAD:I','Z3:I','U:I','V:I','OMEGA:I','T:I','PS:I','Q:I','CLDLIQ:I','CLDICE:I'
  fincl4lonlat = '97.8w:97.2w_36.27n:36.75n'
EOF

### batch options
./xmlchange JOB_WALLCLOCK_TIME=24:00:00

### submit
if [ "$dosubmit" = true ] ; then
    ./case.submit
fi