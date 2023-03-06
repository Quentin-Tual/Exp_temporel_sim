library ieee;
use ieee.std_logic_1164.all;

entity not_d is
    port (
        a : in std_logic;
        b : in std_logic;
        o : out std_logic
    );
end not_d;

architecture rtl of not_d is

begin

    o <= not(a) after 10 ns;

end architecture;