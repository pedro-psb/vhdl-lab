-- Ripple Full Adder - Somador binaario para entradas de tamanho N
--
-- input:
--   a, b:  N bits
-- output:
--   output: N bit
--   cout: 1 bit

library ieee;
use ieee.std_logic_1164.all;
use  ieee.numeric_std.all;


entity generic_adder is
    generic ( N : integer := 4 );
    port (
        a, b : in  std_logic_vector (N-1 downto 0);
        cout : out std_logic;
        sum  : out std_logic_vector (N-1 downto 0)
    );
end entity;


architecture structural of generic_adder
is
    -- sinais internos
    signal s_carry : std_logic_vector(N - 1 downto 0);

    -- componentes internos
    component  half_adder is port (
        a, b : in  std_logic;
        sum, cout : out std_logic
    ); end component;

    component full_adder is port (
        a, b, cin : in  std_logic;
        sum, cout  : out std_logic
    ); end component;
begin
    -- Instancia do half_adder para o bit 0
    HA0 : half_adder port map (
        a => a(0),
        b => b(0),
        sum => sum(0),
        cout => s_carry(0)
    );

    -- Instancia full_adders de acordo com generic N
    gen_fa : for i in 1 to N - 1 generate
        FA: full_adder port map (
            a => a(i),
            b => b(i),
            cin => s_carry(i-1),
            sum => sum(i),
            cout => s_carry(i)
        );
    end generate;

    -- Conecta sinal interno com cout do componente
    cout <= s_carry(N-1);
end architecture;
