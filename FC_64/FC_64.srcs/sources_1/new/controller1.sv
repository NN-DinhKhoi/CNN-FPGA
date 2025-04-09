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


module controller1
#(parameter BUFFER_SIZE = 64, NUM_DATA = 16)
(
    input clk,
    input nreset, 
    
    input buf_ready_data,
    input buf_ready_bias,
    input buf_ready_weight,
    
    (*io_buffer_type = "none"*)output reg re_data,
    (*io_buffer_type = "none"*)output reg re_bias,
    (*io_buffer_type = "none"*)output reg re_weight,
    
    (*io_buffer_type = "none"*)output reg load_en
    );
    
    reg [7:0] count;
    
    logic re_data_logic, re_bias_logic, re_weight_logic, load_en_logic;
    reg buf_ready_data_buf,buf_ready_weight_buf,buf_ready_bias_buf;
    
    buf buf_data (buf_ready_data_buf,buf_ready_data);
    buf buf_weight (buf_ready_weight_buf,buf_ready_weight);
    buf buf_bias (buf_ready_bias_buf,buf_ready_bias);
    
    assign re_data_logic = buf_ready_data_buf & buf_ready_bias_buf & buf_ready_weight_buf;
    assign re_weight_logic = buf_ready_data_buf & buf_ready_bias_buf & buf_ready_weight_buf;
    assign load_en_logic = buf_ready_data_buf & buf_ready_bias_buf & buf_ready_weight_buf & re_data & re_weight;
    assign re_bias_logic = buf_ready_data_buf & buf_ready_bias_buf & buf_ready_weight_buf & re_data & re_weight & (count >= BUFFER_SIZE/NUM_DATA - 2);
    
    always @(posedge clk or negedge nreset) begin
        if(~nreset)begin
            count <= 0;
        end
        else begin
            if(buf_ready_data_buf & buf_ready_bias_buf & buf_ready_weight_buf & re_data & re_weight ) 
                if ( count >= BUFFER_SIZE/NUM_DATA - 2 )
                    count <= '0;
                else count <= count + 1'b1;
        end
            
    end
    
    always @(posedge clk or negedge nreset) begin
        if (~nreset) begin
            re_data <= 0;
            re_bias <= 0;
            re_weight <= 0;
            load_en <= 0;
        end
        else begin
            re_data <= re_data_logic;
            re_bias <= re_bias_logic;
            re_weight <= re_weight_logic;
            load_en <= load_en_logic;
                        
        end 
    end
    
    
endmodule
