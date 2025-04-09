`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:15:57 AM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb #(
    parameter DWIDTH = 32,
    parameter BUFFER_SIZE = 64,
    parameter BUFFER_SIZE_BIAS = 10,
    parameter NUM_DATA = 16,
    parameter IN_SIZE =64, 
    parameter fractional = 21
    );
    reg clk;
    reg nreset;
    
    reg we_data;
    reg we_bias;
    reg we_weight;
    
    reg [DWIDTH-1:0] input_data;
    reg [DWIDTH-1:0] input_bias;
    reg [DWIDTH-1:0] input_weight;
    
    reg re_data;
    reg re_bias;
    reg re_weight;
    
    reg load_en;
    
    wire buf_ready_data;
    wire buf_ready_bias;
    wire buf_ready_weight;
    
    wire [DWIDTH-1:0] neuron_out;
    wire neuron_done;
    
    wire [(DWIDTH*NUM_DATA)-1:0] ouput_data;
    wire [(DWIDTH*NUM_DATA)-1:0] ouput_weight;
    wire [DWIDTH-1:0] ouput_bias;
    
    assign ouput_data = dtp.ouput_data;
    assign ouput_weight = dtp.ouput_weight;
    assign ouput_bias = dtp.ouput_bias;
    
    reg [DWIDTH-1:0] mem_data [0:63];
    reg [DWIDTH-1:0] mem_weight [0:64*10 - 1];
    reg [DWIDTH-1:0] mem_bias [0:9];
    
    datapath #(.DWIDTH(DWIDTH),.BUFFER_SIZE(BUFFER_SIZE),.BUFFER_SIZE_BIAS(BUFFER_SIZE_BIAS),
                .NUM_DATA(NUM_DATA),.IN_SIZE(IN_SIZE),.fractional(fractional))
    dtp (.clk(clk),.nreset(nreset),
        .we_data(we_data),.we_bias(we_bias),.we_weight(we_weight),
        .input_data(input_data),.input_bias(input_bias),.input_weight(input_weight),
        .re_data(re_data),.re_bias(re_bias),.re_weight(re_weight),
        .buf_ready_data(buf_ready_data),.buf_ready_bias(buf_ready_bias),.buf_ready_weight(buf_ready_weight),
        .load_en(load_en),.neuron_out(neuron_out),.neuron_done(neuron_done) );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end
    initial begin
        $readmemh("data_1_neuron_64.txt", mem_data);
        $readmemh("weight_10_neuron_64.txt", mem_weight);
        $readmemh("layer_7_biases_hex.txt", mem_bias);
    end
    initial begin
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        we_weight = 1;
        for (int i = 0; i < 64*10; i = i + 1) begin
            input_weight = mem_weight[i];
            @(posedge clk);
        end
        we_weight = 0;
    end
    initial begin
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        we_bias = 1;
        for (int i = 0; i < 10; i = i + 1) begin
            input_bias = mem_bias[i];
            @(posedge clk);
        end
        we_bias = 0;
    end
    initial begin
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        we_data = 1;
        for (int i = 0; i < 64; i = i + 1) begin
            input_data = mem_data[i];
            @(posedge clk);
        end
        we_data = 0;
    end
    
    initial begin
        nreset = 0; // Reset the system
        
        #10 nreset = 1;
        we_data = 0;
        we_bias = 0;
        we_weight = 0;
        re_data = 0;
        re_bias = 0;
        re_weight = 0;
        input_data = 0;
        input_weight = 0;
        input_bias = 0;
        load_en = 0;
        
        @(posedge clk);
        @(posedge clk);
        for (int i = 0; i < 64; i = i + 1) begin
            @(posedge clk);
        end
        
        for(int i = 0; i < 10; i = i + 1) begin
        re_data = 1;
        re_weight = 1;
        @(posedge clk);
        load_en = 1;
        @(posedge clk);
        @(posedge clk);
        re_bias = 1;
        @(posedge clk);
        re_bias = 0;
        @(posedge clk);
        re_data = 0;
        re_weight = 0;
        load_en = 0;
        
            for (int i = 0; i < 59; i = i + 1) begin
            @(posedge clk);
            end
        
        end
        
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $stop;
    end
    
endmodule
