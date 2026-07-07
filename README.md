# Lab 6: VHDL Implementation of Code Converters
## BCD-to-Excess-3 and 4-bit Binary-to-Gray Code Converter

---

## Objective

The objectives of this laboratory are:

- To design and implement a **BCD-to-Excess-3 (XS-3) Code Converter** using VHDL.
- To design and implement a **4-bit Binary-to-Gray Code Converter** using VHDL.
- To simulate and verify both converters using **GHDL**.
- To analyze the generated waveforms using **GTKWave**.

---

# Theory

## 1. BCD-to-Excess-3 Converter

Excess-3 (XS-3) is a self-complementing decimal code obtained by adding **3 (0011₂)** to every valid BCD digit.

### Formula

```
XS3 = BCD + 0011
```

### Conversion Table

| Decimal | BCD | Excess-3 |
|---------:|:---:|:---------:|
|0|0000|0011|
|1|0001|0100|
|2|0010|0101|
|3|0011|0110|
|4|0100|0111|
|5|0101|1000|
|6|0110|1001|
|7|0111|1010|
|8|1000|1011|
|9|1001|1100|

---

## 2. Binary-to-Gray Converter

Gray code changes only **one bit** between consecutive numbers, reducing transition errors in digital systems.

### Boolean Equations

```
G3 = B3
G2 = B3 XOR B2
G1 = B2 XOR B1
G0 = B1 XOR B0
```

### Example

| Binary | Gray |
|:------:|:----:|
|0000|0000|
|0001|0001|
|0010|0011|
|0011|0010|
|0100|0110|
|1111|1000|

---

# Project Structure

```
Lab6/
│
├── bcd_to_xs3.vhd
├── bcd_xs3_tb.vhd
├── bin_to_gray.vhd
├── gray_tb.vhd
│
├── bcd_xs3.vcd
├── gray.vcd
│
├── work-obj93.cf
└── README.md
```

---

# VHDL Source Code

## 1. BCD-to-Excess-3 Converter

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_TO_XS3 is
    port(
        BCD : in std_logic_vector(3 downto 0);
        XS3 : out std_logic_vector(3 downto 0)
    );
end entity BCD_TO_XS3;

architecture Behavioral of BCD_TO_XS3 is
begin
    process(BCD)
    begin
        XS3 <= std_logic_vector(unsigned(BCD) + 3);
    end process;
end architecture Behavioral;
```

---

## 2. Binary-to-Gray Converter

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BIN_TO_GRAY is
    port(
        B : in std_logic_vector(3 downto 0);
        G : out std_logic_vector(3 downto 0)
    );
end entity BIN_TO_GRAY;

architecture Dataflow of BIN_TO_GRAY is
begin
    G(3) <= B(3);
    G(2) <= B(3) xor B(2);
    G(1) <= B(2) xor B(1);
    G(0) <= B(1) xor B(0);
end architecture Dataflow;
```

---

# Testbench Verification

The testbenches apply a sequence of input vectors with **10 ns intervals**.

### BCD-to-Excess-3 Test Inputs

|Time|BCD Input|Expected XS-3|
|----|---------|-------------|
|0 ns|0000|0011|
|10 ns|0001|0100|
|20 ns|0101|1000|
|30 ns|1001|1100|

---

### Binary-to-Gray Test Inputs

|Time|Binary|Expected Gray|
|----|------|-------------|
|0 ns|0000|0000|
|10 ns|0001|0001|
|20 ns|0010|0011|
|30 ns|0011|0010|
|40 ns|0100|0110|

---

# Compilation and Simulation

The project was simulated using **GHDL** and visualized using **GTKWave**.

## BCD-to-Excess-3

```bash
ghdl -a bcd_to_xs3.vhd bcd_xs3_tb.vhd

ghdl -e BCD_XS3_TB

ghdl -r BCD_XS3_TB --vcd=bcd_xs3.vcd

gtkwave bcd_xs3.vcd
```

---

## Binary-to-Gray

```bash
ghdl -a bin_to_gray.vhd gray_tb.vhd

ghdl -e GRAY_TB

ghdl -r GRAY_TB --vcd=gray.vcd

gtkwave gray.vcd
```

---

# Expected Simulation Results

## BCD-to-Excess-3

|BCD|XS-3|
|:--:|:--:|
|0000|0011|
|0001|0100|
|0101|1000|
|1001|1100|

---

## Binary-to-Gray

|Binary|Gray|
|:----:|:--:|
|0000|0000|
|0001|0001|
|0010|0011|
|0011|0010|
|0100|0110|

---

# Waveform Analysis

### BCD-to-Excess-3

- Every valid BCD input is incremented by **3**.
- The waveform confirms correct arithmetic conversion.
- The implementation uses the `numeric_std` package for unsigned arithmetic.

### Binary-to-Gray

- The MSB remains unchanged.
- Remaining bits are generated using XOR operations.
- Consecutive Gray codes differ by only one bit, validating correct operation.

---

# Conclusion

The laboratory successfully implemented two common digital code converters using VHDL.

- The **BCD-to-Excess-3 Converter** was implemented using **behavioral modeling**, where the conversion was achieved by adding a constant value of **3** to the input BCD code.

- The **Binary-to-Gray Converter** was implemented using **dataflow modeling**, employing XOR operations to generate Gray code directly from the binary input.

Simulation using **GHDL** and waveform verification in **GTKWave** confirmed that both converters produced outputs matching the theoretical conversion tables for all tested input combinations. The project demonstrates the use of behavioral and dataflow modeling techniques for combinational logic design in VHDL.

---


