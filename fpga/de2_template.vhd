-- ==============================================================================
-- DE2 FPGA Board Template
-- ==============================================================================
-- This template provides a top-level entity for the DE2 board with
-- some I/O pins mapped according to the pin assignment file.
--
-- Features:
--   - 50 MHz and 27 MHz clocks
--   - 4 push buttons (KEY)
--   - 18 slide switches (SW)
--   - 18 red LEDs (LEDR) and 9 green LEDs (LEDG)
--
-- Usage:
--   1. Instantiate your components within the architecture
--   2. Connect signals as needed
--   3. Assign pin locations using the provided CSV file or constraints
-- ==============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity de2_template is port (
    CLOCK_50 : in  std_logic;  -- Clock 50MHz
    KEY : in std_logic_vector(3 downto 0);  -- Push buttons (active low)
    SW : in std_logic_vector(17 downto 0);  -- Slide switches
    LEDR : out std_logic_vector(17 downto 0);  -- Red LEDs
    LEDG : out std_logic_vector(8 downto 0)   -- Green LEDs
); end entity;


architecture structural of de2_template
is
    -- Components
    component sample is port (
        clk   : in  std_logic;
        reset : out std_logic
    ); end component;

    -- Internal signals
    signal clk, reset_n : std_logic;
begin
    -- General assigments
    clk <= CLOCK_50;
    reset_n <= KEY(0);

    -- Main components
    main: sample port map (
        clk => clk,
        reset => reset_n
    );
end architecture;
