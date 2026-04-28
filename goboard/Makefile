# Makefile for FPGA build and flash

# Inputs (DIR must be provided on command line, e.g., make DIR=1-start build)
DIR ?=

# Auto-detect Verilog file in the directory
VERILOG_FILES = $(wildcard $(DIR)/*.v)
FILE = $(notdir $(VERILOG_FILES))

# Derived variables
TOP = $(basename $(FILE))
JSON = $(DIR)/$(TOP).json
ASC = $(DIR)/$(TOP).asc
BIN = $(DIR)/$(TOP).bin

.PHONY: build flash

build: $(BIN)

$(JSON): $(DIR)/$(FILE)
	yosys -p "synth_ice40 -top $(TOP) -json $(JSON)" $(DIR)/$(FILE)

$(ASC): $(JSON)
	nextpnr-ice40 --hx1k --package vq100 --json $(JSON) --pcf pins.pcf --asc $(ASC)

$(BIN): $(ASC)
	icepack $(ASC) $(BIN)

flash: $(wildcard $(DIR)/*.bin)
	iceprog $<