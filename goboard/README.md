
### Setup

The setup is done on Ubuntu 24.04 VM

Install required tools for FPGA development

- yosys: synthesis
- nextpnr-ice40: place and route for ICE40 FPGA
- icepack: generate bitstream
- iceprog: flash the bitstream to FPGA

```bash
sudo apt update

sudo apt install -y \
  yosys \
  nextpnr-ice40 \
  fpga-icestorm \
  iverilog \
  gtkwave
```

### Commands


**Makefile**

Building project with single verilog file
```bash
# build the project
make DIR=1-start build

# flash the project to goboard
make DIR=1-start flash
```

Building project with multiple verilog file split into modules
```bash
# synthesis + place & route
# specify the top level module
make DIR=4_debounce_switch TOP=Debounce_Project_Top build

# flash
make DIR=4_debounce_switch TOP=Debounce_Project_Top flash

```


**Manual**

```bash
# synthesis
yosys -p "synth_ice40 -top top -json top.json" top.v

# place and route (goboard has clock frequency of 25 MHz; FPGA package is of type vq100)
nextpnr-ice40 --hx1k --package vq100 --freq 25 --json top.json --pcf pins.pcf --asc top.asc

# generate bitstream
icepack top.asc top.bin

# program
iceprog top.bin
```


**Example 1: Single File**
```bash
yosys -p "synth_ice40 -top Switches_To_LEDs -json 1-start/Switches_To_LEDs.json" 1-start/Switches_To_LEDs.v

# place and route
nextpnr-ice40 --hx1k --package vq100 --freq 25 --json 1-start/Switches_To_LEDs.json --pcf pins.pcf --asc 1-start/Switches_To_LEDs.asc

# generate bitstream
icepack 1-start/Switches_To_LEDs.asc 1-start/Switches_To_LEDs.bin

# program
iceprog 1-start/Switches_To_LEDs.bin
```

**Example 2: Multiple Files**

```bash
# synthesis
yosys -p "synth_ice40 -top Debounce_Project_Top -json 4_debounce_switch/Debounce_Project_Top.json" \
  4_debounce_switch/Debounce_Project_Top.v \
  4_debounce_switch/Debounce_Filter.v \
  4_debounce_switch/LED_Toggle_Project.v

# place and route
nextpnr-ice40 --hx1k --package vq100 --freq 25 \
  --json 4_debounce_switch/Debounce_Project_Top.json \
  --pcf pins.pcf \
  --asc 4_debounce_switch/Debounce_Project_Top.asc

# generate bitstream
icepack 4_debounce_switch/Debounce_Project_Top.asc 4_debounce_switch/Debounce_Project_Top.bin

# flash
iceprog 4_debounce_switch/Debounce_Project_Top.bin
```

## Development

Create a file with name e.g. `Sample.v` containing the module `Sample`

```v
module Sample
 (input  i_Switch_1,
  output o_LED_1);

  assign o_LED_1 = i_Switch_1;

endmodule
```