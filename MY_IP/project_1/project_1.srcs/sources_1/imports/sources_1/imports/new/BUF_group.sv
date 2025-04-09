`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 10:14:38 AM
// Design Name: 
// Module Name: BUF_group
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


module BUF_group#(
    parameter DWIDTH = 32,
    parameter BUFFER_SIZE = 64,
    parameter BUFFER_SIZE_BIAS = 10,
    parameter NUM_DATA = 16
)(
    input clk,
    input nreset,
    
    input we_data,
    input we_bias,
    input we_weight,
    
    input [DWIDTH-1:0] input_data,
    input [DWIDTH-1:0] input_bias,
    input [DWIDTH-1:0] input_weight,
    
    input re_data,
    input re_bias,
    input re_weight,
    
    output wire [(DWIDTH*NUM_DATA)-1:0] ouput_data,
    output wire [(DWIDTH*NUM_DATA)-1:0] ouput_weight,
    output wire [DWIDTH-1:0] ouput_bias,
    
    output reg buf_ready_data,
    output reg buf_ready_bias,
    output reg buf_ready_weight
    );
    
    ping_pong_buffer #(.DWIDTH(DWIDTH),.BUFFER_SIZE(BUFFER_SIZE),.NUM_DATA(NUM_DATA))
        pp_buf_weight (.clk(clk), .nreset(nreset), .we(we_weight), 
                       .dma_input(input_weight), .re(re_weight),
                       .buf_output(ouput_weight),.buffer_ready(buf_ready_weight)   );
    
    data_buffer #(.DWIDTH(DWIDTH),.BUFFER_SIZE(BUFFER_SIZE),.NUM_DATA(NUM_DATA))
        data_buf (.clk(clk), .nreset(nreset), .we(we_data), 
                  .dma_input(input_data), .re(re_data),
                  .buf_output(ouput_data),.buffer_ready(buf_ready_data)   );
    
    data_buffer #(.DWIDTH(DWIDTH),.BUFFER_SIZE(BUFFER_SIZE_BIAS),.NUM_DATA(1'b1))
        bias_buf (.clk(clk), .nreset(nreset), .we(we_bias), 
                  .dma_input(input_bias), .re(re_bias),
                  .buf_output(ouput_bias),.buffer_ready(buf_ready_bias)   );
    
endmodule
