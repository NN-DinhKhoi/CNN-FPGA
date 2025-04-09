`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2024 09:49:41 AM
// Design Name: 
// Module Name: adder_tree_16
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


module adder_tree_16 #(parameter DWIDTH = 16) (
    input  [DWIDTH*16-1 : 0] data_in,
    output [DWIDTH-1 : 0]    data_out
    );

    // Splitting the input into 16 equal parts of DWIDTH bits each
    wire [DWIDTH-1 : 0] data_in_0, data_in_1, data_in_2, data_in_3;
    wire [DWIDTH-1 : 0] data_in_4, data_in_5, data_in_6, data_in_7;
    wire [DWIDTH-1 : 0] data_in_8, data_in_9, data_in_10, data_in_11;
    wire [DWIDTH-1 : 0] data_in_12, data_in_13, data_in_14, data_in_15;

    assign data_in_0  = data_in[DWIDTH*1 - 1  : DWIDTH*0];
    assign data_in_1  = data_in[DWIDTH*2 - 1  : DWIDTH*1];
    assign data_in_2  = data_in[DWIDTH*3 - 1  : DWIDTH*2];
    assign data_in_3  = data_in[DWIDTH*4 - 1  : DWIDTH*3];
    assign data_in_4  = data_in[DWIDTH*5 - 1  : DWIDTH*4];
    assign data_in_5  = data_in[DWIDTH*6 - 1  : DWIDTH*5];
    assign data_in_6  = data_in[DWIDTH*7 - 1  : DWIDTH*6];
    assign data_in_7  = data_in[DWIDTH*8 - 1  : DWIDTH*7];
    assign data_in_8  = data_in[DWIDTH*9 - 1  : DWIDTH*8];
    assign data_in_9  = data_in[DWIDTH*10 - 1 : DWIDTH*9];
    assign data_in_10 = data_in[DWIDTH*11 - 1 : DWIDTH*10];
    assign data_in_11 = data_in[DWIDTH*12 - 1 : DWIDTH*11];
    assign data_in_12 = data_in[DWIDTH*13 - 1 : DWIDTH*12];
    assign data_in_13 = data_in[DWIDTH*14 - 1 : DWIDTH*13];
    assign data_in_14 = data_in[DWIDTH*15 - 1 : DWIDTH*14];
    assign data_in_15 = data_in[DWIDTH*16 - 1 : DWIDTH*15];

    // First level of adders
    wire [DWIDTH-1 : 0] sum1, sum2, sum3, sum4;
    wire [DWIDTH-1 : 0] sum5, sum6, sum7, sum8;

    adder #(.DWIDTH(DWIDTH)) adder1  (.A(data_in_0),  .B(data_in_1),  .SUM(sum1));
    adder #(.DWIDTH(DWIDTH)) adder2  (.A(data_in_2),  .B(data_in_3),  .SUM(sum2));
    adder #(.DWIDTH(DWIDTH)) adder3  (.A(data_in_4),  .B(data_in_5),  .SUM(sum3));
    adder #(.DWIDTH(DWIDTH)) adder4  (.A(data_in_6),  .B(data_in_7),  .SUM(sum4));
    adder #(.DWIDTH(DWIDTH)) adder5  (.A(data_in_8),  .B(data_in_9),  .SUM(sum5));
    adder #(.DWIDTH(DWIDTH)) adder6  (.A(data_in_10), .B(data_in_11), .SUM(sum6));
    adder #(.DWIDTH(DWIDTH)) adder7  (.A(data_in_12), .B(data_in_13), .SUM(sum7));
    adder #(.DWIDTH(DWIDTH)) adder8  (.A(data_in_14), .B(data_in_15), .SUM(sum8));

    // Second level of adders
    wire [DWIDTH-1 : 0] sum9, sum10, sum11, sum12;

    adder #(.DWIDTH(DWIDTH)) adder9  (.A(sum1), .B(sum2), .SUM(sum9));
    adder #(.DWIDTH(DWIDTH)) adder10 (.A(sum3), .B(sum4), .SUM(sum10));
    adder #(.DWIDTH(DWIDTH)) adder11 (.A(sum5), .B(sum6), .SUM(sum11));
    adder #(.DWIDTH(DWIDTH)) adder12 (.A(sum7), .B(sum8), .SUM(sum12));

    // Third level of adders
    wire [DWIDTH-1 : 0] sum13, sum14;

    adder #(.DWIDTH(DWIDTH)) adder13 (.A(sum9), .B(sum10), .SUM(sum13));
    adder #(.DWIDTH(DWIDTH)) adder14 (.A(sum11), .B(sum12), .SUM(sum14));

    // Final adder to produce the output
    adder #(.DWIDTH(DWIDTH)) adder15 (.A(sum13), .B(sum14), .SUM(data_out));

endmodule
