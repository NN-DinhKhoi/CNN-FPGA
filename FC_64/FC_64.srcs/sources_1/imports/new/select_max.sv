`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2024 22:59:45
// Design Name: 
// Module Name: select_max
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

/**********
* Module to select the maximum between last layer outputs
*
* Inputs: clk => clock signal, enable => enable signal,
*         reset => active high sync reset, in_data => input array, 
*
* Outputs: digit => Index of max element (ie handwritten digit)
*          layer_done => done signal
* 
***********/

module select_max # (parameter OUT=10, DWIDTH=16)(
    input clk,
    input enable,
    input nreset,
    input [DWIDTH-1:0] in_data,
    output wire [3:0] digit,
    output wire layer_done
    );
    
    reg [3:0] i;
    reg [DWIDTH-1:0] max;
    reg [3:0] index;
    reg done;
    reg [3:0] digit_buffer;
    reg layer_done_buffer;
    always @(posedge clk or negedge nreset) begin
        if(~nreset) begin
            layer_done_buffer <= 1'b0;
            done <= 1'b0;
            i <= 0;
            max <= 0;
            index <= 0;
            digit_buffer <= 0;
        end
        else begin
            if(enable) begin
                if (in_data >= max && !in_data[DWIDTH-1]) begin
                        max <= in_data; 
                        index <= i;
                end
                
                if(i == 9) done <= 1'b1;
                
                i <= i + 1'b1;
            end
            else if (done) begin
                layer_done_buffer <= 1;
                digit_buffer <= index;
                i <= 0;
                max <= 0;
                index <= 0;
                done <= 0;
            end
            else begin
                layer_done_buffer <= 0;
                digit_buffer <= 0;
            end
        end
    end
    assign layer_done = layer_done_buffer;
    assign digit = digit_buffer;
endmodule
