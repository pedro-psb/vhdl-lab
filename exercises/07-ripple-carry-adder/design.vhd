library ieee;
use ieee.std_logic_1164.all;
use  ieee.numeric_std.all;


entity ripple_carry_adder is
    generic (
        N : integer := 4
    );
    port (
        a    : in  std_logic_vector (N-1 downto 0);	-- First input operand
        b    : in  std_logic_vector (N-1 downto 0);	-- Second input operand
        cout : out std_logic;				                -- Carry output bit
        sum  : out std_logic_vector (N-1 downto 0)	-- Sum output vector
    );
end entity;


architecture structural of ripple_carry_adder
is
    -- Declaracao dos sinais internos
    signal s_carry : std_logic_vector(N - 1 downto 0);

    -- Declaração dos componentes internos que serao utilizados
    component  half_adder is
        port (
            a    : in  std_logic;  -- First input bit
            b    : in  std_logic;  -- Second input bit
            sum  : out std_logic;  -- Sum output bit
            cout : out std_logic   -- Carry output bit
        );
    end component;
    
    component full_adder is
        port (
            a    : in  std_logic;  -- First input bit
            b    : in  std_logic;  -- Second input bit
            cin  : in  std_logic;  -- Carry-in bit
            sum  : out std_logic;  -- Sum output bit
            cout : out std_logic   -- Carry-out output bit
        );
    end component;
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
