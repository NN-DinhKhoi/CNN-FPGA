`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:04:54 AM
// Design Name: 
// Module Name: top_design_tb
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


module top_design_tb #(
    parameter DWIDTH = 16,
    parameter ADDR_WIDTH = 10,
    parameter BUFFER_SIZE = 64,
    parameter BUFFER_SIZE_BIAS = 10,
    parameter NUM_DATA = 16,
    parameter IN_SIZE =64, 
    parameter fractional = 10
    );
    
    reg clk;
    reg nreset;
    
    reg we_i;
    reg [ADDR_WIDTH-1:0] addr_i;
    
    reg [DWIDTH-1:0] din_i;
    
    wire [DWIDTH-1:0] dout_o;
    wire doutvld_o;
    wire cal_done;
    
    wire [DWIDTH-1:0] neuron_out;
    wire neuron_done;
    assign neuron_out = td.neuron_out;
    assign neuron_done = td.neuron_done;
    
    wire [9:0] ff_pointer, r_pointer;
    assign ff_pointer = td.ff_pointer;
    assign r_pointer = td.r_pointer;
    
    reg [DWIDTH-1:0] mem_data [0:63];
    reg [DWIDTH-1:0] mem_weight [0:64*10 - 1];
    reg [DWIDTH-1:0] mem_bias [0:9];
    
//    wire buf_ready_data;
//    wire buf_ready_bias;
//    wire buf_ready_weight;
//    wire re_data;
//    wire re_bias;
//    wire re_weight;
//    wire load_en;
//    wire [11:0] count;
    
    
//    wire [(DWIDTH*NUM_DATA)-1:0] ouput_data;
//    wire [(DWIDTH*NUM_DATA)-1:0] ouput_weight;
//    wire [DWIDTH-1:0] ouput_bias;
    
    
    top_design #(.DWIDTH(DWIDTH),.ADDR_WIDTH(ADDR_WIDTH),.BUFFER_SIZE(BUFFER_SIZE),.BUFFER_SIZE_BIAS(BUFFER_SIZE_BIAS),
                .NUM_DATA(NUM_DATA),.IN_SIZE(IN_SIZE),.fractional(fractional))
    td (.clk(clk),.nreset(nreset),
        .we_i(we_i),.addr_i(addr_i),.din_i(din_i),
        .dout_o(dout_o),.doutvld_o(doutvld_o),.cal_done(cal_done) );
    
//    assign buf_ready_data = td.dtp.buf_ready_data;
//    assign buf_ready_bias = td.dtp.buf_ready_bias;
//    assign buf_ready_weight = td.dtp.buf_ready_weight;
//    assign re_data = td.re_data;
//    assign re_bias = td.re_bias;
//    assign re_weight = td.re_weight;
//    assign load_en = td.load_en;
//    assign count = td.ctl.count;
//    assign ouput_data = td.dtp.ouput_data;
//    assign ouput_weight = td.dtp.ouput_weight;
//    assign ouput_bias = td.dtp.ouput_bias;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end
    initial begin
        $readmemh("data_1_img_FC64_hex.txt", mem_data);
        $readmemh("weight_img_FC64_hex.txt", mem_weight);
        $readmemh("bias_img_FC64_hex.txt", mem_bias);
    end
    initial begin
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        we_i = 1;
        addr_i = 0;
        for (int i = 0; i < 64; i = i + 1) begin
            din_i = mem_data[i];
            addr_i = i;
            @(posedge clk);
        end
        we_i = 0;
        
        @(posedge clk);
        @(posedge clk);
        
        we_i = 1;
        //addr_i = 1;
        for (int i = 0; i < 10; i = i + 1) begin
            din_i = mem_bias[i];
            addr_i = 100 + i;
            @(posedge clk);
        end
        we_i = 0;
        
        @(posedge clk);
        @(posedge clk);
        
        we_i = 1;
        //addr_i = 2;
        for (int i = 0; i < 64*10; i = i + 1) begin
            din_i = mem_weight[i];
            addr_i = 200 + i;
            @(posedge clk);
        end
        we_i = 0;
    end
    
    initial begin
        nreset = 0;
        we_i = 0;
        #10 nreset = 1;
        @(posedge clk);
        @(posedge clk);
        for(int i = 0; i < 10; i = i + 1) begin   
            for (int i = 0; i < 64; i = i + 1) begin
            @(posedge clk);
            end   
        end
        
        for (int i = 0; i < 80; i = i + 1) begin
            @(posedge clk);
        end
        
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
        //addr_i = 3;
        for (int i = 0; i < 10; i = i + 1) begin
            addr_i = 160 + i;
            @(posedge clk);
        end
        @(posedge clk);
        @(posedge clk);
        $stop;
    end
    
endmodule
