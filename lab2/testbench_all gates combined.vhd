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

end behavior;