library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_2BIT is
    Port (
        A  : in  STD_LOGIC_VECTOR(1 downto 0);
        B  : in  STD_LOGIC_VECTOR(1 downto 0);
        EQ : out STD_LOGIC;
        GT : out STD_LOGIC;
        LT : out STD_LOGIC
    );
end COMPARATOR_2BIT;

architecture Gate_Level of COMPARATOR_2BIT is

    signal eq1, eq0 : STD_LOGIC;

begin

    -- XNOR using XOR + NOT
    eq1 <= not (A(1) xor B(1));
    eq0 <= not (A(0) xor B(0));

    -- Equality
    EQ <= eq1 and eq0;

    -- Greater Than
    GT <= (A(1) and (not B(1))) or
          (eq1 and A(0) and (not B(0)));

    -- Less Than
    LT <= ((not A(1)) and B(1)) or
          (eq1 and (not A(0)) and B(0));

end Gate_Level;