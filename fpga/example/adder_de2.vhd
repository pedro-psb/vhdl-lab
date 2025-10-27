-- Adder DE2 FPGA implementation

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity adder_de2 is port (
    CLOCK_50 : in  std_logic;  -- Clock 50MHz
    KEY : in std_logic_vector(3 downto 0);  -- Push buttons (active low)
    SW : in std_logic_vector(17 downto 0);  -- Slide switches
    LEDR : out std_logic_vector(17 downto 0);  -- Red LEDs
    LEDG : out std_logic_vector(8 downto 0)   -- Green LEDs
); end entity;


architecture structural of adder_de2
is
    -- Components
    component adder is
        generic ( N : integer );
        port (
            a, b : in  std_logic_vector (N-1 downto 0);
            cout : out std_logic;
            sum  : out std_logic_vector (N-1 downto 0)
        );
    end component;

    -- Internal signals
    signal clk, reset_n : std_logic;

    constant N : integer := 3;
    signal a, b, sum : std_logic_vector(N-1 downto 0);
    signal cout : std_logic;
begin
    -- General assigments
    clk <= CLOCK_50;
    reset_n <= KEY(0);

    a <= SW(N-1 downto 0);  -- e.g: N=3 => 2 downto 0
    b <= SW((2*N)-1 downto N); -- e.g: N=3 => 5 downto 3
    sum <= LEDR(N-1 downto 0);
    cout <= LEDR(N);

    -- Main components
    main: adder
    generic map( N => N )
    port map (
        a => a,
        b => b,
        cout => cout,
        sum => sum
    );
end architecture;
