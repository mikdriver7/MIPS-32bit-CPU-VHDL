# COEN 316: 32-Bit MIPS Processor Implementation

A fully functional 32-bit MIPS processor designed in VHDL, synthesized for a Nexys A7 FPGA board. This project was the capstone assignment for the Computer Design and Architecture course (COEN 316) at Concordia University.

## Project Overview

This project integrates all major components of a CPU—designed in previous labs—into a complete, working processor. The datapath and control unit work in concert to execute a custom program loaded into instruction memory.

**Key Features:**
- **ISA Support:** Implements 20 instructions covering R-type (e.g., `add`, `sub`, `and`), I-type (e.g., `addi`, `lw`, `sw`), and J-type (e.g., `j`, `jr`) operations.
- **Full Integration:** Combines the PC register, instruction/data caches, register file, ALU, sign-extension unit, and next-address logic.
- **FPGA Proven:** Synthesized, implemented, and tested on a **Nexys A7-100T** FPGA board using Xilinx Vivado.
- **Board Wrapped:** The 32-bit internal architecture is mapped to 4-bit outputs for display on the board's LEDs.

## Architecture & Design

The processor follows a classic MIPS design pattern. The control unit decodes the instruction opcode and function bits to generate all necessary control signals for the datapath.

### Top-Level Block Diagram
<img width="1534" height="813" alt="Screenshot 2025-09-13 at 9 28 50 PM" src="https://github.com/user-attachments/assets/855023ea-a155-4d25-ae70-71e555471d4a" />
