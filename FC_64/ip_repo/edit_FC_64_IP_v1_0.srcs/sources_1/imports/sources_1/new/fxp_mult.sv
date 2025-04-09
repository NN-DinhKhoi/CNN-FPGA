`timescale 1ns / 1ps


module fxp_mult #(parameter DATA_WIDTH = 32, FRACTIONAL = 0) (
input wire clk,
input wire mult_select,
input wire [DATA_WIDTH-1:0] multiplicand,
input wire [DATA_WIDTH-1:0] multiplier,
output wire [DATA_WIDTH-1:0] product
    );

wire [DATA_WIDTH*2-1:0] temp_product;

mult mult (.A(multiplicand), .B(multiplier), .CE(mult_select), .CLK(clk), .P(temp_product));

assign product = temp_product >>> FRACTIONAL;    
    


endmodule