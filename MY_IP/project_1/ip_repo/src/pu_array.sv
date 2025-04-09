`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 07:58:38 PM
// Design Name: 
// Module Name: neuron4
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


//module pu_array #(parameter IN_SIZE =64, BUFFER_SIZE = 2, DWIDTH = 16, fractional = 21, NUM_DATA = 8)(
//    input clk,
//    input load_en,
//    input nreset,
//    input [DWIDTH*NUM_DATA*BUFFER_SIZE-1:0] in_data,
//    input [DWIDTH*NUM_DATA*BUFFER_SIZE-1:0] weight,
//    input [DWIDTH-1:0] bias,
//    output wire [DWIDTH-1:0] neuron_out,
//    output reg neuron_done
//    );

//    reg [DWIDTH-1:0] loop;   
//    reg valid;
//    wire [DWIDTH*NUM_DATA*BUFFER_SIZE-1:0] out_PU_ins;
//    wire [DWIDTH-1:0] out_adder_tree;
//    reg clear_accum;
    
//    reg [DWIDTH-1:0]temp_bias;
//    genvar i;
//    generate
//        for(i = 0; i < BUFFER_SIZE*NUM_DATA; i = i+ 1) begin : PU_instances
//            process_unit #(.DATA_WIDTH(DWIDTH), .fractional(fractional)) PU_mul_add (
//                .clk(clk),
//                .rst(nreset),
//                .enable(load_en),
//                .clear_accum(clear_accum),
//                .in_data(in_data[(i+1)*DWIDTH-1 : i*DWIDTH]),
//                .weight(weight[(i+1)*DWIDTH-1 : i*DWIDTH]),
//                .result(out_PU_ins[(i+1)*DWIDTH-1 : i*DWIDTH])
//            );
//        end
//    endgenerate 
    
//    adder_tree_16 #(.DATA_WIDTH(DWIDTH)) adt16 (
//            .data_in(out_PU_ins), 
//            .data_out(out_adder_tree)
//        );
        
//    assign neuron_out = (neuron_done) ? (out_adder_tree + temp_bias) : 0;
    
//    always @(posedge clk or negedge nreset) begin
//        if(~nreset) begin
//            loop <= 0;
//		    temp_bias <= 0;
//            neuron_done <= 0;
//            clear_accum <= 0;
//            valid <= 0;
//        end
//        else begin
//            if (load_en) begin
//                    temp_bias <= bias;
//                    loop <= loop + 1;
//                if(loop == IN_SIZE/(BUFFER_SIZE*NUM_DATA) - 1) begin
//                    valid <= 1;
//                    loop <= 0;
//                end
//            end
//            if (valid) begin
//                valid <= 0;
//                neuron_done <= 1;
//                clear_accum <= 1;
//            end
//            if (neuron_done) begin
//                temp_bias <= 0;
//                clear_accum <= 0;
//                neuron_done <= 0;
//            end
            
//        end
//    end
//endmodule
module pu_array #(parameter IN_SIZE =64, DWIDTH = 16, fractional = 10, NUM_DATA = 16)(
    input clk,
    input load_en,
    input nreset,
    input [DWIDTH*NUM_DATA-1:0] in_data,
    input [DWIDTH*NUM_DATA-1:0] weight,
    input [DWIDTH-1:0] bias,
    output reg [DWIDTH-1:0] neuron_out,
    output reg neuron_done
    );

    reg [DWIDTH-1:0] loop;
    reg [DWIDTH*NUM_DATA-1:0] out_PU_ins_dff;
    reg [DWIDTH-1:0] out_adder_tree_dff;
    reg wait_mul, valid_PU_ins, valid_adder_tree, valid_neuron;
    
    wire [DWIDTH*NUM_DATA-1:0] out_PU_ins;
    wire [DWIDTH-1:0] out_adder_tree;
    wire [DWIDTH-1:0] out_add_sum_bias;
    reg clear_accum;
    
    reg [DWIDTH-1:0]temp_bias;
    genvar i;
    generate
        for(i = 0; i < NUM_DATA; i = i+ 1) begin : PU_instances
            process_unit #(.DWIDTH(DWIDTH), .fractional(fractional)) PU_mul_add (
                .clk(clk),
                .rst(nreset),
                .enable(load_en),
                .clear_accum(clear_accum),
                .in_data(in_data[(i+1)*DWIDTH-1 : i*DWIDTH]),
                .weight(weight[(i+1)*DWIDTH-1 : i*DWIDTH]),
                .result(out_PU_ins[(i+1)*DWIDTH-1 : i*DWIDTH])
            );
        end
    endgenerate 
    
    wire [DWIDTH*NUM_DATA-1:0] out_PU_ins_buf;
    assign out_PU_ins_buf = out_PU_ins;
    
    adder_tree_16 #(.DWIDTH(DWIDTH)) adt16 (
           .data_in(out_PU_ins_dff), 
           .data_out(out_adder_tree)
    );

//	assign neuron_out = (neuron_done) ? (out_adder_tree_dff) : 0;

    always @(posedge clk or negedge nreset) begin
        if(~nreset) begin
            loop <= 0;
		    temp_bias <= 0;
            neuron_done <= 0;
            clear_accum <= 0;
            wait_mul <= 0;
            valid_PU_ins <= 0;
            valid_adder_tree <= 0;
            out_PU_ins_dff <= 0;
            out_adder_tree_dff <= 0;
        end
        else begin
            if (load_en) begin
                loop <= loop + 1;
                if(loop == IN_SIZE/(NUM_DATA) - 1) begin
                    wait_mul <= 1;
                    temp_bias <= bias;
                    loop <= 0;
                end
                else wait_mul <= 0;
            end
            
            if(wait_mul) wait_mul <=0;
            
            clear_accum <= wait_mul;
            
            valid_PU_ins <= wait_mul;
            
            if (valid_PU_ins && !wait_mul) begin
                out_PU_ins_dff <= out_PU_ins_buf;
            end
            
            valid_adder_tree <= valid_PU_ins;
            
            if (valid_adder_tree) begin
                out_adder_tree_dff <= out_adder_tree;
            end
            
            valid_neuron <= valid_adder_tree;
            
            if (valid_neuron) begin
                neuron_done <= 1;
                neuron_out <= out_adder_tree_dff + temp_bias;
            end
            else begin
                neuron_done <= 0;
                neuron_out <= 0;
            end
            
        end  
    end
    
endmodule

