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
    signal s11a, s11b, s12a, s12b, s21, s31 : std_logic;
begin

    P11 : and2_d port map (i(0), i(1), s11a);
    P12 : or2_d port map (i(2), i(3), s12a);

    process(clk) -- Synchronous register barrier 
    begin
        if clk = '1' then
            s11b <= s11a;
            s12b <= s12a;
        end if;
    end process;

    P21 : xor2_d port map (s11b, s12b, s21);
    P22 : and2_d port map (s11b, s21, s31);



    process(clk)
    begin
        if clk = '1' then
            o(0) <= s31;
            o(1) <= s21;
        end if;
    end process;
    
end architecture;