list(APPEND NOOPT_FILES
  cam/src/dynamics/eul/dyn_comp.F90
  cam/src/dynamics/fv/dyn_comp.F90
  cam/src/dynamics/se/dyn_comp.F90
  cam/src/dynamics/sld/dyn_comp.F90
  cam/src/physics/cam/microp_aero.F90)

set(FILES_NEED_CUDA_FLAGS
  homme/src/preqx_acc/bndry_mod.F90
  homme/src/preqx_acc/derivative_mod.F90
  homme/src/preqx_acc/edge_mod.F90
  homme/src/share/element_mod.F90
  homme/src/preqx_acc/element_state.F90
  homme/src/preqx_acc/openacc_utils_mod.F90
  homme/src/preqx_acc/prim_advection_mod.F90
  homme/src/share/prim_si_mod.F90
  homme/src/preqx_acc/model_init_mod.F90
  homme/src/preqx_acc/viscosity_mod.F90
  homme/src/preqx_acc/prim_driver_mod.F90
  homme/src/share/prim_driver_base.F90
  homme/src/share/physics_mod.F90
  cam/src/control/physconst.F90)


set(FILES_NEED_OPENACC_FLAGS
  cam/src/physics/crm/ADV_MPDATA/advect_scalar.F90
  cam/src/physics/crm/ADV_MPDATA/advect_scalar2D.F90
  cam/src/physics/crm/ADV_MPDATA/advect_scalar3D.F90
  cam/src/physics/crm/ADV_MPDATA/advection.F90
  cam/src/physics/crm/accelerate_crm.F90
  cam/src/physics/crm/adams.F90
  cam/src/physics/crm/MICRO_SAM1MOM/cloud.F90
  cam/src/physics/crm/MICRO_SAM1MOM/micro_params.F90
  cam/src/physics/crm/MICRO_SAM1MOM/microphysics.F90
  cam/src/physics/crm/MICRO_SAM1MOM/precip_init.F90
  cam/src/physics/crm/MICRO_SAM1MOM/precip_proc.F90
  cam/src/physics/crm/MICRO_SAM1MOM/precip_proc_clubb.F90
  cam/src/physics/crm/advect2_mom_xy.F90
  cam/src/physics/crm/SGS_TKE/diffuse_mom.F90
  cam/src/physics/crm/SGS_TKE/diffuse_mom2D.F90
  cam/src/physics/crm/SGS_TKE/diffuse_mom3D.F90
  cam/src/physics/crm/SGS_TKE/diffuse_scalar.F90
  cam/src/physics/crm/SGS_TKE/diffuse_scalar2D.F90
  cam/src/physics/crm/SGS_TKE/diffuse_scalar3D.F90
  cam/src/physics/crm/SGS_TKE/sgs.F90
  cam/src/physics/crm/SGS_TKE/shear_prod2D.F90
  cam/src/physics/crm/SGS_TKE/shear_prod3D.F90
  cam/src/physics/crm/SGS_TKE/tke_full.F90
  cam/src/physics/crm/abcoefs.F90
  cam/src/physics/crm/advect2_mom_z.F90
  cam/src/physics/crm/advect_all_scalars.F90
  cam/src/physics/crm/buoyancy.F90
  cam/src/physics/crm/crm_module.F90
  cam/src/physics/crm/advect_mom.F90
  cam/src/physics/crm/atmosphere.F90
  cam/src/physics/crm/bound_duvdt.F90
  cam/src/physics/crm/bound_exchange.F90
  cam/src/physics/crm/boundaries.F90
  cam/src/physics/crm/coriolis.F90
  cam/src/physics/crm/crmtracers.F90
  cam/src/physics/crm/crm_ecpp_output_module.F90
  cam/src/physics/crm/crm_input_module.F90
  cam/src/physics/crm/crmsurface.F90
  cam/src/physics/crm/crm_output_module.F90
  cam/src/physics/crm/crm_rad_module.F90
  cam/src/physics/crm/crm_state_module.F90
  cam/src/physics/crm/damping.F90
  cam/src/physics/crm/grid.F90
  cam/src/physics/crm/diagnose.F90
  cam/src/physics/crm/params.F90
  cam/src/physics/crm/dmdf.F90
  cam/src/physics/crm/domain.F90
  cam/src/physics/crm/ecppvars.F90
  cam/src/physics/crm/fft.F90
  cam/src/physics/crm/fftpack5.F90
  cam/src/physics/crm/fftpack5_1d.F90
  cam/src/physics/crm/forcing.F90
  cam/src/physics/crm/ice_fall.F90
  cam/src/physics/crm/kurant.F90
  cam/src/physics/crm/press_grad.F90
  cam/src/physics/crm/module_ecpp_stats.F90
  cam/src/physics/crm/setparm.F90
  cam/src/physics/crm/module_ecpp_crm_driver.F90
  cam/src/physics/crm/press_rhs.F90
  cam/src/physics/crm/pressure.F90
  cam/src/physics/crm/periodic.F90
  cam/src/physics/crm/scalar_momentum.F90
  cam/src/physics/crm/random.F90
  cam/src/physics/crm/setperturb.F90
  cam/src/physics/crm/task_init.F90
  cam/src/physics/crm/task_util_NOMPI.F90
  cam/src/physics/crm/utils.F90
  cam/src/physics/crm/uvw.F90
  cam/src/physics/crm/vars.F90
  cam/src/physics/crm/zero.F90
  cam/src/physics/crm/openacc_utils.F90
  cam/src/physics/crm/sat.F90 )
