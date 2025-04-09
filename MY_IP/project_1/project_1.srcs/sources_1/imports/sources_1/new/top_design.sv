`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 10:00:53 AM
// Design Name: 
// Module Name: top_design
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


module top_design
#(  parameter DWIDTH = 16,
    parameter ADDR_WIDTH = 10,
    parameter BUFFER_SIZE = 64,
    parameter BUFFER_SIZE_BIAS = 10,
    parameter NUM_DATA = 16,
    parameter IN_SIZE =64, 
    parameter fractional = 10
)
(
    input clk,
    input nreset,
    
    input we_i,
    input [ADDR_WIDTH-1:0] addr_i,
    input [DWIDTH-1:0] din_i,
        
    output reg [DWIDTH-1:0] dout_o,
    output reg doutvld_o,
    output reg cal_done
    );
    
    wire [DWIDTH-1:0] neuron_out;
    wire neuron_done;
    
    reg [DWIDTH-1:0] data_r, bias_r, weight_r;
    wire [DWIDTH-1:0] data_w, bias_w, weight_w;
    
    assign data_w = data_r;
    assign bias_w = bias_r;
    assign weight_w = weight_r;
    
    reg we_data_r, we_bias_r, we_weight_r;
    wire we_data_w, we_bias_w, we_weight_w;
    
    assign we_data_w = we_data_r;
    assign we_bias_w = we_bias_r;
    assign we_weight_w = we_weight_r;
    
    wire re_data;
    wire re_bias;
    wire re_weight;
    
    wire load_en;
    
    wire buf_ready_data;
    wire buf_ready_bias;
    wire buf_ready_weight;
    
    controller #(.BUFFER_SIZE(BUFFER_SIZE),.NUM_DATA(NUM_DATA))
    ctl (.clk(clk),.nreset(nreset), 
         .re_data(re_data),.re_bias(re_bias),.re_weight(re_weight),
         .buf_ready_data(buf_ready_data),.buf_ready_bias(buf_ready_bias),.buf_ready_weight(buf_ready_weight),
         .load_en(load_en));
    
    
    datapath #(.DWIDTH(DWIDTH),.BUFFER_SIZE(BUFFER_SIZE),.BUFFER_SIZE_BIAS(BUFFER_SIZE_BIAS),
                .NUM_DATA(NUM_DATA),.IN_SIZE(IN_SIZE),.fractional(fractional))
    dtp (.clk(clk),.nreset(nreset),
        .we_data(we_data_w),.we_bias(we_bias_w),.we_weight(we_weight_w),
        .input_data(data_w),.input_bias(bias_w),.input_weight(weight_w),
        .re_data(re_data),.re_bias(re_bias),.re_weight(re_weight),
        .buf_ready_data(buf_ready_data),.buf_ready_bias(buf_ready_bias),.buf_ready_weight(buf_ready_weight),
        .load_en(load_en),.neuron_out(neuron_out),.neuron_done(neuron_done) );
    
    always @(posedge clk or negedge nreset) begin
        if(~nreset) begin
            data_r      <= '{default: '0};
            bias_r      <= '{default: '0};
            weight_r    <= '{default: '0};
            
            we_data_r      <= 0;
            we_bias_r      <= 0;
            we_weight_r    <= 0;
        end
        else begin
            if(we_i) begin 
                if( (addr_i >= 0) && (addr_i <= BUFFER_SIZE - 1) )
                    begin
                        data_r      <= din_i;
                        bias_r      <= bias_w;
                        weight_r    <= weight_w; 
                        
                        we_data_r      <= 1;
                        we_bias_r      <= 0;
                        we_weight_r    <= 0;
                    end
                else if( (addr_i >= 100) && (addr_i <= 100 + BUFFER_SIZE_BIAS - 1) )
                    begin
                        data_r      <= data_w;
                        bias_r      <= din_i;
                        weight_r    <= weight_w;
                        
                        we_data_r      <= 0;
                        we_bias_r      <= 1;
                        we_weight_r    <= 0; 
                    end
                else if( (addr_i >= 200) && (addr_i <= 200 + BUFFER_SIZE_BIAS*BUFFER_SIZE - 1) )
                    begin
                        data_r      <= data_w;
                        bias_r      <= bias_w;
                        weight_r    <= din_i; 
                        
                        we_data_r      <= 0;
                        we_bias_r      <= 0;
                        we_weight_r    <= 1;
                    end   
                else begin
                        data_r      <= data_w;
                        bias_r      <= bias_w;
                        weight_r    <= weight_w; 
                        
                        we_data_r      <= 0;
                        we_bias_r      <= 0;
                        we_weight_r    <= 0;
                    end

            end
            else begin
                data_r      <= data_w;
                bias_r      <= bias_w;
                weight_r    <= weight_w; 
                
                we_data_r      <= 0;
                we_bias_r      <= 0;
                we_weight_r    <= 0;
            end
        end
    end
    reg [9:0] ff_pointer, r_pointer;
    reg [DWIDTH-1:0] dout_fifo [0:BUFFER_SIZE_BIAS-1];

    always @(posedge clk or negedge nreset) begin
        if(~nreset) begin
            ff_pointer  <= 0;
            r_pointer   <= 0;
            cal_done    <= 0;
            dout_o      <= 0;
            doutvld_o   <= 0;
            dout_fifo   <= '{default: '0};
        end
        else begin
            if(neuron_done && ~cal_done) begin
                dout_fifo [ff_pointer] <= neuron_out;
                if(ff_pointer == BUFFER_SIZE_BIAS-1) begin
                    cal_done            <= 1;
                    ff_pointer          <= 0;
                end
                else ff_pointer         <=  ff_pointer + 1;
            end
            else dout_fifo [ff_pointer] <= dout_fifo [ff_pointer];
            
            if(cal_done && (addr_i >= 160) && (addr_i <= 160 + BUFFER_SIZE_BIAS - 1) ) begin
                doutvld_o <= 1;
                dout_o    <= dout_fifo [r_pointer];
                if(r_pointer == BUFFER_SIZE_BIAS-1) begin
                    cal_done           <= 0;
                    r_pointer          <= 0;
                end
                else r_pointer         <=  r_pointer + 1;
                end
            else begin 
                    dout_o    <= 0;
                    doutvld_o <= 0;
            end
        end
    end
    
    ila_test ils_test_ins (
		.clk(clk),
		.probe0(we_i), 	        // 1-bit
		.probe1(addr_i), 	    // 10-bit
		.probe2(din_i), 	    // 16-bit
		.probe3(dout_o), 	    // 16-bit
		.probe4(doutvld_o),     // 1-bit
		.probe5(cal_done),      // 1-bit
		.probe6(neuron_out),    // 16-bit
		.probe7(neuron_done)    // 16-bit
	);
    
endmodule
