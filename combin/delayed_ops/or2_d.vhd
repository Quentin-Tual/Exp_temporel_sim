library ieee;
use ieee.std_logic_1164.all;

entity or2_d is
    port (
        a : in std_logic;
        b : in std_logic;
        o : out std_logic
    );
end or2_d;

architecture rtl of or2_d is

begin

    o <= a or b after 10 ns;

end architecture;