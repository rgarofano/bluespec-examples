###################################################
# Bluespec Makefile by Ryan Garofano		  #
# © Copyright 2024				  #
###################################################

# Usage

# make rtl
# Generates equivalent verilog files for each .bsv design file

# make sim
# Generates a "sim" executable that runs the testbench in C

# make run
# Runs the testbench and outputs the waveform to "dump.vcd"

# make clean
# Deletes all the files generated from the build process
# Verilog files, sim executable, sim shared object file,
# and any generated waveforms (.vcd files) are not deleted

# make all
# Runs everything desribed above in sequential order

###################################################
# Edit the following on a per project basis       #
###################################################

TESTBENCH = TbMyCounter.bsv
TOP_LEVEL_MODULE = mkTbCounter
DEPENDENCIES = TbMyCounter.bsv MyCounter.bsv

###################################################
# Do not edit (unless you know what you're doing) #
###################################################

BSC = bsc
CFLAGS = -u -verilog
SFLAGS = -u -sim
OUTPUT = sim

all: rtl sim run clean

rtl: $(DEPENDENCIES)
	$(BSC) $(CFLAGS) $(TESTBENCH)

sim: $(DEPENDENCIES)
	$(BSC) $(SFLAGS) $(TESTBENCH)
	$(BSC) $(SFLAGS) -e $(TOP_LEVEL_MODULE) -o $(OUTPUT) $(TOP_LEVEL_MODULE).ba

run: $(OUTPUT) $(OUTPUT).so
	./$(OUTPUT) -V dump.vcd

clean:
	rm -rf *.ba *.bo *.o *.cxx *.h
