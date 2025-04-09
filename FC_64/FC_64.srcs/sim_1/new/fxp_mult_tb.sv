`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:15:57 AM
// Design Name: 
// Module Name: fxp_mult_tb
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


module fxp_mult_tb();

    // Parameters
    parameter DATA_WIDTH = 32;
    parameter FRACTIONAL = 21;

    // Inputs and Outputs
    reg clk;
    reg mult_select;
    reg [DATA_WIDTH-1:0] multiplicand;
    reg [DATA_WIDTH-1:0] multiplier;
    wire [DATA_WIDTH-1:0] product;

    // Instantiate the Unit Under Test (UUT)
    fxp_mult #(.DATA_WIDTH(DATA_WIDTH), .FRACTIONAL(FRACTIONAL)) fxp (
        .clk(clk),
        .mult_select(mult_select),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period
    end

    // Test procedure
    initial begin
        // Initialize inputs
        mult_select = 0;
        multiplicand = 0;
        multiplier = 0;

        // Wait for global reset
        #10;

        // Apply test case 1
        @(posedge clk);
        #2
        mult_select = 1; // Enable multiplication
        multiplicand = 32'h003ae637; // Example value: 21 in decimal
        multiplier = 32'h0032dfc6;  // Example value: 10 in decimal

        @(posedge clk);
        #2
        mult_select = 0; // Disable multiplication after 1 clock
        multiplicand = 32'h00000000;
        multiplier = 32'h00000000;
        
        // Wait and observe the result
        #20;

        // Apply test case 2
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        #2
        mult_select = 1;
        multiplicand = 32'h003ae637; // Example value: -2 in 16-bit signed fixed-point
        multiplier = 32'h00339eca;  // Example value: 3 in decimal

        @(posedge clk);
        #2
        mult_select = 0;
        multiplicand = 32'h00000000;
        multiplier = 32'h00000000;

        // Wait and observe the result
        #20;

        // Finish simulation
        $stop;
    end

    // Monitor outputs
    initial begin
        $monitor($time, " clk=%b mult_select=%b multiplicand=%d multiplier=%d product=%d", 
                 clk, mult_select, multiplicand, multiplier, product);
    end

endmodule
