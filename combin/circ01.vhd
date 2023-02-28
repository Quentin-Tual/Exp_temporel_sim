library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.delayed_operators.all;

entity circ01 is
    port (
        i : in std_logic_vector(3 downto 0);
        o : out std_logic_vector(1 downto 0)
    );
end entity;

architecture rtl of circ01 is
    signal s11, s12, s21 : std_logic;
begin

    and_d(i(0), i(1), s11);
    or_d(i(2), i(3), s12);
    xor_d(s11, s12, s21);
    and_d(s11, s21, o(0));
    o(1) <= s21;

end architecture;