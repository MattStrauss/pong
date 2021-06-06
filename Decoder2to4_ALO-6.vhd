----------------------------------------------------------------------------
-- Entity:        Decoder2to4_ALO
-- Written By:    Matt Strauss
-- Date Created:  30 Sep 20
-- Description:   VHDL model of a 2 to 4 decoder with active low outputs
--
-- Revision History (09/30/2020, MS, update basic skeleton to meet the Lab06 specs):
--
-- Dependencies:
--   (none)
----------------------------------------------------------------------------
library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;

----------------------------------------------------------------------------
entity Decoder2to4_ALO is
    port (
        A : in  STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity;
----------------------------------------------------------------------------

architecture Structural of Decoder2to4_ALO is

begin

    Y(3) <= not A(1) or not A(0);
    Y(2) <= not A(1) or A(0);
    Y(1) <= A(1) or not A(0);
    Y(0) <= A(1) or A(0);

end architecture;
