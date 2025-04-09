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


module adder_tree_16 #(parameter DATA_WIDTH = 32) (
    input  [DATA_WIDTH*16-1 : 0] data_in,
    output [DATA_WIDTH-1 : 0]    data_out
    );

    // Splitting the input into 16 equal parts of DATA_WIDTH bits each
    wire [DATA_WIDTH-1 : 0] data_in_0, data_in_1, data_in_2, data_in_3;
    wire [DATA_WIDTH-1 : 0] data_in_4, data_in_5, data_in_6, data_in_7;
    wire [DATA_WIDTH-1 : 0] data_in_8, data_in_9, data_in_10, data_in_11;
    wire [DATA_WIDTH-1 : 0] data_in_12, data_in_13, data_in_14, data_in_15;

    assign data_in_0  = data_in[DATA_WIDTH*1 - 1  : DATA_WIDTH*0];
    assign data_in_1  = data_in[DATA_WIDTH*2 - 1  : DATA_WIDTH*1];
    assign data_in_2  = data_in[DATA_WIDTH*3 - 1  : DATA_WIDTH*2];
    assign data_in_3  = data_in[DATA_WIDTH*4 - 1  : DATA_WIDTH*3];
    assign data_in_4  = data_in[DATA_WIDTH*5 - 1  : DATA_WIDTH*4];
    assign data_in_5  = data_in[DATA_WIDTH*6 - 1  : DATA_WIDTH*5];
    assign data_in_6  = data_in[DATA_WIDTH*7 - 1  : DATA_WIDTH*6];
    assign data_in_7  = data_in[DATA_WIDTH*8 - 1  : DATA_WIDTH*7];
    assign data_in_8  = data_in[DATA_WIDTH*9 - 1  : DATA_WIDTH*8];
    assign data_in_9  = data_in[DATA_WIDTH*10 - 1 : DATA_WIDTH*9];
    assign data_in_10 = data_in[DATA_WIDTH*11 - 1 : DATA_WIDTH*10];
    assign data_in_11 = data_in[DATA_WIDTH*12 - 1 : DATA_WIDTH*11];
    assign data_in_12 = data_in[DATA_WIDTH*13 - 1 : DATA_WIDTH*12];
    assign data_in_13 = data_in[DATA_WIDTH*14 - 1 : DATA_WIDTH*13];
    assign data_in_14 = data_in[DATA_WIDTH*15 - 1 : DATA_WIDTH*14];
    assign data_in_15 = data_in[DATA_WIDTH*16 - 1 : DATA_WIDTH*15];

    // First level of adders
    wire [DATA_WIDTH-1 : 0] sum1, sum2, sum3, sum4;
    wire [DATA_WIDTH-1 : 0] sum5, sum6, sum7, sum8;

    adder #(.DATA_WIDTH(DATA_WIDTH)) adder1  (.A(data_in_0),  .B(data_in_1),  .SUM(sum1));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder2  (.A(data_in_2),  .B(data_in_3),  .SUM(sum2));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder3  (.A(data_in_4),  .B(data_in_5),  .SUM(sum3));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder4  (.A(data_in_6),  .B(data_in_7),  .SUM(sum4));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder5  (.A(data_in_8),  .B(data_in_9),  .SUM(sum5));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder6  (.A(data_in_10), .B(data_in_11), .SUM(sum6));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder7  (.A(data_in_12), .B(data_in_13), .SUM(sum7));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder8  (.A(data_in_14), .B(data_in_15), .SUM(sum8));

    // Second level of adders
    wire [DATA_WIDTH-1 : 0] sum9, sum10, sum11, sum12;

    adder #(.DATA_WIDTH(DATA_WIDTH)) adder9  (.A(sum1), .B(sum2), .SUM(sum9));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder10 (.A(sum3), .B(sum4), .SUM(sum10));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder11 (.A(sum5), .B(sum6), .SUM(sum11));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder12 (.A(sum7), .B(sum8), .SUM(sum12));

    // Third level of adders
    wire [DATA_WIDTH-1 : 0] sum13, sum14;

    adder #(.DATA_WIDTH(DATA_WIDTH)) adder13 (.A(sum9), .B(sum10), .SUM(sum13));
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder14 (.A(sum11), .B(sum12), .SUM(sum14));

    // Final adder to produce the output
    adder #(.DATA_WIDTH(DATA_WIDTH)) adder15 (.A(sum13), .B(sum14), .SUM(data_out));

endmodule
