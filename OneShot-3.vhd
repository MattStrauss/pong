----------------------------------------------------------------------------
-- Entity:        OneShot
-- Written By:    Matthew Strauss
-- Date Created:  10/28/202
-- Description:   VHDL model of a one-shot (rising edge detector)
--
-- Revision History (10/28/2020, MMS, implement logic for OneShot with logic and register):
--
-- Dependencies:
--   DFF
----------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity OneShot is
    port (
        D     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end entity;
----------------------------------------------------------------------------

architecture Structural of OneShot is

    component DFF is
        port (
            D    : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC
        );
    end component;

-- internal signals --
signal S0_plus : STD_LOGIC; 
signal S0_int : STD_LOGIC;

begin

    S0_plus <= not(D); 

    dFF1: DFF
        port map (
            D => S0_plus, 
            CLK  => CLK,
            Q  => S0_int
        );
        
      Q <= S0_int and D; 

end architecture;
