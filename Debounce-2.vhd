----------------------------------------------------------------------------
-- Entity:        Debounce
-- Written By:    Matthew Strauss
-- Date Created:  11/07/2020
-- Description:   VHDL model of a debouncer
--
-- Revision History (11/07/2020, MS, Create debounce entity's logic):
--
-- Dependencies:
--   DFF_EN_RESET
----------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity Debounce is
    port (
        D     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        PULSE : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end entity;
----------------------------------------------------------------------------

architecture Structural of Debounce is

    component DFF_EN_RESET is
        port (
            D     : in  STD_LOGIC;
            CLK   : in  STD_LOGIC;
            EN    : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            Q     : out STD_LOGIC
        );
    end component;

        -- internal signals
        signal D2 : STD_LOGIC;
        signal Q2 : STD_LOGIC;

    begin
    
        Q <= D2 and Q2;

        DFF_ER_1: DFF_EN_RESET 
        port map (
            D => D,
            CLK => CLK,
            EN => PULSE,
            RESET => '0',
            Q => D2
        );
        
        DFF_ER_2: DFF_EN_RESET 
        port map (
            D => D2,
            CLK => CLK,
            EN => PULSE,
            RESET => '0',
            Q => Q2
        );
    
end architecture;
