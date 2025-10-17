library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port (
        a    : in  std_logic;  -- First input bit
        b    : in  std_logic;  -- Second input bit
        sum  : out std_logic;  -- Sum output bit
        cout : out std_logic   -- Carry output bit
    );
end entity half_adder;

architecture behavioral of half_adder is
begin

    process(a, b)
    begin
        -- Calculate sum and carry
        sum <= a xor b;              -- Sum is the XOR of a and b
        cout <= a and b;             -- Carry is the AND of a and b
    end process;

end architecture behavioral;
