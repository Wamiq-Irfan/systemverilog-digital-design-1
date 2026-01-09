

## Project Overview:

This repository contains the design and functional verification of three essential combinational circuits: a **32-bit Adder**, an **8-to-3 Priority Encoder**, and a **32-bit Barrel Shifter**. All modules are implemented using **SystemVerilog** and verified via self-checking testbenches.

## 🛠 Circuit Designs

### 1. 32-bit Adder


**Function**: Executes 32-bit unsigned addition with carry-handling.



**Interface**: Inputs include `a[31:0]`, `b[31:0]`, and `cin`; outputs include `sum[31:0]` and `cout`.



**Verification**: Includes edge cases like  and maximum overflows ().



### 2. 8-to-3 Priority Encoder


**Function**: Converts an 8-bit input into a 3-bit binary output based on priority logic.



**Features**: Includes a `valid` output signal to indicate active inputs.



**Verification**: Tested with single-bit, multi-bit, and all-zero patterns.



### 3. 32-bit Barrel Shifter

 
**Function**: Performs high-speed logical shifts (left or right) within a single cycle.



**Control**: A `dir` input selects direction (0 for Left, 1 for Right), and a 5-bit `shift_amt` defines the distance.


 
**Verification**: Automated comparison against a reference model for random test cases.



## 🔍 Verification Methodology

Each design includes a **Self-Checking Testbench** following these standards:


**Automated Checking**: Testbenches internally compute expected values and compare them against DUT output.



**Comprehensive Reporting**: Logs `PASS/FAIL` messages and provides a final summary.



**Randomized Testing**: Heavy use of `$random` ensures functional coverage.




## 📊 Simulation Results

### Waveform Analysis

32-Bit Adder:
<img width="893" height="487" alt="image" src="https://github.com/user-attachments/assets/fd75d563-a2b7-4311-8e21-a3a2d9cba35e" />


8-to-3 Priority Encoder:
<img width="863" height="604" alt="image" src="https://github.com/user-attachments/assets/8471a202-d5c4-4e8a-b79c-e453e865cb71" />


32-bit Barrel Shifter:
<img width="868" height="638" alt="image" src="https://github.com/user-attachments/assets/fd1bd605-7c5c-441e-887d-535cc97964ba" />
