
entity=fn_f
filename=$(entity).vhdl
tmp_file=/tmp/$(filename)
bindir=bin

$(entity): $(entity).vhd
	ghdl -a $<
	ghdl -e $@
	timeout 0.1s ghdl -r $@ --wave=wave.ghw || true
	gtkwave wave.ghw

format:
	ghdl --format $(filename) > $(tmp_file)
	cp -u $(tmp_file) $(filename)

clean:
	rm -f *.o *.out *.ghw *.cf $(entity)

.PHONY=clean format
