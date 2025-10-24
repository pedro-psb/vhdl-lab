# Sample from GHDL docs

This is made available by [GHDL docs](https://ghdl.github.io/ghdl/quick_start/simulation/DLXModelSuite.html).

To run:

```bash
# contain temporary files of the compilation
mkdir work

# Import files
# This defines the correct import order required to build correctly.
# Genereaters a 'work-*.cf' file in /work
ghdl -i --workdir=work *.vhdl

# Analyze and elaborate (make)
# Creates the executable
ghdl -m --workdir=work dlx_test_behaviour

# Run
cp test_loop.out dlx.out  # some specific requirment of this project
ghdl -r --workdir=work dlx_test_behaviour

# Clean
ghdl --clean --workdir=work  # requires re-running the make step (-m)
ghdl --remove --workdir=work  # requires re-running the import step (-i)
```
