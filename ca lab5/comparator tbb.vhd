library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_TB is
end entity COMPARATOR_TB;

architecture Simulation of COMPARATOR_TB is

    signal A, B : STD_LOGIC_VECTOR(1 downto 0);
    signal EQ, GT, LT : STD_LOGIC;

begin

    DUT : entity work.COMPARATOR_2BIT
    port map (
        A  => A,
        B  => B,
        EQ => EQ,
        GT => GT,
        LT => LT
    );

    STIMULUS : process
    begin
        A <= "00"; B <= "00"; wait for 10 ns;
        A <= "00"; B <= "01"; wait for 10 ns;
        A <= "00"; B <= "10"; wait for 10 ns;
        A <= "00"; B <= "11"; wait for 10 ns;

        A <= "01"; B <= "00"; wait for 10 ns;
        A <= "01"; B <= "01"; wait for 10 ns;
        A <= "01"; B <= "10"; wait for 10 ns;
        A <= "01"; B <= "11"; wait for 10 ns;

        A <= "10"; B <= "00"; wait for 10 ns;
        A <= "10"; B <= "01"; wait for 10 ns;
        A <= "10"; B <= "10"; wait for 10 ns;
        A <= "10"; B <= "11"; wait for 10 ns;

        A <= "11"; B <= "00"; wait for 10 ns;
        A <= "11"; B <= "01"; wait for 10 ns;
        A <= "11"; B <= "10"; wait for 10 ns;
        A <= "11"; B <= "11"; wait for 10 ns;

        wait;
    end process;

end architecture Simulation;