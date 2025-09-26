entity=dec3x8
filename=$(entity).vhdl
tmp_file=/tmp/$(filename)

$(entity): $(entity).vhdl
	ghdl -a $<
	ghdl -e $@

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
	rm -f *.o *.out *.ghw *.cf $(entity)

