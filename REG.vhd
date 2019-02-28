----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 09:30:15 PM
-- Design Name: 
-- Module Name: REG - REG
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

use IEEE.STD_LOGIC_ARITH.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown is

    Port ( parallelload : in  STD_LOGIC_VECTOR (3 downto 0);

           clk,load,dir : in  STD_LOGIC;

           reset : in  STD_LOGIC;

           count : out  STD_LOGIC_VECTOR (3 downto 0));

end updown;

 

architecture Behavioral of updown is

signal temp:std_logic_vector(3 downto 0);

begin

process(clk,reset)

begin

if reset='1' then temp<="0000";

elsif(clk='1' and clk'event) then

if load='1' then temp<=parallelload;

elsif(load='0' and dir='0') then temp<=temp+1;

elsif(load='0' and dir='1') then temp<=temp-1;

end if;

end if;

end process;

count<=temp;

end Behavioral;