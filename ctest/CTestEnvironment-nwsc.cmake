#==============================================================================
#
#  This file sets the environment variables needed to configure and build
#  on the NCAR Wyoming Supercomputing Center (yellowstone) system.
#
#==============================================================================

# Assume all package locations (NetCDF, PnetCDF, HDF5, etc) are already
# set with existing environment variables: NETCDF, PNETCDF, HDF5, etc.

# Define the extra CMake configure options
set (CTEST_CONFIGURE_OPTIONS "-DCMAKE_VERBOSE_MAKEFILE=TRUE")
