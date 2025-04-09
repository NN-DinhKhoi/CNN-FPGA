`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2024 11:10:02 PM
// Design Name: 
// Module Name: PU_array_tb
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


module PU_array_tb#(parameter IN_SIZE = 64, DWIDTH = 32, fractional = 0, NUM_DATA = 16);

reg clk;
reg load_en;
reg nreset;
reg [DWIDTH*NUM_DATA-1:0] in_data;
reg [DWIDTH*NUM_DATA-1:0] weight;
reg [DWIDTH-1:0] bias;
wire [DWIDTH-1:0] neuron_out;
wire neuron_done;

wire [DWIDTH*NUM_DATA-1:0] out_PU_ins;
assign out_PU_ins = PU_arr.out_PU_ins;
wire [DWIDTH-1:0] out_adder_tree;
assign out_adder_tree = PU_arr.out_adder_tree;
wire [DWIDTH-1:0] out_add_sum_bias;
assign out_add_sum_bias = PU_arr.out_add_sum_bias;

wire [DWIDTH-1:0] loop;   
assign loop = PU_arr.loop;
wire clear_accum;
assign clear_accum = PU_arr.clear_accum;

//wire [DWIDTH-1:0] res_1;
//assign res_1 = PU_arr.PU_instances.res_1;

//wire [DWIDTH-1:0] result;
//assign result = PU_arr.PU_instances.result;

pu_array# (IN_SIZE,DWIDTH,fractional,NUM_DATA) PU_arr (
                                                    clk,load_en,nreset,in_data,weight,
                                                    bias,neuron_out,neuron_done);

initial begin
    clk = 1'b1;
    forever #10 clk = ~clk;
end

initial begin
    nreset = 0;
    load_en = 0;
    @(posedge clk);
    nreset = 1;
    @(posedge clk);
    bias = 32'h00000000;  
    @(posedge clk);
    #1
    load_en = 1;
    in_data = {
        32'h00000002,
        32'h00000002
    };
    weight = {
        32'h00000001,
        32'h00000001
    };
    
    @(posedge clk);
    #1
    load_en = 0;
    @(posedge clk);
    #1
    load_en = 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
//    #1
//    load_en = 0;
    @(posedge clk);
//    #1
//    load_en = 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #1
    load_en = 0;
//    in_data = 0;
//    weight = 0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #1
    load_en = 1;
    in_data = {
        32'h00000002,
        32'h00000002
    };
    weight = {
        32'h00000001,
        32'h00000001
    };
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #1
    load_en = 0;
    @(posedge clk);
    #1
    load_en = 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #1
    load_en = 0;
    @(posedge clk);
    @(posedge clk);
    #1
    load_en = 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    $stop;

end
endmodule
