`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 09:24:43 PM
// Design Name: 
// Module Name: data_buffer_tb
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


module data_buffer_tb
#(
    parameter DWIDTH = 32,
    parameter BUFFER_SIZE = 64,
    parameter NUM_DATA = 16
    );
    reg clk;
    reg nreset;
    reg we;
    reg [DWIDTH-1:0] dma_input;
    reg re;
    wire [(DWIDTH*NUM_DATA)-1:0] buf_output;
    wire buffer_ready;
    
    wire [15:0] read_ptr;
    assign read_ptr = data_buf.read_ptr;
    
    wire [DWIDTH-1:0] buffer0;
    wire [DWIDTH-1:0] buffer1;
    wire [DWIDTH-1:0] buffer2;
    wire [DWIDTH-1:0] buffer3;
    wire [DWIDTH-1:0] buffer4;
    wire [DWIDTH-1:0] buffer5;
    wire [DWIDTH-1:0] buffer6;
    wire [DWIDTH-1:0] buffer7;
    assign buffer0 = data_buf.buffer[0];
    assign buffer1 = data_buf.buffer[1];
    assign buffer2 = data_buf.buffer[2];
    assign buffer3 = data_buf.buffer[3];
    assign buffer4 = data_buf.buffer[4];
    assign buffer5 = data_buf.buffer[5];
    assign buffer6 = data_buf.buffer[6];
    assign buffer7 = data_buf.buffer[7];
    
    reg [DWIDTH-1:0] mem_data [0:63];
    
    data_buffer #(.DWIDTH(DWIDTH),.BUFFER_SIZE(BUFFER_SIZE),.NUM_DATA(NUM_DATA))
        data_buf (.clk(clk), .nreset(nreset), .we(we), .dma_input(dma_input), .re(re),
                  .buf_output(buf_output), .buffer_ready(buffer_ready));
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end            
    initial begin
        $readmemh("data_1_neuron_64.txt", mem_data);
    end
    initial begin
        nreset = 0; 
        
        #10 nreset = 1;
        we = 0;
        dma_input = 0;
        re = 0;
        @(posedge clk);
        we = 1; // Bật chế độ ghi
        for (int i = 0; i < 64; i = i + 1) begin
            dma_input = mem_data[i];
            @(posedge clk);
        end

        we = 0; // Dừng ghi
        @(posedge clk);
        re = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        
        
        /*
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
        @(posedge clk);
        @(posedge clk);
        re = 0;
        @(posedge clk);
        re = 1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        */
    $stop;
    end            
                
    
endmodule
