# Makefile for FPGA build and flash

# Inputs (DIR must be provided on command line, e.g., make DIR=1-start build)
DIR ?=

# Auto-detect Verilog files in the directory
VERILOG_FILES = $(wildcard $(DIR)/*.v)

# When there is only one file, use its basename automatically.
# For multi-file projects, set TOP explicitly, e.g. make DIR=4_debounce_switch TOP=Debounce_Project_Top build
TOP ?= $(basename $(notdir $(firstword $(VERILOG_FILES))))
JSON = $(DIR)/$(TOP).json
ASC = $(DIR)/$(TOP).asc
BIN = $(DIR)/$(TOP).bin

.PHONY: build flash

build: $(BIN)

$(JSON): $(VERILOG_FILES)
	yosys -p "synth_ice40 -top $(TOP) -json $(JSON)" $(VERILOG_FILES)

$(ASC): $(JSON)
	nextpnr-ice40 --hx1k --package vq100 --freq 25 --json $(JSON) --pcf pins.pcf --asc $(ASC)

$(BIN): $(ASC)
	icepack $(ASC) $(BIN)

flash: $(BIN)
	iceprog $(BIN)