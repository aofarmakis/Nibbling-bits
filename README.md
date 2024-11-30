# NibbleBuddy
This repository contains the design and documentation for a very simple 4-bit processor named NibbleBuddy. It's an educational tool meant to show how one defines an Instruction Set Architecture (ISA), builds it using discrete gates and MSI components (multiplexers, flip-flops etc), examines N-operand machines and develops a rudimentary ecosystem for said processor, that being an HDL-based design and an assembler to transform Assembly code into machine code.

## Processor diagram
![NibbleBuddy's Architecture Diagram](Images/CPU%20all.png)
*Figure 1: NibbleBuddy's Architecture Diagram.*

## Instructions
NibbleBuddy supports immediate and direct addressing modes wherever applicable, and is an accumulator-based architecture. The instructions supported are as follows:
- HALT
- STA
- LDA
- ADC
- NOR
- SETC
- JNZ
- JNC
- JMP

## Memory
NibbleBuddy is a 4-bit Harvard memory architecture processor with a 5-bit program counter and a 4-bit data memory address bus. Thus, it is limited to 32 instructions at most and 16 4-bit data memory addresses.
