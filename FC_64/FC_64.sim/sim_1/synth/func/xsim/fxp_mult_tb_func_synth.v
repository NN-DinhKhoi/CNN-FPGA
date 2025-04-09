// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Mar 10 19:20:30 2025
// Host        : DESKTOP-R9-7945HX running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/GiaPhuc/Project_1/Dense_0/FC_64/FC_64.sim/sim_1/synth/func/xsim/fxp_mult_tb_func_synth.v
// Design      : fxp_mult
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* DATA_WIDTH = "32" *) (* fractional = "0" *) 
(* NotValidForBitStream *)
module fxp_mult
   (clk,
    mult_select,
    multiplicand,
    multiplier,
    product);
  input clk;
  input mult_select;
  input [31:0]multiplicand;
  input [31:0]multiplier;
  output [31:0]product;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire mult_select;
  wire mult_select_IBUF;
  wire [31:0]multiplicand;
  wire [31:0]multiplicand_IBUF;
  wire [31:0]multiplier;
  wire [31:0]multiplier_IBUF;
  wire [31:0]product;
  wire [31:0]product_OBUF;
  wire [63:32]NLW_mult_P_UNCONNECTED;

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
  (* CHECK_LICENSE_TYPE = "mult,mult_gen_v12_0_21,{}" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_core_info = "mult_gen_v12_0_21,Vivado 2024.1" *) 
  mult mult
       (.A(multiplicand_IBUF),
        .B(multiplier_IBUF),
        .CE(mult_select_IBUF),
        .CLK(clk_IBUF_BUFG),
        .P({NLW_mult_P_UNCONNECTED[63:32],product_OBUF}));
  IBUF mult_select_IBUF_inst
       (.I(mult_select),
        .O(mult_select_IBUF));
  IBUF \multiplicand_IBUF[0]_inst 
       (.I(multiplicand[0]),
        .O(multiplicand_IBUF[0]));
  IBUF \multiplicand_IBUF[10]_inst 
       (.I(multiplicand[10]),
        .O(multiplicand_IBUF[10]));
  IBUF \multiplicand_IBUF[11]_inst 
       (.I(multiplicand[11]),
        .O(multiplicand_IBUF[11]));
  IBUF \multiplicand_IBUF[12]_inst 
       (.I(multiplicand[12]),
        .O(multiplicand_IBUF[12]));
  IBUF \multiplicand_IBUF[13]_inst 
       (.I(multiplicand[13]),
        .O(multiplicand_IBUF[13]));
  IBUF \multiplicand_IBUF[14]_inst 
       (.I(multiplicand[14]),
        .O(multiplicand_IBUF[14]));
  IBUF \multiplicand_IBUF[15]_inst 
       (.I(multiplicand[15]),
        .O(multiplicand_IBUF[15]));
  IBUF \multiplicand_IBUF[16]_inst 
       (.I(multiplicand[16]),
        .O(multiplicand_IBUF[16]));
  IBUF \multiplicand_IBUF[17]_inst 
       (.I(multiplicand[17]),
        .O(multiplicand_IBUF[17]));
  IBUF \multiplicand_IBUF[18]_inst 
       (.I(multiplicand[18]),
        .O(multiplicand_IBUF[18]));
  IBUF \multiplicand_IBUF[19]_inst 
       (.I(multiplicand[19]),
        .O(multiplicand_IBUF[19]));
  IBUF \multiplicand_IBUF[1]_inst 
       (.I(multiplicand[1]),
        .O(multiplicand_IBUF[1]));
  IBUF \multiplicand_IBUF[20]_inst 
       (.I(multiplicand[20]),
        .O(multiplicand_IBUF[20]));
  IBUF \multiplicand_IBUF[21]_inst 
       (.I(multiplicand[21]),
        .O(multiplicand_IBUF[21]));
  IBUF \multiplicand_IBUF[22]_inst 
       (.I(multiplicand[22]),
        .O(multiplicand_IBUF[22]));
  IBUF \multiplicand_IBUF[23]_inst 
       (.I(multiplicand[23]),
        .O(multiplicand_IBUF[23]));
  IBUF \multiplicand_IBUF[24]_inst 
       (.I(multiplicand[24]),
        .O(multiplicand_IBUF[24]));
  IBUF \multiplicand_IBUF[25]_inst 
       (.I(multiplicand[25]),
        .O(multiplicand_IBUF[25]));
  IBUF \multiplicand_IBUF[26]_inst 
       (.I(multiplicand[26]),
        .O(multiplicand_IBUF[26]));
  IBUF \multiplicand_IBUF[27]_inst 
       (.I(multiplicand[27]),
        .O(multiplicand_IBUF[27]));
  IBUF \multiplicand_IBUF[28]_inst 
       (.I(multiplicand[28]),
        .O(multiplicand_IBUF[28]));
  IBUF \multiplicand_IBUF[29]_inst 
       (.I(multiplicand[29]),
        .O(multiplicand_IBUF[29]));
  IBUF \multiplicand_IBUF[2]_inst 
       (.I(multiplicand[2]),
        .O(multiplicand_IBUF[2]));
  IBUF \multiplicand_IBUF[30]_inst 
       (.I(multiplicand[30]),
        .O(multiplicand_IBUF[30]));
  IBUF \multiplicand_IBUF[31]_inst 
       (.I(multiplicand[31]),
        .O(multiplicand_IBUF[31]));
  IBUF \multiplicand_IBUF[3]_inst 
       (.I(multiplicand[3]),
        .O(multiplicand_IBUF[3]));
  IBUF \multiplicand_IBUF[4]_inst 
       (.I(multiplicand[4]),
        .O(multiplicand_IBUF[4]));
  IBUF \multiplicand_IBUF[5]_inst 
       (.I(multiplicand[5]),
        .O(multiplicand_IBUF[5]));
  IBUF \multiplicand_IBUF[6]_inst 
       (.I(multiplicand[6]),
        .O(multiplicand_IBUF[6]));
  IBUF \multiplicand_IBUF[7]_inst 
       (.I(multiplicand[7]),
        .O(multiplicand_IBUF[7]));
  IBUF \multiplicand_IBUF[8]_inst 
       (.I(multiplicand[8]),
        .O(multiplicand_IBUF[8]));
  IBUF \multiplicand_IBUF[9]_inst 
       (.I(multiplicand[9]),
        .O(multiplicand_IBUF[9]));
  IBUF \multiplier_IBUF[0]_inst 
       (.I(multiplier[0]),
        .O(multiplier_IBUF[0]));
  IBUF \multiplier_IBUF[10]_inst 
       (.I(multiplier[10]),
        .O(multiplier_IBUF[10]));
  IBUF \multiplier_IBUF[11]_inst 
       (.I(multiplier[11]),
        .O(multiplier_IBUF[11]));
  IBUF \multiplier_IBUF[12]_inst 
       (.I(multiplier[12]),
        .O(multiplier_IBUF[12]));
  IBUF \multiplier_IBUF[13]_inst 
       (.I(multiplier[13]),
        .O(multiplier_IBUF[13]));
  IBUF \multiplier_IBUF[14]_inst 
       (.I(multiplier[14]),
        .O(multiplier_IBUF[14]));
  IBUF \multiplier_IBUF[15]_inst 
       (.I(multiplier[15]),
        .O(multiplier_IBUF[15]));
  IBUF \multiplier_IBUF[16]_inst 
       (.I(multiplier[16]),
        .O(multiplier_IBUF[16]));
  IBUF \multiplier_IBUF[17]_inst 
       (.I(multiplier[17]),
        .O(multiplier_IBUF[17]));
  IBUF \multiplier_IBUF[18]_inst 
       (.I(multiplier[18]),
        .O(multiplier_IBUF[18]));
  IBUF \multiplier_IBUF[19]_inst 
       (.I(multiplier[19]),
        .O(multiplier_IBUF[19]));
  IBUF \multiplier_IBUF[1]_inst 
       (.I(multiplier[1]),
        .O(multiplier_IBUF[1]));
  IBUF \multiplier_IBUF[20]_inst 
       (.I(multiplier[20]),
        .O(multiplier_IBUF[20]));
  IBUF \multiplier_IBUF[21]_inst 
       (.I(multiplier[21]),
        .O(multiplier_IBUF[21]));
  IBUF \multiplier_IBUF[22]_inst 
       (.I(multiplier[22]),
        .O(multiplier_IBUF[22]));
  IBUF \multiplier_IBUF[23]_inst 
       (.I(multiplier[23]),
        .O(multiplier_IBUF[23]));
  IBUF \multiplier_IBUF[24]_inst 
       (.I(multiplier[24]),
        .O(multiplier_IBUF[24]));
  IBUF \multiplier_IBUF[25]_inst 
       (.I(multiplier[25]),
        .O(multiplier_IBUF[25]));
  IBUF \multiplier_IBUF[26]_inst 
       (.I(multiplier[26]),
        .O(multiplier_IBUF[26]));
  IBUF \multiplier_IBUF[27]_inst 
       (.I(multiplier[27]),
        .O(multiplier_IBUF[27]));
  IBUF \multiplier_IBUF[28]_inst 
       (.I(multiplier[28]),
        .O(multiplier_IBUF[28]));
  IBUF \multiplier_IBUF[29]_inst 
       (.I(multiplier[29]),
        .O(multiplier_IBUF[29]));
  IBUF \multiplier_IBUF[2]_inst 
       (.I(multiplier[2]),
        .O(multiplier_IBUF[2]));
  IBUF \multiplier_IBUF[30]_inst 
       (.I(multiplier[30]),
        .O(multiplier_IBUF[30]));
  IBUF \multiplier_IBUF[31]_inst 
       (.I(multiplier[31]),
        .O(multiplier_IBUF[31]));
  IBUF \multiplier_IBUF[3]_inst 
       (.I(multiplier[3]),
        .O(multiplier_IBUF[3]));
  IBUF \multiplier_IBUF[4]_inst 
       (.I(multiplier[4]),
        .O(multiplier_IBUF[4]));
  IBUF \multiplier_IBUF[5]_inst 
       (.I(multiplier[5]),
        .O(multiplier_IBUF[5]));
  IBUF \multiplier_IBUF[6]_inst 
       (.I(multiplier[6]),
        .O(multiplier_IBUF[6]));
  IBUF \multiplier_IBUF[7]_inst 
       (.I(multiplier[7]),
        .O(multiplier_IBUF[7]));
  IBUF \multiplier_IBUF[8]_inst 
       (.I(multiplier[8]),
        .O(multiplier_IBUF[8]));
  IBUF \multiplier_IBUF[9]_inst 
       (.I(multiplier[9]),
        .O(multiplier_IBUF[9]));
  OBUF \product_OBUF[0]_inst 
       (.I(product_OBUF[0]),
        .O(product[0]));
  OBUF \product_OBUF[10]_inst 
       (.I(product_OBUF[10]),
        .O(product[10]));
  OBUF \product_OBUF[11]_inst 
       (.I(product_OBUF[11]),
        .O(product[11]));
  OBUF \product_OBUF[12]_inst 
       (.I(product_OBUF[12]),
        .O(product[12]));
  OBUF \product_OBUF[13]_inst 
       (.I(product_OBUF[13]),
        .O(product[13]));
  OBUF \product_OBUF[14]_inst 
       (.I(product_OBUF[14]),
        .O(product[14]));
  OBUF \product_OBUF[15]_inst 
       (.I(product_OBUF[15]),
        .O(product[15]));
  OBUF \product_OBUF[16]_inst 
       (.I(product_OBUF[16]),
        .O(product[16]));
  OBUF \product_OBUF[17]_inst 
       (.I(product_OBUF[17]),
        .O(product[17]));
  OBUF \product_OBUF[18]_inst 
       (.I(product_OBUF[18]),
        .O(product[18]));
  OBUF \product_OBUF[19]_inst 
       (.I(product_OBUF[19]),
        .O(product[19]));
  OBUF \product_OBUF[1]_inst 
       (.I(product_OBUF[1]),
        .O(product[1]));
  OBUF \product_OBUF[20]_inst 
       (.I(product_OBUF[20]),
        .O(product[20]));
  OBUF \product_OBUF[21]_inst 
       (.I(product_OBUF[21]),
        .O(product[21]));
  OBUF \product_OBUF[22]_inst 
       (.I(product_OBUF[22]),
        .O(product[22]));
  OBUF \product_OBUF[23]_inst 
       (.I(product_OBUF[23]),
        .O(product[23]));
  OBUF \product_OBUF[24]_inst 
       (.I(product_OBUF[24]),
        .O(product[24]));
  OBUF \product_OBUF[25]_inst 
       (.I(product_OBUF[25]),
        .O(product[25]));
  OBUF \product_OBUF[26]_inst 
       (.I(product_OBUF[26]),
        .O(product[26]));
  OBUF \product_OBUF[27]_inst 
       (.I(product_OBUF[27]),
        .O(product[27]));
  OBUF \product_OBUF[28]_inst 
       (.I(product_OBUF[28]),
        .O(product[28]));
  OBUF \product_OBUF[29]_inst 
       (.I(product_OBUF[29]),
        .O(product[29]));
  OBUF \product_OBUF[2]_inst 
       (.I(product_OBUF[2]),
        .O(product[2]));
  OBUF \product_OBUF[30]_inst 
       (.I(product_OBUF[30]),
        .O(product[30]));
  OBUF \product_OBUF[31]_inst 
       (.I(product_OBUF[31]),
        .O(product[31]));
  OBUF \product_OBUF[3]_inst 
       (.I(product_OBUF[3]),
        .O(product[3]));
  OBUF \product_OBUF[4]_inst 
       (.I(product_OBUF[4]),
        .O(product[4]));
  OBUF \product_OBUF[5]_inst 
       (.I(product_OBUF[5]),
        .O(product[5]));
  OBUF \product_OBUF[6]_inst 
       (.I(product_OBUF[6]),
        .O(product[6]));
  OBUF \product_OBUF[7]_inst 
       (.I(product_OBUF[7]),
        .O(product[7]));
  OBUF \product_OBUF[8]_inst 
       (.I(product_OBUF[8]),
        .O(product[8]));
  OBUF \product_OBUF[9]_inst 
       (.I(product_OBUF[9]),
        .O(product[9]));
