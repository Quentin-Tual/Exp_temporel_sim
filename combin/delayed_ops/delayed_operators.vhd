library ieee;
use ieee.std_logic_1164.all;

package delayed_operators is
    
    component and2_d is
        port (
            a   : in std_logic;
            b : in std_logic;
            o : out std_logic
        );
    end component;

    component or2_d is
        port (
            a   : in std_logic;
            b : in std_logic;
            o : out std_logic
        );
    end component;

    component xor2_d is
        port (
            a   : in std_logic;
            b : in std_logic;
            o : out std_logic
        );
    end component;

    component nand2_d is
        port (
            a   : in std_logic;
            b : in std_logic;
            o : out std_logic
        );
    end component;

    component nor2_d is
        port (
            a   : in std_logic;
            b : in std_logic;
            o : out std_logic
        );
    end component;

    component not_d is
        port (
            a   : in std_logic;
            o : out std_logic
        );
    end component;

end delayed_operators;