library ieee;
use ieee.std_logic_1164.all;

entity nand2_d is
    port (
        a : in std_logic;
        b : in std_logic;
        o : out std_logic
    );
end nand2_d;

architecture rtl of nand2_d is

begin

    o <= a nand b after 10 ns;

end architecture;