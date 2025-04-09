`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2025 01:08:36 PM
// Design Name: 
// Module Name: pp_buffer_tb
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


module pp_buffer_tb
#(
    parameter DWIDTH = 4,
    parameter BUFFER_SIZE = 8,
    parameter NUM_DATA = 2
    );
    reg clk;
    reg nreset;
    reg we;
    reg [DWIDTH-1:0] dma_input;
    reg re;
    wire [(DWIDTH*NUM_DATA)-1:0] buf_output;
    wire buffer_ready;
    
    wire [15:0] read_count;
    assign read_count = pp_buf.read_count;

    ping_pong_buffer #(.DWIDTH(DWIDTH),.BUFFER_SIZE(BUFFER_SIZE),.NUM_DATA(NUM_DATA))
        pp_buf (.clk(clk), .nreset(nreset), .we(we), .dma_input(dma_input), .re(re),
                .buf_output(buf_output), .buffer_ready(buffer_ready));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end
    initial begin
        // Initialize inputs
        nreset = 0; // Reset the system
        
        #10 nreset = 1;
        we = 0;
        dma_input = 0;
        re = 0;
        @(posedge clk);
        we = 1;
        dma_input = 1;
        @(posedge clk);
        dma_input = 2;
        @(posedge clk);
        dma_input = 3;
        @(posedge clk);
        dma_input = 4;
        @(posedge clk);
        dma_input = 5;
        @(posedge clk);
        dma_input = 6;
        @(posedge clk);
        dma_input = 7;
        @(posedge clk);
        we = 0;
        dma_input = 0;
        @(posedge clk);
        we = 1;
        @(posedge clk);
        we = 0;
        @(posedge clk);
        re = 1;
        @(posedge clk);
        re = 1;
        @(posedge clk);
        re = 1;
        @(posedge clk);
        re = 1;
        we = 1;
        dma_input = 1;
        @(posedge clk);
        re = 0;
        dma_input = 2;
        @(posedge clk);
        dma_input = 3;
        @(posedge clk);
        dma_input = 4;
        @(posedge clk);
        dma_input = 5;
        @(posedge clk);
        dma_input = 6;
        @(posedge clk);
        dma_input = 7;
        @(posedge clk);
        dma_input = 0;
        @(posedge clk);
        re = 1;
        dma_input = 1;
        @(posedge clk);
        re = 1;
        dma_input = 2;
        @(posedge clk);
        re = 1;
        dma_input = 3;
        @(posedge clk);
        re = 1;
        dma_input = 4;
        @(posedge clk);
        re = 1;
        we = 0;
    $stop;
    end
    
endmodule
