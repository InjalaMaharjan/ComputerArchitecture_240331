## lab2:VHDL code for realizing logic gates

## Objective:

To write VHDL code for basic logic gates:AND,OR,NOT,NAND,NOR,XOR and XNOR.

To simulate each gate and verify its truth table using GTKWave.

# Theory

Logic gates are the fundamental building blocks of all digital circuits.Each gate performs a basic Boolean operation on one or more binary inputs to produce a single binary output.

<img width="523" height="226" alt="Screenshot (11)" src="https://github.com/user-attachments/assets/eeb93786-d3a5-4f8c-9566-fdb56b558dc1" />

# VHDL Code 
``` vhdl
AND Gate
and gate.vhd 
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity AND_GATE is port ( 
A : in std_logic;
B : in std_logic; 
Y : out std_logic ); 
end entity AND_GATE; 
architecture Dataflow of AND_GATE is 
begin 
  Y <= A and B;
end architecture Dataflow;

# OR Gate
or gate.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity OR_GATE is port (
 A : in std_logic;
 B : in std_logic;
 Y : out std_logic );
 end entity OR_GATE;
architecture Dataflow of OR_GATE is begin
Y <= A or B;
end architecture Dataflow;```

NOT Gate
not gate.vhd
library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
entity NOT_GATE is port (
 A : in std_logic;
 Y : out std_logic
);
end entity NOT_GATE;
architecture Dataflow of NOT_GATE is
begin
 Y <= not A;
end architecture Dataflow;

NAND Gate
nand gate.vhd
 library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
entity NAND_GATE is port(
  A : in std_logic;
  B : in std_logic;
  Y : out std_logic
);
end entity NAND_GATE;
architecture Dataflow of NAND_GATE is
 begin
Y <= A nand B;
end architecture Dataflow;

NOR Gate
nor gate.vhd
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity NOR_GATE is
port (
A : in std_logic ;
B : in std_logic ;
Y : out std_logic
) ;
end entity NOR_GATE ;
architecture Dataflow of NOR_GATE is
begin
Y <= A nor B ;
end architecture Dataflow ;

XOR Gate
xor gate.vhd
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity XOR_GATE is
port (
A : in std_logic ;
B : in std_logic ;
Y : out std_logic
) ;
end entity XOR_GATE ;
architecture Dataflow of XOR_GATE is
begin
Y <= A xor B ;
end architecture Dataflow ;

XNOR Gate
xnor gate.vhd
library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL ;
entity XNOR_GATE is
port (
    A : in std_logic ;
B : in std_logic ;
Y : out std_logic
) ;
end entity XNOR_GATE ;
architecture Dataflow of XNOR_GATE is
begin
Y <= A xnor B ;
end architecture Dataflow ;

Testbench: All Gates Combined
 A single testbench instantiates all gates simultaneously and applies the four input combinations.
gates tb.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GATES_TB is
end GATES_TB;

architecture behavior of GATES_TB is

signal A, B : std_logic := '0';
signal AND_OUT, OR_OUT, NOT_OUT, NAND_OUT, NOR_OUT, XOR_OUT, XNOR_OUT : std_logic;

begin

U1: entity work.and_gate port map (A, B, AND_OUT);
U2: entity work.or_gate port map (A, B, OR_OUT);
U3: entity work.not_gate port map (A, NOT_OUT);
U4: entity work.nand_gate port map (A, B, NAND_OUT);
U5: entity work.nor_gate port map (A, B, NOR_OUT);
U6: entity work.xor_gate port map (A, B, XOR_OUT);
U7: entity work.xnor_gate port map (A, B, XNOR_OUT);

process
begin
    A <= '0'; B <= '0'; wait for 10 ns;
    A <= '0'; B <= '1'; wait for 10 ns;
    A <= '1'; B <= '0'; wait for 10 ns;
    A <= '1'; B <= '1'; wait for 10 ns;
    wait;
end process;
end architecture Simulation;

Simulation
 Analyze all design files together,then elaborate and run the testbench:
 ghdl-a and_gate.vhd or_gate.vhd not_gate.vhd nand_gate.vhd nor_gate. vhd xor_gate.
    vhd xnor_gate.vhd gates_tb.vhd
ghdl-e GATES_TB
ghdl-r GATES_TB--vcd=simulation.vcd
gtkwave simulation.vcd

ExpectedTruthTable
<img width="559" height="130" alt="Screenshot (13)" src="https://github.com/user-attachments/assets/453f3c9c-01ec-4ea1-bfb2-b875647507e6" />

```

## Conclusion
In this lab,we successfully implemented the VHDL code for various fundamental logic gates,including AND,OR,NOT,NAND,NOR,XOR,and XNOR.
By utilzing GTKWave for simulation,weverified the timing diagrams and functional outputs of each gate against their respective truth tables.











