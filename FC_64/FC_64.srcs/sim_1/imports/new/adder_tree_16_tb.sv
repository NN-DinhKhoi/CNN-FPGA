`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2024 10:13:25 AM
// Design Name: 
// Module Name: adder_tree_16_tb
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


module adder_tree_16_tb #(parameter DATA_WIDTH = 16);

    reg  [DATA_WIDTH*16-1 : 0] data_in;
    wire [DATA_WIDTH-1 : 0]    data_out;
    
adder_tree_16 #(DATA_WIDTH) 
at16 (
    data_in,
    data_out
    );    
 

initial begin
    #20;
    data_in = 256'h0002000200020002000200020002000200020002000200020002000200020002;
    #20;
    data_in = 256'h0000000000000000000000000000000000000000000000000000000000000000;
end   


endmodule
