#!/bin/sh
#
rm *.exe
#
SRC_DIR=../../src
FC=gfortran 
#INCLUDE="-I${PWD}"
FFLAGS="-fbounds-check -ffree-form -O3 -I. -I/usr/include"
LDFLAGS="-L/usr/lib -lnetcdff"
#FFLAGS="-fbounds-check -ffree-form -O3"
#FFLAGS="-fbounds-check -ffree-form -O0 -g -fcheck=array-temps,bounds,do,mem,pointer,recursion"

${FC} ${FFLAGS} -c ${SRC_DIR}/mod_calendar.f90
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_geochem.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_reef_ecosys_param.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_param.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_reef_flow.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_heat.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_decomposition.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_foodweb.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_coral_kk1.0.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_macroalgae.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_seagrass.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_sedecosys.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_reef_ecosys.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_input.F
${FC} ${FFLAGS} -c ${SRC_DIR}/mod_output.F
${FC} ${FFLAGS} -c ${SRC_DIR}/main.F

${FC} ${FFLAGS} *.o ${LDFLAGS} -o ecosys_test.exe

rm *.mod
#
mkdir -p output
#
#./ecosys_test.exe < coral_01.in
./ecosys_test.exe < coral_bl_T25.in
./ecosys_test.exe < coral_bl_T32.in
./ecosys_test.exe < coral_bl_T15.in
./ecosys_test.exe < coral_bl_T17.in
./ecosys_test.exe < coral_bl_T21.in
./ecosys_test.exe < coral_bl_T29.in
#
