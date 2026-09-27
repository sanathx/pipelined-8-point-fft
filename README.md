# SystemVerilog-Based Pipelined 8-Point FFT Processor

A custom RTL implementation of an 8-point Radix-2 Decimation-in-Time (DIT) Fast Fourier Transform (FFT) processor using SystemVerilog and Xilinx Vivado.

The project implements the FFT architecture from the ground up using hierarchical RTL design, including complex arithmetic, fixed-point representation, twiddle-factor ROMs, butterfly processing elements, and pipelined FFT stages.

---

## Project Overview

The Fast Fourier Transform (FFT) is an efficient algorithm for computing the Discrete Fourier Transform (DFT), converting a discrete time-domain signal into its frequency-domain representation.

This project implements an **8-point Radix-2 DIT FFT** entirely in SystemVerilog without relying on a vendor FFT IP core.

The design is structured hierarchically so that the fundamental FFT operations are implemented as reusable hardware modules.

### Design Flow

```text
Input Samples
     │
     ▼
┌───────────────┐
│   FFT Stage 1 │
│  4 Butterflies│
└───────┬───────┘
        │
        ▼
┌───────────────┐
│   FFT Stage 2 │
│  4 Butterflies│
└───────┬───────┘
        │
        ▼
┌───────────────┐
│   FFT Stage 3 │
│  4 Butterflies│
└───────┬───────┘
        │
        ▼
   FFT Outputs