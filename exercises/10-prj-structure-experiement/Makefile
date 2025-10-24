entity ?= tb_dec3x8

$(entity): src/*.vhd
	mkdir -p work
	ghdl -i --std=08 --workdir=work src/*.vhd
	ghdl -m --std=08 --workdir=work $(entity)

.PHONY=run
run: $(entity)
	ghdl -r --std=08 --workdir=work $(entity) --vcd=wave.vcd

.PHONY=wave
wave: run
	gtkwave wave.vcd

.PHONY=format
format:
	ghdl --format --std=08 $(filename) > $(tmp_file)
	cp -u $(tmp_file) $(filename)

.PHONY=clean
clean:
	rm -f *.o *.out *.ghw *.vcd
	ghdl --remove --std=08 --workdir=work

