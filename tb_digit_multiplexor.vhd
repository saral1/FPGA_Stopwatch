----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2018 02:19:03 PM
-- Design Name: 
-- Module Name: tb_digit_multiplexor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_digit_multiplexor is
--  Port ( );
end tb_digit_multiplexor;

architecture Behavioral of tb_digit_multiplexor is
    COMPONENT digit_multiplexor
    PORT(
        sec_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
        sec_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
        min_dig1   : in  STD_LOGIC_VECTOR(3 downto 0);
        min_dig2   : in  STD_LOGIC_VECTOR(3 downto 0);
        selector   : in  STD_LOGIC_VECTOR(3 downto 0);
        time_digit : out STD_LOGIC_VECTOR(3 downto 0)
    );
    END COMPONENT;
    
    --Inputs
    signal sec_dig1    : STD_LOGIC_VECTOR(3 downto 0);
    signal sec_dig2  : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig1 : STD_LOGIC_VECTOR(3 downto 0);
    signal min_dig2 : STD_LOGIC_VECTOR(3 downto 0);
    signal selector : STD_LOGIC_VECTOR(3 downto 0);
    
    --Outputs
    signal time_digit : STD_LOGIC_VECTOR(3 downto 0);
    
begin

-- Instantiate the Unit Under Test (UUT)
   uut: digit_multiplexor 
   PORT MAP (
              sec_dig1 => sec_dig1,
              sec_dig2 => sec_dig2,
              min_dig1 => min_dig1,
              min_dig2 => min_dig2,
              selector => selector,
              time_digit => time_digit
            );

   selector_process :process
   begin
        selector <= "0001";
        wait for 100ns;
        selector <= "0010";
        wait for 100ns;
        selector <= "0100";
        wait for 100ns;
        selector <= "1000";
        wait for 100ns;
        selector <= "0000";
        wait for 3000ns;
   end process;
   
   sec_dig1_process :process
      begin
           sec_dig1 <= "1110";
           wait for 100ns;
           sec_dig1 <= "1101";
           wait for 100ns;
      end process;
      
  sec_dig2_process :process
     begin
          sec_dig2 <= "0001";
          wait for 100ns;
          sec_dig2 <= "0010";
          wait for 100ns;
     end process;
     
     min_dig1_process :process
        begin 
             min_dig1 <= "0011";
             wait for 100ns;
             min_dig1 <= "0100";
             wait for 100ns;

        end process;
    
    min_dig2_process :process
       begin
            min_dig2 <= "0101";
            wait for 100ns;
            min_dig2 <= "1011";
            wait for 100ns;
       end process;


end Behavioral;
