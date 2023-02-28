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

    and_d(i(0), i(1), s11);
    or_d(i(2), i(3), s12);
    xor_d(s11, s12, s21);
    o(1) <= s21;
    
    -- Added/modified relations 
    and_d(s11, s12, s23);
    xor_d(s11, s23, s22); 
    and_d(s22,s21, o(0));

end architecture;