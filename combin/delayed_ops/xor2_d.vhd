library ieee;
use ieee.std_logic_1164.all;

entity xor2_d is
    port (
        a : in std_logic;
        b : in std_logic;
        o : out std_logic
    );
end xor2_d;

architecture rtl of xor2_d is

begin

    o <= a xor b after 10 ns;

end architecture;