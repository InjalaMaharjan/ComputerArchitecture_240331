# Title
Lab 5: VHDL Code for Combinational Circuits: Comparator

# Objective
- To design and simulate a 2-bit magnitude comparator in VHDL.
- To understand how comparison operations are implemented in hardware.
- To verify the functionality of the comparator through simulation.

# Theory
A magnitude comparator is a combinational logic circuit that compares two binary numbers and determines whether they are equal, greater than, or less than each other.

For a 2-bit comparator with inputs:
- A = A1A0
- B = B1B0

The outputs are:
- **EQ (Equal):** HIGH when A = B
- **GT (Greater Than):** HIGH when A > B
- **LT (Less Than):** HIGH when A < B

Only one output is HIGH at any given time.

## Boolean Expressions

### Equal Condition
EQ = (A1 XNOR B1) · (A0 XNOR B0)

### Greater Than Condition
GT = A1·B1' + (A1 XNOR B1)·A0·B0'

### Less Than Condition
LT = A1'·B1 + (A1 XNOR B1)·A0'·B0

The comparator first compares the most significant bits (MSBs). If they are equal, the least significant bits (LSBs) are compared to determine the final result.
# Design File
Filename: comparator_2bit.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COMPARATOR_2BIT is
    port (
        A  : in  std_logic_vector(1 downto 0);
        B  : in  std_logic_vector(1 downto 0);
        EQ : out std_logic;  -- A = B
        GT : out std_logic;  -- A > B
        LT : out std_logic   -- A < B
    );
end entity COMPARATOR_2BIT;

architecture Behavioral of COMPARATOR_2BIT is
begin
    process (A, B)
    begin
        if unsigned(A) = unsigned(B) then
            EQ <= '1'; GT <= '0'; LT <= '0';
        elsif unsigned(A) > unsigned(B) then
            EQ <= '0'; GT <= '1'; LT <= '0';
        else
            EQ <= '0'; GT <= '0'; LT <= '1';
        end if;
    end process;
end architecture Behavioral;
# Testbench
Filename: comparator_tb.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_TB is
end entity COMPARATOR_TB;

architecture Simulation of COMPARATOR_TB is
    signal A, B        : std_logic_vector(1 downto 0) := "00";
    signal EQ, GT, LT  : std_logic;
begin
    DUT : entity work.COMPARATOR_2BIT
        port map (A => A, B => B, EQ => EQ, GT => GT, LT => LT);

    STIMULUS : process
    begin
        A <= "00"; B <= "00"; wait for 10 ns;  -- EQ = 1
        A <= "01"; B <= "00"; wait for 10 ns;  -- GT = 1
        A <= "00"; B <= "01"; wait for 10 ns;  -- LT = 1
        A <= "10"; B <= "11"; wait for 10 ns;  -- LT = 1
        A <= "11"; B <= "10"; wait for 10 ns;  -- GT = 1
        A <= "11"; B <= "11"; wait for 10 ns;  -- EQ = 1
        wait;
    end process;
end architecture Simulation;

# Output
![output1](calab5.png)
![output2](lab5outputt.png)

# Conclusion
The 2-bit magnitude comparator was successfully designed and simulated using VHDL. The outputs EQ, GT, and LT correctly indicated whether input A was equal to, greater than, or less than input B. The simulation results verified the correctness of the design and demonstrated the implementation of combinational logic circuits in VHDL.
```
