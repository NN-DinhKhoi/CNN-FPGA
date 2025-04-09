`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2024 12:42:48 AM
// Design Name: 
// Module Name: process_unit_tb
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


module process_unit_tb();

    // Parameters
    parameter DATA_WIDTH = 16;
    parameter FRACTIONAL = 0;

    // Inputs and Outputs
    reg clk;
    reg rst;
    reg enable;
    reg clear_accum;
    reg [DATA_WIDTH-1:0] in_data;
    reg [DATA_WIDTH-1:0] weight;
    wire [DATA_WIDTH-1:0] result;

    process_unit #(.DATA_WIDTH(DATA_WIDTH), .fractional(FRACTIONAL)) uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .clear_accum(clear_accum),
        .in_data(in_data),
        .weight(weight),
        .result(result)
    );
wire valid;
assign valid = uut.valid;

wire [DATA_WIDTH-1:0] res_1;
assign res_1 = uut.res_1;
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test procedure
    initial begin
        // Initialize inputs
        rst = 0; // Reset the system
        enable = 0;
        clear_accum = 0;
        in_data = 0;
        weight = 0;

        #10 rst = 1;
        @(posedge clk);
        clear_accum = 1;
        
        @(posedge clk)
        #1
        clear_accum = 0;
        enable = 1;
        in_data = 16'h0001;
        weight = 16'h0002;
        
        @(posedge clk);
        #1
        clear_accum = 1;
        enable = 1;
        in_data = 16'h00002;
        weight = 16'h00003;
        @(posedge clk);
        #1
        enable = 0;
        clear_accum = 0;
        @(posedge clk);
        #1 
        clear_accum = 1;
        enable = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $stop;
    end

endmodule


