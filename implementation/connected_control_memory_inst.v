// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.


// Generated by Quartus Prime Version 18.1 (Build Build 625 09/12/2018)
// Created on Tue May 10 14:43:38 2022

connected_control_memory connected_control_memory_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.PC(PC_sig) ,	// input [10:0] PC_sig
	.datain(datain_sig) ,	// input [15:0] datain_sig
	.ALUSrc(ALUSrc_sig) ,	// output  ALUSrc_sig
	.MemtoReg(MemtoReg_sig) ,	// output  MemtoReg_sig
	.RegDst(RegDst_sig) ,	// output  RegDst_sig
	.RegWrite(RegWrite_sig) ,	// output  RegWrite_sig
	.MemRead(MemRead_sig) ,	// output  MemRead_sig
	.MemWrite(MemWrite_sig) ,	// output  MemWrite_sig
	.Branch(Branch_sig) 	// output  Branch_sig
);

