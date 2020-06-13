`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2020 10:51:51
// Design Name: 
// Module Name: delay_line
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "parameters.vh" 

module delay_line(
    input ipulse,
    input [2 * C_LENGTH - 1 : 0] ichallenge,
    output oout_1,
    output oout_2
    );  
    
  
   (* dont_touch = "yes" *) wire [2 * C_LENGTH + 1 : 0] net;
    
    
    assign net[0] = ipulse;
    assign net[1] = ipulse;
    
    generate
    genvar i;
    for (i = 1; i<= C_LENGTH; i = i + 1)
    begin
        mux inst_mux_1(
            .ia(net[i * 2 -2]),
            .ib(net[i * 2 -1]),
            .isel(ichallenge[i - 1]),
            .oout(net[i * 2])
        );
        
        mux inst_mux_2(
            .ia(net[i * 2 -1]),
            .ib(net[i * 2 -2]),
            .isel(ichallenge[i - 1]),
            .oout(net[i * 2 + 1])
        );
    end
    endgenerate
    
    assign oout_1 = net[C_LENGTH * 2];
    assign oout_2 = net[C_LENGTH * 2 + 1];
    
endmodule
