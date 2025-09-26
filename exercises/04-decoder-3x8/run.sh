#!/bin/bash

set -eux

TOP_LEVEL="${1}"

ghdl -i --std=08 design.vhd testbench.vhd
ghdl -m --std=08 "$TOP_LEVEL"
ghdl -r --std=08 "$TOP_LEVEL" --vcd=dump.vcd
