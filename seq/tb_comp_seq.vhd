library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.delayed_operators.all;

entity tb_comp_seq is 
end entity;

architecture rtl of tb_comp_seq is

    constant T : time := 50 ns;

    procedure wait_cycles(n : natural) is
    begin
        for i in 0 to n-1 loop
            wait for T;
        end loop; 
    end procedure;

    procedure wait1 is
    begin
        wait for T;
    end procedure;


    signal clk_init : std_logic := '1';
    signal clk_2x : std_logic := '1';
    signal clk_4x : std_logic := '1';
    signal clk_8x : std_logic := '1';

    signal tb_input_vector : std_logic_vector(3 downto 0);
    signal tb_output_vector_auth : std_logic_vector(1 downto 0);
    signal tb_output_vector_inf : std_logic_vector(1 downto 0);

    signal tb_clk_init_output_auth : std_logic_vector(1 downto 0);
    signal tb_clk_2x_output_auth : std_logic_vector(1 downto 0);
    signal tb_clk_4x_output_auth : std_logic_vector(1 downto 0);
    signal tb_clk_8x_output_auth : std_logic_vector(1 downto 0);

    signal tb_clk_init_output_inf : std_logic_vector(1 downto 0);
    signal tb_clk_2x_output_inf : std_logic_vector(1 downto 0);
    signal tb_clk_4x_output_inf : std_logic_vector(1 downto 0);
    signal tb_clk_8x_output_inf : std_logic_vector(1 downto 0);

begin

    clk_init <= not(clk_init) after T/2;
    clk_2x <= not(clk_2x) after T/4;
    clk_4x <= not(clk_4x) after T/8;
    clk_8x <= not(clk_8x) after T/16;

    uut_auth_init : entity work.circ01_seq
    port map(
        clk => clk_init,
        i => tb_input_vector,
        o => tb_clk_init_output_auth
    );
    
    uut_inf_init : entity work.mod_circ01_seq
    port map(
        clk => clk_init,
        i => tb_input_vector,
        o => tb_clk_init_output_inf
    );

    uut_auth_2x : entity work.circ01_seq
    port map(
        clk => clk_2x,
        i => tb_input_vector,
        o => tb_clk_2x_output_auth
    );
    
    uut_inf_2x : entity work.mod_circ01_seq
    port map(
        clk => clk_2x,
        i => tb_input_vector,
        o => tb_clk_2x_output_inf
    );

    uut_auth_4x : entity work.circ01_seq
    port map(
        clk => clk_4x,
        i => tb_input_vector,
        o => tb_clk_4x_output_auth
    );
    
    uut_inf_4x : entity work.mod_circ01_seq
    port map(
        clk => clk_4x,
        i => tb_input_vector,
        o => tb_clk_4x_output_inf
    );

    uut_auth_8x : entity work.circ01_seq
    port map(
        clk => clk_8x,
        i => tb_input_vector,
        o => tb_clk_8x_output_auth
    );
    
    uut_inf_8x : entity work.mod_circ01_seq
    port map(
        clk => clk_8x,
        i => tb_input_vector,
        o => tb_clk_8x_output_inf
    );

    process 
    begin 
        for i in 0 to 15 loop
            wait1; 
            tb_input_vector <= std_logic_vector(to_unsigned(i, 4));
        end loop; 

        wait;
    end process;

end architecture;
