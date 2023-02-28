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

    signal s11,s12 : std_logic;
    signal tmp : std_logic; -- For dummy condition willingly added

    -- Added signals 
    signal s21, s22, s23 : std_logic; -- could have been named sHT1 and sHT2

begin
    
    process (clk)
    begin
        if clk = '1' then
            and_d(i(0), i(1), tmp);
            and_d(tmp, tmp, s11); -- Dummy Condition willingly added
            or_d(i(2), i(3), s12);
            and_d(s11, s12, s23); -- added gate HT
        end if;
    end process;
    
    process (clk)
    begin
        if clk = '1' then
                xor_d(s11, s23, s22); -- added gate HT
                and_d(s22, s21, o(0)); -- modified relations
                xor_d(s11, s12, s21);  -- modified relations
                o(1) <= s21;
        end if;
    end process;

end architecture;