// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Aug 16 23:31:47 2019
// Host        : dell-Bilgisayar running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub {e:/bildiri ve
//               makaleler/kitap/fpga/uygulamalar/prj_bolum11_uyg3/prj_bolum11_uyg3.srcs/sources_1/ip/div_8bit/div_8bit_stub.v}
// Design      : div_8bit
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "div_gen_v5_1_12,Vivado 2017.4" *)
module div_8bit(aclk, s_axis_divisor_tvalid, 
  s_axis_divisor_tdata, s_axis_dividend_tvalid, s_axis_dividend_tdata, 
  m_axis_dout_tvalid, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_divisor_tvalid,s_axis_divisor_tdata[7:0],s_axis_dividend_tvalid,s_axis_dividend_tdata[7:0],m_axis_dout_tvalid,m_axis_dout_tdata[15:0]" */;
  input aclk;
  input s_axis_divisor_tvalid;
  input [7:0]s_axis_divisor_tdata;
  input s_axis_dividend_tvalid;
  input [7:0]s_axis_dividend_tdata;
  output m_axis_dout_tvalid;
  output [15:0]m_axis_dout_tdata;
endmodule
