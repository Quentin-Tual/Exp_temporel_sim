library ieee;
use ieee.std_logic_1164.all;

entity nor2_d is
    port (
        a : in std_logic;
        b : in std_logic;
        o : out std_logic
    );
end nor2_d;

architecture rtl of nor2_d is

begin

    o <= a nor b after 10 ns;

end architecture;