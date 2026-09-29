# RV32I Single-Cycle Processor Core (SystemVerilog)

A synthesizable, single-cycle RISC-V RV32I CPU core written in SystemVerilog. This project features an automated assembly compilation toolchain, automated simulation execution via ModelSim, waveform dumping, and self-checking testbenches.

---

## 🏗 Architecture Overview

The core implements the **RV32I Base Integer Instruction Set** with a single-cycle datapath, executing one instruction per clock cycle.

* **Architecture Type:** Single-Cycle RISC-V 32-bit (RV32I)
* **Supported Instruction Types:** R-type, I-type, S-type, B-type, U-type, J-type
* **Language:** SystemVerilog (`always_ff`, `always_comb`, strongly typed logic)
* **Synthesis & Simulation Target:** Altera/Intel Quartus Prime, ModelSim / QuestaSim

### Datapath & Control Architecture
*(Include a diagram image here by placing a file inside `diagrams/`)*
![RISC-V Datapath](diagrams/datapath.png)

* **Fetch Unit:** Program counter (PC) logic with branch/jump address calculation.
* **Decode & Control:** Decodes opcode, funct3, and funct7 fields to generate ALU control signals, register write enables, and memory control logic.
* **Register File:** 32 x 32-bit general-purpose registers (x0 hardwired to zero).
* **ALU & Immediate Generator:** Full 32-bit arithmetic/logic unit and immediate sign-extension block.

---