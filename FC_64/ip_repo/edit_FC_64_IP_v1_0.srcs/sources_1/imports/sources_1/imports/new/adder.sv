`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2024 07:13:05 PM
// Design Name: 
// Module Name: adder
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


module adder # (DATA_WIDTH = 16)(
    input wire [DATA_WIDTH-1:0] A,      
    input wire [DATA_WIDTH-1:0] B,      
    output wire [DATA_WIDTH-1:0] SUM  
    );
    
    assign SUM = A + B;   
    
    
endmodule
