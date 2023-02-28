library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.delayed_operators.all;

entity circ01_seq is
    port (
        clk : in std_logic;
        i : in std_logic_vector(3 downto 0);
        o : out std_logic_vector(1 downto 0)
    );
end entity;

architecture rtl of circ01_seq is
    signal s11, s12, s21 : std_logic;
    signal tmp : std_logic; -- For dummy condition willingly added 
begin

-- Component takes two cycles to get an output so ther is one register barrier

    process(clk)
    begin
        if clk = '1' then
            and_d(i(0), i(1), tmp);
            and_d(tmp, tmp, s11); -- Dummy Condition willingly added 
            or_d(i(2), i(3), s12);
        end if;
    end process;

    process(clk)
    begin
        if clk = '1' then
            xor_d(s11, s12, s21);
            and_d(s11, s21, o(0));
            o(1) <= s21;
        end if;
    end process;
    
end architecture;