library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.delayed_operators.all;

entity mod_circ01 is
    port (
        i : in std_logic_vector(3 downto 0);
        o : out std_logic_vector(1 downto 0)
    );
end entity;

architecture rtl of mod_circ01 is

    signal s11,s12 : std_logic;

    -- Added signals 
    signal s21, s22, s23 : std_logic; -- could have been named sHT1 and sHT2

begin

    P11 : and2_d port map (i(0), i(1), s11);
    P12 : or2_d port map (i(2), i(3), s12);
    P21 : xor2_d port map (s11, s12, s21);
    o(1) <= s21;
    
    -- Added/modified relations 
    P22 : and2_d port map (s11, s12, s23);
    P23 : xor2_d port map (s11, s23, s22); 
    P24 : and2_d port map (s22,s21, o(0));

end architecture;