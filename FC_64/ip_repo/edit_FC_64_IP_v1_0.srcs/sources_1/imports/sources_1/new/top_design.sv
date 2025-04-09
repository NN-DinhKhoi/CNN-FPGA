`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:00:53 AM
// Design Name: 
// Module Name: top_design
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


module top_design
#(  parameter DWIDTH = 16,
    parameter BUFFER_SIZE = 64,
    parameter BUFFER_SIZE_BIAS = 10,
    parameter NUM_DATA = 16,
    parameter IN_SIZE =64, 
    parameter fractional = 21
)
(
    input clk,
    input nreset,
    
    input we_data,
    input we_bias,
    input we_weight,
    
    input [DWIDTH-1:0] input_data,
    input [DWIDTH-1:0] input_bias,
    input [DWIDTH-1:0] input_weight,
        
    output reg [DWIDTH-1:0] neuron_out,
    output reg neuron_done
    );
    wire re_data;
    wire re_bias;
    wire re_weight;
    
    wire load_en;
    
    wire buf_ready_data;
    wire buf_ready_bias;
    wire buf_ready_weight;
    
    wire [DWIDTH-1:0] neuron_out_dff;
    wire neuron_done_dff;
    
    controller #(.BUFFER_SIZE(BUFFER_SIZE),.NUM_DATA(NUM_DATA))
    ctl (.clk(clk),.nreset(nreset), 
         .re_data(re_data),.re_bias(re_bias),.re_weight(re_weight),
         .buf_ready_data(buf_ready_data),.buf_ready_bias(buf_ready_bias),.buf_ready_weight(buf_ready_weight),
         .load_en(load_en));
    
    
    datapath #(.DWIDTH(DWIDTH),.BUFFER_SIZE(BUFFER_SIZE),.BUFFER_SIZE_BIAS(BUFFER_SIZE_BIAS),
                .NUM_DATA(NUM_DATA),.IN_SIZE(IN_SIZE),.fractional(fractional))
    dtp (.clk(clk),.nreset(nreset),
        .we_data(we_data),.we_bias(we_bias),.we_weight(we_weight),
        .input_data(input_data),.input_bias(input_bias),.input_weight(input_weight),
        .re_data(re_data),.re_bias(re_bias),.re_weight(re_weight),
        .buf_ready_data(buf_ready_data),.buf_ready_bias(buf_ready_bias),.buf_ready_weight(buf_ready_weight),
        .load_en(load_en),.neuron_out(neuron_out_dff),.neuron_done(neuron_done_dff) );
        
    always @( posedge clk or negedge nreset ) begin
            if (~nreset) begin
                neuron_out <= 0;
                neuron_done <= 0;
            end
            else begin
                neuron_out <= neuron_out_dff;
                neuron_done <= neuron_done_dff;
            end
    end
endmodule
