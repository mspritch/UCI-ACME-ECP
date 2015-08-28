#!/bin/sh
#==============================================================================
#
#  This script defines how to run CTest on the default ("unknown") machine.
#  This assumes the CTest model name (i.e., "Nightly") is passed to it when
#  run.
#
#==============================================================================

# Get the CTest model name
model=$1

# Run the "ctest" command through an interactive parallel session
DAV_CORES=4 execca ctest -M ${model} -T Test
