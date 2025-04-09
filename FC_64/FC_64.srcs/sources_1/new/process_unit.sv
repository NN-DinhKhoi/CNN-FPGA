`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 09:57:02 AM
// Design Name: 
// Module Name: process_unit
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


module process_unit #(DATA_WIDTH = 16, fractional = 5)(
input wire clk,
input wire rst,
input wire enable,
input wire clear_accum,
input wire [DATA_WIDTH-1:0] in_data,
input wire [DATA_WIDTH-1:0] weight,
output reg [DATA_WIDTH-1:0] result
);

reg [DATA_WIDTH-1:0] res_1;
reg valid;


fxp_mult #(.DATA_WIDTH(DATA_WIDTH), .FRACTIONAL(fractional)) mul(
        .clk(clk),
        .mult_select(enable),
        .multiplicand(in_data), 
        .multiplier(weight),
        .product(res_1) 
);
always @(posedge clk or negedge rst)
begin

    if (~rst) begin
        result <= 0;
        valid <= 0;
    end
    else 
    begin
        if (clear_accum == 1) result <= 0;
        valid <= enable;;
        if (valid == 1) begin
            if(clear_accum == 1) result <= res_1;
            else result <= result + res_1;
        end
    end
end

endmodule
