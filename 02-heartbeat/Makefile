
entity=heartbeat
filename=$(entity).vhdl
tmp_file=/tmp/$(filename)

$(entity): $(entity).vhdl
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
