
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

```bash
# build the project
make DIR=1-start FILE=Switches_To_LEDs.v build

# flash the project to goboard
make DIR=1-start FILE=Switches_To_LEDs.v build
```

**Manual**

```bash
# synthesis
yosys -p "synth_ice40 -top top -json top.json" top.v

# place and route
nextpnr-ice40 --hx1k --package vq100 --json top.json --pcf pins.pcf --asc top.asc

# generate bitstream
icepack top.asc top.bin

# program
iceprog top.bin
```


**Manual**
```bash
yosys -p "synth_ice40 -top Switches_To_LEDs -json 1-start/Switches_To_LEDs.json" 1-start/Switches_To_LEDs.v

# place and route
nextpnr-ice40 --hx1k --package vq100 --json 1-start/Switches_To_LEDs.json --pcf pins.pcf --asc 1-start/Switches_To_LEDs.asc

# generate bitstream
icepack 1-start/Switches_To_LEDs.asc 1-start/Switches_To_LEDs.bin

# program
iceprog 1-start/Switches_To_LEDs.bin
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