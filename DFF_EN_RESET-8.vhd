----------------------------------------------------------------------------
-- Entity:        DFF_EN_RESET
-- Written By:    Matthew Strauss
-- Date Created:  8 Oct 20
-- Description:   VHDL model of a D flip-flop with enable and reset
--
-- Revision History (10/08/2020, MS, update DF_EN_RESET skeleton to meet the specs of Lab07):
--
-- Dependencies:
--   (none)
----------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity DFF_EN_RESET is
    port (
        D     : in  STD_LOGIC;
        CLK   : in  STD_LOGIC;
        EN    : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        Q     : out STD_LOGIC
    );
end entity;
----------------------------------------------------------------------------

architecture Structural of DFF_EN_RESET is

    component Mux2to1 is
        port (
            D0  : in  STD_LOGIC;
            D1  : in  STD_LOGIC;
            SEL : in  STD_LOGIC;
            Y   : out STD_LOGIC
        );
    end component;

    component DFF is
        port (
            D    : in  STD_LOGIC;
            CLK  : in  STD_LOGIC;
            Q    : out STD_LOGIC
        );
    end component;
    

    -- internal signals
    signal n1 : STD_LOGIC;
    signal n2 : STD_LOGIC;
    signal n3 : STD_LOGIC;
    signal Q_int : STD_LOGIC;


begin

n1 <= D and not RESET;
n2 <= RESET or EN;
Q <= Q_int; 

    Mux2to1A: Mux2to1 
    port map (
        D0    => Q_int,
        D1    => n1,
        SEL   => n2,
        Y     => n3
    );
    
    DFF1: DFF 
    port map (
        D    => n3,
        CLK  => CLK,
        Q    => Q_int
    );


end architecture;
