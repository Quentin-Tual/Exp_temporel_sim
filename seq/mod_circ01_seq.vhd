library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.delayed_operators.all;

entity mod_circ01_seq is
    port (
        clk : in std_logic;
        i : in std_logic_vector(3 downto 0);
        o : out std_logic_vector(1 downto 0)
    );
end entity;

architecture rtl of mod_circ01_seq is

    signal s11a, s11b, s12a, s12b : std_logic;
    signal tmp : std_logic; -- For dummy condition willingly added
    signal s31 : std_logic;

    -- Added signals 
    signal s21, s22, s23 : std_logic; -- could have been named sHT1 and sHT2
begin
    

    P11 : and2_d port map (i(0), i(1), s11a);
    P12 : or2_d port map (i(2), i(3), s12a);

    process (clk)
    begin
        if clk = '1' then
            s11b <= s11a;
            s12b <= s12a;
        end if;
    end process;

    P21 : and2_d port map (s11b, s12b, s23); -- added gate HT
    P22 : xor2_d port map (s11b, s23, s22); -- added gate HT
    P23 : xor2_d port map (s11b, s12b, s21); 
    P31 : and2_d port map (s22, s21, s31); -- modified relations

    process (clk)
    begin
        if clk = '1' then
                o(0) <= s31;
                o(1) <= s21;
        end if;
    end process;

end architecture;