library ieee;
use ieee.std_logic_1164.all;

entity and2_d is
    port (
        a : in std_logic;
        b : in std_logic;
        o : out std_logic
    );
end and2_d;

architecture rtl of and2_d is

begin

    o <= a and b after 10 ns;

end architecture;