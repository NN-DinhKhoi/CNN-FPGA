`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:00:53 AM
// Design Name: 
// Module Name: datapath
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


module datapath#(
    parameter DWIDTH = 32,
    parameter BUFFER_SIZE = 64,
    parameter BUFFER_SIZE_BIAS = 10,
    parameter NUM_DATA = 16,
    parameter IN_SIZE =64, 
    parameter fractional = 21
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
    
    input load_en,
    
    output wire buf_ready_data,
    output wire buf_ready_bias,
    output wire buf_ready_weight,
    
    (*io_buffer_type = "none"*) output reg [DWIDTH-1:0] neuron_out,
    (*io_buffer_type = "none"*) output reg neuron_done
    );
    
    wire [DWIDTH-1:0] neuron_out_dff;
    wire neuron_done_dff;
    
    wire [(DWIDTH*NUM_DATA)-1:0] ouput_data;
    wire [(DWIDTH*NUM_DATA)-1:0] ouput_weight;
    wire [DWIDTH-1:0] ouput_bias;
    
    BUF_group #(.DWIDTH(DWIDTH),.BUFFER_SIZE(BUFFER_SIZE),
                .BUFFER_SIZE_BIAS(BUFFER_SIZE_BIAS),.NUM_DATA(NUM_DATA))
    bg (.clk(clk),.nreset(nreset),
        .we_data(we_data),.we_bias(we_bias),.we_weight(we_weight),
        .input_data(input_data),.input_bias(input_bias),.input_weight(input_weight),
        .re_data(re_data),.re_bias(re_bias),.re_weight(re_weight),
        .ouput_data(ouput_data),.ouput_bias(ouput_bias),.ouput_weight(ouput_weight),
        .buf_ready_data(buf_ready_data),.buf_ready_bias(buf_ready_bias),.buf_ready_weight(buf_ready_weight));
                  
    pu_array #(.IN_SIZE(IN_SIZE), 
              .DWIDTH(DWIDTH),.fractional(fractional),
              .NUM_DATA(NUM_DATA)) 
              
              PU_array (.clk(clk),
                     .load_en(load_en),
                     .nreset(nreset),
                     .in_data(ouput_data),
                     .weight(ouput_weight),
                     .bias(ouput_bias),
                     .neuron_out(neuron_out_dff),
                     .neuron_done(neuron_done_dff)
					 );
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
