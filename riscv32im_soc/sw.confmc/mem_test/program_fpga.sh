#!/bin/bash

if [[ -z "${XILINX_VIVADO}" ]]; then
source /tools/Xilinx/Vivado/2021.2/settings64.sh
fi

if [ -z "$1" ]; then
   #BIT_PATH="../../hw/impl/zed.confmc/fpga.bit"
    BIT_PATH="../../hw/impl/zed.confmc/project_1/project_1.runs/impl_1/fpga.bit"
else
    BIT_PATH="$1"
fi

JTAG_SERIAL="*RA"
#TARGET_DEV=$1
TARGET_DEV=0

if [ "${TARGET_DEV}" == "0" ]; then
        JTAG_SERIAL="*WA"
fi

xsdb -interactive << EOF
connect
targets -set -filter {jtag_cable_serial =~ "${JTAG_SERIAL}" && level == 0}
puts stderr "INFO: Configuring the FPGA..."
puts stderr "INFO: Downloading bitstream: ${BIT_PATH} to the target."
fpga ${BIT_PATH}
after 2000
exit
EOF
