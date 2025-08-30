# VHDL Lab

Laboratory for working with VHDL simulations.

## Quickstart

### Running a single design+test file

```bash
# Analyze step -- Create .o files with your entity
$ ghdl -a module.vhdl

# Elaborate step -- create executable from .o files
$ ghdl -e module.vhdl

# Run step -- executes the binary and genereates wave file
$ ghdl -r module.vhdl --wave=wave.ghw

# Vizualize waves
$ gtkwave wave.ghw
```

### Using separate testbench and design files

> TODO: example with module + testbench
