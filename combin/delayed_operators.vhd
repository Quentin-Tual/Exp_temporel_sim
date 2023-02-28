library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Déclarer des process / procedures qui s'appellent [op]_d pour "delayed"
-- Appeler cette procédure ce process plutôt que d'utiliser le motclé initial 
-- Dans la procédure, utiliser l'opérateur initial et ajouter un délai.

package delayed_operators is
    constant c_time : time := 10 ns;

    procedure and_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    );

    procedure or_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    );

    procedure xor_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    );

    procedure nand_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    );

    procedure nor_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    );

    procedure not_d (
        signal i : in std_logic;
        signal o : out std_logic
    );

end package;

package body delayed_operators is

    procedure not_d (signal i: in std_logic; signal o: out std_logic) is
    begin
        o <=  not i after c_time;
    end procedure;

    procedure and_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    ) is
    begin
        o <= a and b after 10 ns;
    end procedure;

    procedure or_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    ) is
    begin
        o <= a or b after 10 ns;
    end procedure;

    procedure xor_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    ) is
    begin
        o <= a xor b after 10 ns;
    end procedure;

    procedure nand_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    ) is
    begin
        o <= a nand b after 10 ns;
    end procedure;

    procedure nor_d (
        signal a : in std_logic;
        signal b : in std_logic;
        signal o : out std_logic
    ) is
    begin
        o <= a nor b after 10 ns;
    end procedure;

end package body;