`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 09:22:21 PM
// Design Name: 
// Module Name: data_buffer
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


module data_buffer #(
    parameter DWIDTH = 32,
    parameter BUFFER_SIZE = 64,
    parameter NUM_DATA = 16
)(
    input wire clk,
    input wire nreset,
    input wire we,
    input wire [DWIDTH-1:0] dma_input,
    input wire re,
    output reg buffer_ready,
    output wire [(DWIDTH*NUM_DATA)-1:0] buf_output
);

    reg buf_valid;
    (* ram_style = "block" *) reg [DWIDTH-1:0] buffer [0:BUFFER_SIZE-1];
    wire [(DWIDTH*NUM_DATA)-1:0] data_bus;
    reg [15:0] write_ptr;
    reg [15:0] read_ptr;
    reg [15:0] read_count;
    reg buffer_ready_en;

    
    always @(posedge clk or negedge nreset) begin
        if (~nreset) begin
            buffer <= '{default: '0};
            write_ptr <= 0;
            buffer_ready <= 0;
            read_ptr <= 0;
            read_count <= 0;
            buf_valid <= 0;
            buffer_ready_en <= 0;
        end else begin
            // Ghi data vào buffer
            if (we) begin
            buffer[write_ptr] <= dma_input;
            write_ptr <= (write_ptr == BUFFER_SIZE-1) ? 0 : write_ptr + 1;

            if (write_ptr == BUFFER_SIZE-1) 
                buffer_ready <= 1; // Báo đầy
            end
            
            // Đọc data
            if (buffer_ready && re) begin
                buf_valid <= 1;
                read_ptr <= (read_count == 0) ? 0 : read_ptr + 1;
                read_count <= read_count + NUM_DATA;
                if (read_count >= BUFFER_SIZE-NUM_DATA) begin
                    read_count <= 0;
                    buffer_ready <= 0;
                    buffer_ready_en <= 1;
                end
            end else begin
                if (buffer_ready_en) begin
                     buffer_ready <= 1;
                     buffer_ready_en <= 0;
                 end
                buf_valid <= 0;
            end
            
        end
    end

    
    // Ghép dữ liệu đọc thành bus (NUM_DATA phần tử)
    genvar i;
    generate
        for (i = 0; i < NUM_DATA; i = i + 1) begin
            assign data_bus[(i+1)*DWIDTH-1 -: DWIDTH] = buffer[read_ptr*NUM_DATA + i];
        end
    endgenerate
    assign buf_output = buf_valid ? data_bus : 0;
endmodule

