library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mean_4_clocks is
    generic (
        W       :       integer := 32
    );
    port (
        CLK     : in    std_logic;
        RESET   : in    std_logic;
        INPUT   : in    std_logic_vector(W - 1 downto 0);
        OUTPUT  : out   std_logic_vector(W - 1 downto 0)
    );
end mean_4_clocks;

-- Implement the testbench and find the errors in this model.
-- Consider the following expected behavior:
--      Every rising edge of CLK input, the content of INPUT
--      is added to a register chain and used to calculate the
--      mean value over 4 clock periods

architecture mean_arch of mean_4_clocks is
    signal reg1, reg2, reg3, reg4 : unsigned(W - 1 downto 0);
    signal tmp : unsigned(W - 1 downto 0);
begin
    process(CLK, RESET) is
        variable sum : unsigned(W + 1 downto 0); -- armazena soma temporaria com espaco extra
        variable mean : unsigned(W - 1 downto 0); -- armazena soma temporaria
    begin
        if (RESET = '1') then
      			reg1 <= to_unsigned(0, W);
      			reg2 <= to_unsigned(0, W);
      			reg3 <= to_unsigned(0, W);
      			reg4 <= to_unsigned(0, W);
      			tmp <= to_unsigned(0, W);
        elsif (rising_edge(CLK)) then
            reg1 <= unsigned(INPUT);
            reg2 <= reg1;
            reg3 <= reg2;
            reg4 <= reg3;
            sum := resize(unsigned(input), sum'length) +
                resize(reg1, sum'length) +
                resize(reg2, sum'length) +
                resize(reg3, sum'length);
            mean := RESIZE(SHIFT_RIGHT(sum, 2), mean'length);
            tmp <= mean;
        end if;

    end process;
    output <= std_logic_vector(tmp);

end;
