#!/bin/bash

set -eux

TOP_LEVEL="${1:-tb_fn_f}"

ghdl -i design.vhd testbench.vhd
ghdl -m "$TOP_LEVEL"
ghdl -r "$TOP_LEVEL" --vcd=dump.vcd
