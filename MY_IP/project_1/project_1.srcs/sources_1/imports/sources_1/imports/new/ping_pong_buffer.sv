`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2025 01:03:00 PM
// Design Name: 
// Module Name: ping_pong_buffer
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


module ping_pong_buffer #(parameter DWIDTH = 32, BUFFER_SIZE = 64, NUM_DATA = 16)(
    input wire clk,
    input wire nreset,
    input wire we,
    input wire [DWIDTH-1:0] dma_input,
    input wire re,
    
    output wire [(DWIDTH*NUM_DATA)-1:0] buf_output, // Burst 16 data packed
    output reg buffer_ready
);

    reg buf_valid;
    (* ram_style = "block" *) reg [DWIDTH-1:0] buffer_A [0:BUFFER_SIZE-1];
    (* ram_style = "block" *) reg [DWIDTH-1:0] buffer_B [0:BUFFER_SIZE-1];
    reg ping_pong; // 0: A đang ghi, B đang đọc | 1: B đang ghi, A đang đọc
    reg [15:0] write_ptr;
    reg [15:0] read_ptr;
    wire [(DWIDTH*NUM_DATA)-1:0] selected_buffer;
    reg [15:0] read_count;

    always @(posedge clk or negedge nreset) begin
        if (~nreset) begin
            buffer_A <= '{default: '0};
            buffer_B <= '{default: '0};
            ping_pong <= 0;
            write_ptr <= 0;
            read_ptr <= 0;
            read_count <= 0;
            buf_valid <= 0;
            buffer_ready <= 0;
        end else begin

            if (we) begin
                if (!ping_pong) 
                    buffer_A[write_ptr] <= dma_input;
                else 
                    buffer_B[write_ptr] <= dma_input;
                
                if (write_ptr == BUFFER_SIZE-1) begin
                    ping_pong <= ~ping_pong;
                    buffer_ready <= 1;
                    write_ptr <= 0;
                end else begin
                    write_ptr <= write_ptr + 1;
                end
            end

            // Khối FC đọc số NUM_DATA data khi buffer sẵn sàng
            if (buffer_ready && re) begin
                buf_valid <= 1;
                // Đảm bảo đọc từ buffer đang active
                read_ptr <= (read_count == 0) ? 0 : read_ptr + 1;
                read_count <= read_count + NUM_DATA;
            
                // Đặt lại read_count sau khi đọc đủ BUFFER_SIZE
                if (read_count >= BUFFER_SIZE-NUM_DATA) begin
                    buffer_ready <= 0; // Tắt buffer_ready sau khi đọc đủ số data
                    read_count <= 0;
                end
            end else begin
                buf_valid <= 0;
            end 
        end
    end

    generate 
        genvar i;
        for (i = 0; i < NUM_DATA; i = i + 1) begin
            assign selected_buffer[(i+1)*DWIDTH-1 -: DWIDTH] = (!ping_pong) ? buffer_B[read_ptr*NUM_DATA + i] : buffer_A[read_ptr*NUM_DATA + i];
        end
    endgenerate
    
    assign buf_output = buf_valid ? selected_buffer : 0;
endmodule

