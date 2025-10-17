library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        a       : in  std_logic;            -- First input bit
        b       : in  std_logic;            -- Second input bit
        cin     : in  std_logic;            -- Carry-in bit
        sum     : out std_logic;            -- Sum output bit
        cout     : out std_logic             -- Carry-out output bit
    );
end entity full_adder;

architecture behavioral of full_adder is
begin

    process(a, b, cin)
    begin
        -- Calculate sum and carry-out
        sum <= a xor b xor cin;                -- Sum is the XOR of a, b, and cin
        cout <= (a and b) or (cin and (a xor b)); -- Carry-out is generated based on the inputs
    end process;

end architecture behavioral;
