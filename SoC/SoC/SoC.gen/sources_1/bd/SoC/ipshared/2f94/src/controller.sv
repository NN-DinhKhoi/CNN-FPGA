`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:00:53 AM
// Design Name: 
// Module Name: controller
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


module controller
#(parameter BUFFER_SIZE = 64, NUM_DATA = 16)
(
    input clk,
    input nreset, 
    
    input buf_ready_data,
    input buf_ready_bias,
    input buf_ready_weight,
    
    output reg re_data,
    output reg re_bias,
    output reg re_weight,
    
    output reg load_en
    );
    
    reg [11:0] count;
    
    always @(posedge clk or negedge nreset) begin
        if (~nreset) begin
            re_data <= 0;
            re_bias <= 0;
            re_weight <= 0;
            load_en <= 0;
            count <= 0;
        end
        else begin
            if (buf_ready_data & buf_ready_bias & buf_ready_weight) begin
                re_data <= 1;
                re_weight <= 1;
                
                if( re_data & re_weight ) begin
                    load_en <= 1;
                    if ( count >= BUFFER_SIZE/NUM_DATA - 2 ) begin
                        re_bias <= 1;
                        count <= 0;
                    end
                    else begin
                        re_bias <= 0;
                        count <= count + 1;
                    end
                end
                else begin
                    load_en <= 0;
                    re_bias <= 0;
                    count <= 0;
                end
            end
            else begin
                re_data <= 0;
                re_weight <= 0;
                re_bias <= 0;
                load_en <= 0;
                count <= 0;
            end
                        
        end 
    end
    
    
endmodule
