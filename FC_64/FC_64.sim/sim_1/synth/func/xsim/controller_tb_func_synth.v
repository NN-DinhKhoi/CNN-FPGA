// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Tue Mar 11 11:18:49 2025
// Host        : DESKTOP-R9-7945HX running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/GiaPhuc/Project_1/Dense_0/FC_64/FC_64.sim/sim_1/synth/func/xsim/controller_tb_func_synth.v
// Design      : controller1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* BUFFER_SIZE = "64" *) (* NUM_DATA = "16" *) 
(* NotValidForBitStream *)
module controller1
   (clk,
    nreset,
    buf_ready_data,
    buf_ready_bias,
    buf_ready_weight,
    re_data,
    re_bias,
    re_weight,
    load_en);
  input clk;
  input nreset;
  input buf_ready_data;
  input buf_ready_bias;
  input buf_ready_weight;
  (* IO_BUFFER_TYPE = "none" *) output re_data;
  (* IO_BUFFER_TYPE = "none" *) output re_bias;
  (* IO_BUFFER_TYPE = "none" *) output re_weight;
  (* IO_BUFFER_TYPE = "none" *) output load_en;

  wire buf_ready_bias;
  wire buf_ready_bias_IBUF;
  wire buf_ready_data;
  wire buf_ready_data_IBUF;
  wire buf_ready_weight;
  wire buf_ready_weight_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [1:0]count;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire load_en;
  wire load_en_logic;
  wire nreset;
  wire nreset_IBUF;
  wire p_1_in;
  wire re_bias;
  wire re_bias_logic;
  wire re_data;
  wire re_data_i_2_n_0;

  assign re_weight = re_data;
  IBUF buf_ready_bias_IBUF_inst
       (.I(buf_ready_bias),
        .O(buf_ready_bias_IBUF));
  IBUF buf_ready_data_IBUF_inst
       (.I(buf_ready_data),
        .O(buf_ready_data_IBUF));
  IBUF buf_ready_weight_IBUF_inst
       (.I(buf_ready_weight),
        .O(buf_ready_weight_IBUF));
  (* XILINX_LEGACY_PRIM = "BUFG" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  BUFGCE #(
    .CE_TYPE("ASYNC"),
    .SIM_DEVICE("ULTRASCALE_PLUS"),
    .STARTUP_SYNC("FALSE")) 
    clk_IBUF_BUFG_inst
       (.CE(1'b1),
        .I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .I1(count[1]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \count[1]_i_1 
       (.I0(count[0]),
        .I1(count[1]),
        .O(\count[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(load_en_logic),
        .CLR(re_data_i_2_n_0),
        .D(\count[0]_i_1_n_0 ),
        .Q(count[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(load_en_logic),
        .CLR(re_data_i_2_n_0),
        .D(\count[1]_i_1_n_0 ),
        .Q(count[1]));
  LUT4 #(
    .INIT(16'h8000)) 
    load_en_i_1
       (.I0(buf_ready_weight_IBUF),
        .I1(buf_ready_bias_IBUF),
        .I2(buf_ready_data_IBUF),
        .I3(re_data),
        .O(load_en_logic));
  (* io_buffer_type = "none" *) 
  FDCE #(
    .INIT(1'b0)) 
    load_en_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(re_data_i_2_n_0),
        .D(load_en_logic),
        .Q(load_en));
  IBUF nreset_IBUF_inst
       (.I(nreset),
        .O(nreset_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    re_bias_i_1
       (.I0(re_data),
        .I1(buf_ready_data_IBUF),
        .I2(buf_ready_bias_IBUF),
        .I3(buf_ready_weight_IBUF),
        .I4(count[1]),
        .O(re_bias_logic));
  (* io_buffer_type = "none" *) 
  FDCE #(
    .INIT(1'b0)) 
    re_bias_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(re_data_i_2_n_0),
        .D(re_bias_logic),
        .Q(re_bias));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h80)) 
    re_data_i_1
       (.I0(buf_ready_data_IBUF),
        .I1(buf_ready_bias_IBUF),
        .I2(buf_ready_weight_IBUF),
        .O(p_1_in));
  LUT1 #(
    .INIT(2'h1)) 
    re_data_i_2
       (.I0(nreset_IBUF),
        .O(re_data_i_2_n_0));
  (* io_buffer_type = "none" *) 
  FDCE #(
    .INIT(1'b0)) 
    re_data_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(re_data_i_2_n_0),
        .D(p_1_in),
        .Q(re_data));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
