entity=tb_mean
filename=testbench.vhd
tmp_file=/tmp/$(filename)

$(entity): design.vhd testbench.vhd
	ghdl -a $^
	ghdl -e $@
	ghdl -r $@ --vcd=wave.vcd || true

.PHONY=wave
wave:
	gtkwave dump.vcd

.PHONY=test
test: $(entity)
	ghdl -r $@ --wave=wave.ghw || true

.PHONY=format
format:
	ghdl --format $(filename) > $(tmp_file)
	cp -u $(tmp_file) $(filename)

.PHONY=clean
clean:
	rm -f *.o *.out *.ghw *.cf *.vcd $(entity)

