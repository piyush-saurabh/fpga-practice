# FPGA Learning Repository

This repository is a hands-on learning space for exploring FPGA development across multiple boards and toolchains. It is designed to document experiments, projects, and workflows while building a solid understanding of digital design using Verilog and FPGA tools.

## Overview

The goal of this project is to:

* Learn FPGA design from the ground up
* Work with multiple FPGA development boards
* Understand the full toolchain (synthesis → place & route → bitstream generation → flashing)
* Maintain a structured archive of designs and experiments

Supported boards include (but are not limited to):

* [Go Board](https://nandland.com/the-go-board/)
* [Pynq Z1](https://digilent.com/shop/pynq-z1-python-productivity-for-zynq-7000-arm-fpga-soc)
* Other FPGA platforms as added over time


## Workflow

A typical FPGA workflow followed in this repo:

1. **Write Verilog**

   * Implement logic in `.v` files

2. **Add Constraints**

   * Define pin mappings and timing constraints

3. **Synthesis**

   * Convert RTL → gate-level netlist

4. **Place & Route**

   * Map design onto FPGA fabric

5. **Bitstream Generation**

   * Produce `.bit` / `.bin` file

6. **Flashing**

   * Upload to FPGA board

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/fpga-learning.git
cd fpga-learning
```

### 2. Pick a Board

Navigate to:

```
boards/<board-name>/
```

### 3. Follow Board Instruction

Read:

```
<board-name>/README.md
```

## Learning Approach

This repository is structured incrementally:

* Basic digital logic (LEDs, switches)
* Sequential logic (counters, FSMs)
* Communication protocols (UART, SPI, I2C)
* More advanced designs (as added)

Each design aims to include:

* Source code
* Constraints
* Build artifacts (optional)
* Notes / learnings


## Notes

* Intermediate files (synthesis, place & route outputs) may be large and are often excluded using `.gitignore`
* Some toolchains are platform-specific (Linux recommended for open-source flows)