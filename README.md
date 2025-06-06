# MiniCPU_Verilog
This project simulates a 4-bit MiniCPU with:

- ALU supporting ADD, SUB, AND, OR
- Register File with 4 registers
- Control Unit for opcode decoding
- Testbench with GTKWave visualization

## Tools Used
- Verilog (Icarus Verilog)
- GTKWave

## To Simulate
```bash
iverilog -o MiniCPU.vvp MiniCPU_tb.v MiniCPU.v ALU.v RegisterFile.v ControlUnit.v
vvp MiniCPU.vvp
gtkwave MiniCPU.vcd
