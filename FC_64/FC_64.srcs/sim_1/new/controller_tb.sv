`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:15:57 AM
// Design Name: 
// Module Name: controller_tb
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


module controller_tb
#(parameter BUFFER_SIZE = 64, NUM_DATA = 16);
    reg clk;
    reg nreset;
    
    reg buf_ready_data;
    reg buf_ready_bias;
    reg buf_ready_weight;
    
    wire re_data;
    wire re_bias;
    wire re_weight;
    
    wire load_en;
    
    
    controller1 #(.BUFFER_SIZE(BUFFER_SIZE),.NUM_DATA(NUM_DATA))
    ctl (.clk(clk),.nreset(nreset), 
         .re_data(re_data),.re_bias(re_bias),.re_weight(re_weight),
         .buf_ready_data(buf_ready_data),.buf_ready_bias(buf_ready_bias),.buf_ready_weight(buf_ready_weight),
         .load_en(load_en));
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end
    
    initial begin
        nreset = 0; 
        buf_ready_data = 0;
        buf_ready_bias = 0;
        buf_ready_weight = 0;
        #10 nreset = 1;
        @(posedge clk);
        @(posedge clk);
        buf_ready_data = 1;
        buf_ready_bias = 1;
        buf_ready_weight = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        buf_ready_data = 0;
        buf_ready_weight = 0;
        @(posedge clk);
        buf_ready_data = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $finish;
    end
endmodule

