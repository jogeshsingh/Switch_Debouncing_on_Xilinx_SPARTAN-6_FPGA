`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:14:44 03/01/2022 
// Design Name: 
// Module Name:    slow_clk 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module slow_clk(
    input i_clk,
    output out_slow_clk
    );
parameter DATA_WIDTH = 25 ; ///2^24 = 16_777_216 greater than 10_000_000 (10MHZ) , 
                             ///as 100MHZ is main clock and 100MHZ/5 = 20MHZ and one cycle is 10MHZ  which is
									  ///equal to 10_000_000 hence 2^24 is the approximate cnt value////
parameter count_5HZ = 10_000_000;
reg [DATA_WIDTH-1:0] reg_CNT_5HZ ;

reg Toggle_5HZ ;

always @ (posedge i_clk)
  begin 
   reg_CNT_5HZ = reg_CNT_5HZ + 1'b1 ;
               if (reg_CNT_5HZ == count_5HZ-1)
         begin
               Toggle_5HZ = ~Toggle_5HZ ;
               reg_CNT_5HZ = 0 ;
          end
           
end			  

assign out_slow_clk = Toggle_5HZ ;									  
endmodule
