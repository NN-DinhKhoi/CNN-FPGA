`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2024 05:07:49 PM
// Design Name: 
// Module Name: select_max_tb
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


module select_max_tb #(
parameter OUT=10, DWIDTH=16
    );
    
    reg clk;
    reg enable;
    reg nreset;
    reg [DWIDTH-1:0] in_data;
    wire [3:0] digit;
    wire layer_done;
    
    wire [3:0] i;
    wire done;
    wire [DWIDTH-1:0] max;
    assign i = Select_Max.i;
    assign done = Select_Max.done;
    assign max = Select_Max.max;
    
    select_max #(.OUT(OUT),.DWIDTH(DWIDTH))
	            
	            Select_Max (.clk(clk),.nreset(nreset),.enable(enable),
	                        .in_data(in_data),.digit(digit),.layer_done(layer_done));
	initial begin
    clk = 1'b1;
    forever #10 clk = ~clk;
    end
	initial begin
    nreset = 0;
    #15;
    nreset = 1;
    #5;
    #20;
    enable = 1;
    in_data = 0;
    #20;
    enable = 0;
    
    #20;
    enable = 1;
    in_data = 1;
    #20;
    enable = 0;
    
    #20;
    enable = 1;
    in_data = 2;
    #20;
    enable = 0;
    
    #20;
    enable = 1;
    in_data = 3;
    #20;
    enable = 0;
    
    #20;
    enable = 1;
    in_data = 9;
    #20;
    enable = 0;
    
    #20;
    enable = 1;
    in_data = 5;
    #20;
    enable = 0;
    
    #20;
    enable = 1;
    in_data = 6;
    #20;
    enable = 0;
    
    #20;
    enable = 1;
    in_data = 7;
    #20;
    enable = 0;
    
    #20;
    enable = 1;
    in_data = 8;
    #20;
    enable = 0;
    
    #20;
    enable = 1;
    in_data = 4;
    #20;
    enable = 0;
    end

endmodule
