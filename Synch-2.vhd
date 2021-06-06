----------------------------------------------------------------------------
-- Entity:        Synch
-- Written By:    Matthew Strauss
-- Date Created:  11/07/2020
-- Description:   VHDL model of a synchronizer
--
-- Revision History (11/07/2020, MS, Create logic for Sync):
--
-- Dependencies:
--   DFF
----------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity Synch is
    port (
        D     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end entity;
----------------------------------------------------------------------------

architecture Structural of Synch is

    component DFF is
        port (
            D    : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC
        );
    end component;
    
    -- internal signals --
    signal D2: STD_LOGIC; 

begin

    dff_1: DFF
        port map (
            D => D,
            CLK => CLK,
            Q => D2
        );

    dff_2: DFF
        port map (
            D => D2,
            CLK => CLK,
            Q => Q
        );
        
    

end architecture;