endmodule

(* CHECK_LICENSE_TYPE = "mult,mult_gen_v12_0_21,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_21,Vivado 2024.1" *) 
module mult
   (CLK,
    A,
    B,
    CE,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [63:0]P;

  wire \<const0> ;
  wire [31:0]A;
  wire [31:0]B;
  wire CE;
  wire CLK;
  wire [31:0]\^P ;
  wire [63:32]NLW_U0_P_UNCONNECTED;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [47:0]NLW_U0_PCASC_EXT_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  assign P[63] = \<const0> ;
  assign P[62] = \<const0> ;
  assign P[61] = \<const0> ;
  assign P[60] = \<const0> ;
  assign P[59] = \<const0> ;
  assign P[58] = \<const0> ;
  assign P[57] = \<const0> ;
  assign P[56] = \<const0> ;
  assign P[55] = \<const0> ;
  assign P[54] = \<const0> ;
  assign P[53] = \<const0> ;
  assign P[52] = \<const0> ;
  assign P[51] = \<const0> ;
  assign P[50] = \<const0> ;
  assign P[49] = \<const0> ;
  assign P[48] = \<const0> ;
  assign P[47] = \<const0> ;
  assign P[46] = \<const0> ;
  assign P[45] = \<const0> ;
  assign P[44] = \<const0> ;
  assign P[43] = \<const0> ;
  assign P[42] = \<const0> ;
  assign P[41] = \<const0> ;
  assign P[40] = \<const0> ;
  assign P[39] = \<const0> ;
  assign P[38] = \<const0> ;
  assign P[37] = \<const0> ;
  assign P[36] = \<const0> ;
  assign P[35] = \<const0> ;
  assign P[34] = \<const0> ;
  assign P[33] = \<const0> ;
  assign P[32] = \<const0> ;
  assign P[31:0] = \^P [31:0];
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "63" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  mult_gen_v12_0_21 U0
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P({NLW_U0_P_UNCONNECTED[63:32],\^P }),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .PCASC_EXT(NLW_U0_PCASC_EXT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GldLassLiODVgwPWl5GtUvNFVA+ZFVCFDhi7OrBop0rEIGOD7pGMQGd2XL5uXmDjnBa10M9DWskh
bTmllY5ovkWmM+NjjKYtf65BTGkYfwgKQ0A0l0q2oaCRiZEI98rgXRzWg4blHjn3F8mvlotras3b
gty58LDcqChRb34tHz4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YcKo5o/69htYDEreuDNtMbaQmtugz53TAiA3xMek1XTrggXZnceDK+Oacp9AwNeiNftWOxMl66sc
GrZixCPC4jC03qefsJitE5tQCfx9LEom/ln0gke2S5U676zqGFFkGD4igDSppP9+7smsit0JMNFB
3d9nJDwNXaerv07edmo26kGx6IsxHNmGjsmUd8FYgoMDNNDiTN40UA7rfTR1c5FwRoOUAPNW8x7l
lmsL+1mbpRU3rvmnc+tPlMZ9USQRFaWSLPznAatOpRgaHOa1J4DFd6nwIAGf3cDLilhq3YGA2oUb
qXHyz/+dnLIidWUJj1UPrzhk+3OEiFNdeXBKsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
g4qhHdak8eXxEqdympBtDM13xMJwZUSekBKApv5XlolRI2rR14IEYNQEcKRGlZyuFCmDRJDrEYWf
Eokybg18xq2N2hsq8nA4pvk6H9PXJmnhKoFcPeZ1j9mOnXNuEaOZnL6sA21bsPP7tTakNFG0eaXB
2vlDGYPDupMpXlylpEQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YIONylalBSo3oXqXlsOxHxbPAKbTQFLUkNcqhxYuBHSYbie+16iUZHVqekHM1nIPQ8A+NqZHT/Cn
bM+AOf7At893GAAiJmLAoJJQdHh7oO33naeJX4XJ6I+8adw4O4AucHf+iXdDTh+vT4ToH3pNI1H/
fg7BSszZg69zgY/QsPHraQkyFn3n6Pi12TK4KdE5CdqP1IapEJzDzFftP3QIdgztNEm32O7R9UAV
Qu6VW5iu2mw976oaaPRS7xQkeSuh8v3dIBFLuXEUwqgjFtQ1YItY1vsqSSX+qAtcmYqxSAn3rSTu
J315oxld+eYjvTtO32Qn2VPHVzfXPLCqIWAfbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ggUMon3tDyL18D99zI+gQo2KEmq86nD/UnuCl2KfpNz4G8UqOi9eijpYl6B8kVrp4KbnZWqTmMMF
z/O87hlmFpp4opDcOruJ+qiiTBWsOzFIQR4QZlanEjh8iO0cwSFSAz5sXdE77BCjzgHI7D4UD4Mp
5DA2KyFTsWztU8ricXXTuH6tZLNTLcTvHzJkt/DfkjmJrDlkm0eRAXhG0MUvkNsk32qCBY9RY9AF
1rJxG2dj5ZCJ2l/vueboa3iQZt2OeB1EloxrJDFuQtvPAvA65BsTM387sUTttprjm7eb5Tm0FQU5
vVHNxCllfsk9jW0rLIKm7dBRCgOntC9jDiJa0g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q5sQqbKwLxjG5mFk9qs+sD0CQg8/2B7KTHpwf62hzJF+1CFbVJUQ6go3DO5L0L1mUNINJPIKzaAD
66tkeRifjCdb0XYOSTAxArc1zlCtOMwOn0aTyha/Uq8sc44kv2JFuUoIsn/Tl15lAT4q5PGV1fNq
fyS1evlpX2NGjZCT9kx21/uYFVn1ltB09OkXy1tz0sskN2eMyg54gf1l6cTR+xsVdY2hIoYfIVN9
H8DudSxoFGmVq3nTkLEuIBwpOzIdlqxG/+zUbvpOhAOprRojoI7OuuNVnv8kqbudzrZrZDK0HX1J
I5lc8/JLEOTV1hKGDSaSt1UBFUvr7e8cCqERRg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dpec57YobDtonbQ0UO1SM8G+H4LNYxSkwZ+IOdocIPgFV2eNfdKVGLe5M3kGiFH8cY+OBkva9enL
/OWjF9TA2LAxTndxgG5J0pfUvCDOVC48MZgZnIR8dOHrP7D6LGWfbebBGB9V1IoBt63/ke8Gi6uZ
oukujbRqqhLpZtf77LbVOpOjZYXM0v1IplnrAPnLmHL9Auh/wBXbYFGVV+VhmRndax/hdT5NuXTd
OGVqvHjKXMT4qzPWpaROPHYFYtTWznHqjj27TLk/z5Hdp0nlp4+Ebp4zIwYMnSpg5MVSetpPiSCZ
031Hd1PlF/YfYwbU1r9lJTGrVWMqi/+gd8KaCQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HlE05c2aGsR6rjiuATQqbaTq27Z8ZtyCoeTKodnH2OaArT49PLi5ZL6waWhdrvL68et08IAUs9t+
8aQnVdhvb/0fNHwtevhkpK8kJCPhJmdNdN0DS60RUdlb5/sgSQWjlxx4Yz5wWXrD3w3dhNQaJbzb
PdLh3ZWUZ+ldIzf3OmxXqghMZwvXkPIkeVkEZK5rBVF4df5DItd6+GOemFxXJmppL3ChWMcSlJD6
hgFBtCxft+usPb88sDNxtsPNBhH8Yeq+nZ3gc7A2wXdVKQugUXMV+/6MH4QJagSTzkjs2wVuXfk8
YQcZf8t0t2eS3XkCFdUszXwMtQ8YgrBWqnZp6aSas1JlXWWMk1d316/ym9sdD+dt36sxmIOjr/mr
lNnHAn9fdTEGDWsaXok7ujwI96+Jo6VVX3h+8Qo/6f9dvmB+j9wX01yLiteRc/klH0QWWPFrckTr
rxvZC+0DnkSyRPCISuHF9Op/7iDXfrGDXOIKpGzdPMaHMsKqIpG+QnAb

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fff66ZCQIGGWn4BfihDr7MvimxiiOWXc0eZBNa52g6soH+VWc7Xx3RJ4fuq721E6hCeRxrTK72LX
i9jipHmkI+YxSSUZyntNbeuF7P38Z8QWyEXrCSRJqnLKUeNwU2D2v692GIbbkPNs3o1/p6bS+PZV
fy4p7pkkxRTdZGKmGNuXlDtPr5DhZ0zFptZiF4rQKB5ebp50U6h6HWEJapeIaJRVwy77CM+u0fDT
4A/3o3rPHumuUTiliaQcm/1jofwW8Wyt/fEyoDeskyKFiJxA7nvXRFcO7dw8hnBN2by3mEq8uvFc
fsXjl6FQ6E8njLb3YPebcEhF2fiQl6tfqv3Xsw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TPuKSC49PXr1CyJdt/9jlK1AKgl9KP/2WJFt/Z7vtljlmD6IwyvQTKF40mFUq27M5Fuz/W4X5INe
/y1uccitx3VcJsarTiaoGT9S3DEmWfAhW9Z3EJmLNoB5WF+Gt3VSrbcIFx4bRg1NbAvCsu35cwJ8
qIEuedLHAD9VsRvFu3kQcKMgbKlMKJWQKJUShZN0gC0lrTnoVAzLqEKMNA0qhQg6q9MlU0GGAeTU
4OAGi9IXN69mtGYQcFgRHTN2cuQvbBPQfXj7zjLG/WzUgoqFUvAhtN5JMPKijnF83gwj845lsPtD
BdmC4FzXoM7Od2ck/qbMAIXHv6TTsjznVFUQBg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dz0VP1CnlNHH+A6VEdv/MzTzitzJy9mXlBCOCHhiN+w9HtFx0dUiXe3p32oSt/JL5Z+78HPWFZNr
norYJdshbBxv2VA+Qb4W2FkhsUt+nbeUxZGkOXoHhhGec2Yij8F+xw2PzGlLK+EcjoVFUGoblbgy
lZxtUK/qPijjN/wQqhHPSvrKrho4ht3zcjZjVg8ZVfzx3x04m5pTyiTrTQecuIFEiVC5ZAhCQMxN
lUXGjCmiY2z772Cy8Zi5NhUXuo2561aTzEHBTJmriI9CVs50fIl0kofkrrA0OdX5CS5GkPv09EPz
ZPD7/ZAVOXqA3AlDcqAsaheUQnXkFpEPunVR0w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6720)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GldLassLiODVgwPWl5GtUvNFVA+ZFVCFDhi7OrBop0rEIGOD7pGMQGd2XL5uXmDjnBa10M9DWskh
bTmllY5ovkWmM+NjjKYtf65BTGkYfwgKQ0A0l0q2oaCRiZEI98rgXRzWg4blHjn3F8mvlotras3b
gty58LDcqChRb34tHz4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YcKo5o/69htYDEreuDNtMbaQmtugz53TAiA3xMek1XTrggXZnceDK+Oacp9AwNeiNftWOxMl66sc
GrZixCPC4jC03qefsJitE5tQCfx9LEom/ln0gke2S5U676zqGFFkGD4igDSppP9+7smsit0JMNFB
3d9nJDwNXaerv07edmo26kGx6IsxHNmGjsmUd8FYgoMDNNDiTN40UA7rfTR1c5FwRoOUAPNW8x7l
lmsL+1mbpRU3rvmnc+tPlMZ9USQRFaWSLPznAatOpRgaHOa1J4DFd6nwIAGf3cDLilhq3YGA2oUb
qXHyz/+dnLIidWUJj1UPrzhk+3OEiFNdeXBKsA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
g4qhHdak8eXxEqdympBtDM13xMJwZUSekBKApv5XlolRI2rR14IEYNQEcKRGlZyuFCmDRJDrEYWf
Eokybg18xq2N2hsq8nA4pvk6H9PXJmnhKoFcPeZ1j9mOnXNuEaOZnL6sA21bsPP7tTakNFG0eaXB
2vlDGYPDupMpXlylpEQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YIONylalBSo3oXqXlsOxHxbPAKbTQFLUkNcqhxYuBHSYbie+16iUZHVqekHM1nIPQ8A+NqZHT/Cn
bM+AOf7At893GAAiJmLAoJJQdHh7oO33naeJX4XJ6I+8adw4O4AucHf+iXdDTh+vT4ToH3pNI1H/
fg7BSszZg69zgY/QsPHraQkyFn3n6Pi12TK4KdE5CdqP1IapEJzDzFftP3QIdgztNEm32O7R9UAV
Qu6VW5iu2mw976oaaPRS7xQkeSuh8v3dIBFLuXEUwqgjFtQ1YItY1vsqSSX+qAtcmYqxSAn3rSTu
J315oxld+eYjvTtO32Qn2VPHVzfXPLCqIWAfbA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ggUMon3tDyL18D99zI+gQo2KEmq86nD/UnuCl2KfpNz4G8UqOi9eijpYl6B8kVrp4KbnZWqTmMMF
z/O87hlmFpp4opDcOruJ+qiiTBWsOzFIQR4QZlanEjh8iO0cwSFSAz5sXdE77BCjzgHI7D4UD4Mp
5DA2KyFTsWztU8ricXXTuH6tZLNTLcTvHzJkt/DfkjmJrDlkm0eRAXhG0MUvkNsk32qCBY9RY9AF
1rJxG2dj5ZCJ2l/vueboa3iQZt2OeB1EloxrJDFuQtvPAvA65BsTM387sUTttprjm7eb5Tm0FQU5
vVHNxCllfsk9jW0rLIKm7dBRCgOntC9jDiJa0g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q5sQqbKwLxjG5mFk9qs+sD0CQg8/2B7KTHpwf62hzJF+1CFbVJUQ6go3DO5L0L1mUNINJPIKzaAD
66tkeRifjCdb0XYOSTAxArc1zlCtOMwOn0aTyha/Uq8sc44kv2JFuUoIsn/Tl15lAT4q5PGV1fNq
fyS1evlpX2NGjZCT9kx21/uYFVn1ltB09OkXy1tz0sskN2eMyg54gf1l6cTR+xsVdY2hIoYfIVN9
H8DudSxoFGmVq3nTkLEuIBwpOzIdlqxG/+zUbvpOhAOprRojoI7OuuNVnv8kqbudzrZrZDK0HX1J
I5lc8/JLEOTV1hKGDSaSt1UBFUvr7e8cCqERRg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dpec57YobDtonbQ0UO1SM8G+H4LNYxSkwZ+IOdocIPgFV2eNfdKVGLe5M3kGiFH8cY+OBkva9enL
/OWjF9TA2LAxTndxgG5J0pfUvCDOVC48MZgZnIR8dOHrP7D6LGWfbebBGB9V1IoBt63/ke8Gi6uZ
oukujbRqqhLpZtf77LbVOpOjZYXM0v1IplnrAPnLmHL9Auh/wBXbYFGVV+VhmRndax/hdT5NuXTd
OGVqvHjKXMT4qzPWpaROPHYFYtTWznHqjj27TLk/z5Hdp0nlp4+Ebp4zIwYMnSpg5MVSetpPiSCZ
031Hd1PlF/YfYwbU1r9lJTGrVWMqi/+gd8KaCQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HlE05c2aGsR6rjiuATQqbaTq27Z8ZtyCoeTKodnH2OaArT49PLi5ZL6waWhdrvL68et08IAUs9t+
8aQnVdhvb/0fNHwtevhkpK8kJCPhJmdNdN0DS60RUdlb5/sgSQWjlxx4Yz5wWXrD3w3dhNQaJbzb
PdLh3ZWUZ+ldIzf3OmxXqghMZwvXkPIkeVkEZK5rBVF4df5DItd6+GOemFxXJmppL3ChWMcSlJD6
hgFBtCxft+usPb88sDNxtsPNBhH8Yeq+nZ3gc7A2wXdVKQugUXMV+/6MH4QJagSTzkjs2wVuXfk8
YQcZf8t0t2eS3XkCFdUszXwMtQ8YgrBWqnZp6aSas1JlXWWMk1d316/ym9sdD+dt36sxmIOjr/mr
lNnHAn9fdTEGDWsaXok7ujwI96+Jo6VVX3h+8Qo/6f9dvmB+j9wX01yLiteRc/klH0QWWPFrckTr
rxvZC+0DnkSyRPCISuHF9Op/7iDXfrGDXOIKpGzdPMaHMsKqIpG+QnAb

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fff66ZCQIGGWn4BfihDr7MvimxiiOWXc0eZBNa52g6soH+VWc7Xx3RJ4fuq721E6hCeRxrTK72LX
i9jipHmkI+YxSSUZyntNbeuF7P38Z8QWyEXrCSRJqnLKUeNwU2D2v692GIbbkPNs3o1/p6bS+PZV
fy4p7pkkxRTdZGKmGNuXlDtPr5DhZ0zFptZiF4rQKB5ebp50U6h6HWEJapeIaJRVwy77CM+u0fDT
4A/3o3rPHumuUTiliaQcm/1jofwW8Wyt/fEyoDeskyKFiJxA7nvXRFcO7dw8hnBN2by3mEq8uvFc
fsXjl6FQ6E8njLb3YPebcEhF2fiQl6tfqv3Xsw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TPuKSC49PXr1CyJdt/9jlK1AKgl9KP/2WJFt/Z7vtljlmD6IwyvQTKF40mFUq27M5Fuz/W4X5INe
/y1uccitx3VcJsarTiaoGT9S3DEmWfAhW9Z3EJmLNoB5WF+Gt3VSrbcIFx4bRg1NbAvCsu35cwJ8
qIEuedLHAD9VsRvFu3kQcKMgbKlMKJWQKJUShZN0gC0lrTnoVAzLqEKMNA0qhQg6q9MlU0GGAeTU
4OAGi9IXN69mtGYQcFgRHTN2cuQvbBPQfXj7zjLG/WzUgoqFUvAhtN5JMPKijnF83gwj845lsPtD
BdmC4FzXoM7Od2ck/qbMAIXHv6TTsjznVFUQBg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dz0VP1CnlNHH+A6VEdv/MzTzitzJy9mXlBCOCHhiN+w9HtFx0dUiXe3p32oSt/JL5Z+78HPWFZNr
norYJdshbBxv2VA+Qb4W2FkhsUt+nbeUxZGkOXoHhhGec2Yij8F+xw2PzGlLK+EcjoVFUGoblbgy
lZxtUK/qPijjN/wQqhHPSvrKrho4ht3zcjZjVg8ZVfzx3x04m5pTyiTrTQecuIFEiVC5ZAhCQMxN
lUXGjCmiY2z772Cy8Zi5NhUXuo2561aTzEHBTJmriI9CVs50fIl0kofkrrA0OdX5CS5GkPv09EPz
ZPD7/ZAVOXqA3AlDcqAsaheUQnXkFpEPunVR0w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28016)
`pragma protect data_block
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
6XtykrMbjCjPctAhbLdV1DG3AKcuQ7ucIpsLGWs=
`pragma protect end_protected
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
