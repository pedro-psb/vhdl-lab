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
end entity ripple_carry_adder;


architecture structural of ripple_carry_adder
is
    -- Declaracao dos sinais internos
    signal s_carry : std_logic_vector(2 downto 0);

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
    HA0: half_adder -- Instancia do half_adder para o bit 0
    port map (
        a => a(0),
        b => b(0),
        sum => sum(0),
        cout => s_carry(0)
    );

    FA1: full_adder -- Instancia do full_adder para o bit 1
    port map (
        a => a(1),
        b => b(1),
        cin => s_carry(0),
        sum => sum(1),
        cout => s_carry(1)
    );

    FA2: full_adder -- Instancia do full_adder para o bit 2
    port map (
        a => a(2),
        b => b(2),
        cin => s_carry(1),
        sum => sum(2),
        cout => s_carry(2)
    );

    FA3: full_adder -- Instancia do full_adder para o bit 3
    port map (
        a => a(3),
        b => b(3),
        cin => s_carry(2),
        sum => sum(3),
        cout => cout
    );

end architecture structural;
