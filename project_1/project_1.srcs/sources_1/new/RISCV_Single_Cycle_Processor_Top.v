`timescale 1ns / 1ps
`include "PC.v"
`include "instruction_memory.v"
`include "Register_files.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_Unit_Top.v"
`include "Data_Memory.v"
`include "PC_Adder.v"
`include "Mux.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 10:29:17 PM
// Design Name: 
// Module Name: RISCV_Single_Cycle_Processor_Top
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


module RISCV_Single_Cycle_Processor_Top(
        clk, rst
    );

    input clk;
    input rst;

    wire [31:0] PC_Top;
    wire [31:0] Rd_Instr;
    wire [31:0] RD1_Top;
    wire [31:0] Imm_Extend_Top;
    wire [2:0] ALUControl_Top;
    wire [31:0] ALUResult;
    wire RegWrite;
    wire [31:0] ReadData;
    wire [31:0] PCPlus4;
    wire [31:0] RD2_Top;
    wire [1:0] ImmSrc;
    wire MemWrite;
    wire ALUSrc;
    wire ResultSrc;
    wire [31:0] SrcB;
    wire [31:0] Result;


    PCounter PCounter_uut (
        .PC_NEXT(PCPlus4), 
        .PC(PC_Top), 
        .rst(rst), 
        .clk(clk)
    );

    instruction_memory instruction_memory_uut (
        .A(PC_Top), 
        .rst(rst), 
        .Rd(Rd_Instr)
    );

    Register_files Register_files_uut (
        .A1(Rd_Instr[19:15]), 
        .A2(Rd_Instr[24:20]), 
        .A3(Rd_Instr[11:7]), 
        .WD3(Result), 
        .WE3(RegWrite), 
        .clk(clk), 
        .rst(rst), 
        .RD1(RD1_Top), 
        .RD2(RD2_Top)
    );

    Sign_Extend Sign_Extend_uut (
        .In(Rd_Instr), 
        .Imm_Extend(Imm_Extend_Top),
        .ImmSrc(ImmSrc[0])
    );

    Mux Mux_RegisterFile_to_ALU_uut (
        .A(RD2_Top), 
        .B(Imm_Extend_Top), 
        .S(ALUSrc), 
        .Out(SrcB)
    );

    ALU ALU_uut (
    .A(RD1_Top), 
    .B(SrcB), 
    .ALUControl(ALUControl_Top), 
    .Result(ALUResult),
    .Z(),
    .N(),
    .V(),
    .C()
  );

  Control_Unit_Top Control_Unit_Top_uut (
        .Op(Rd_Instr[6:0]), 
        .funct7(), 
        .funct3(Rd_Instr[14:12]), 
        .Branch(), 
        .ResultSrc(ResultSrc), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .ImmSrc(ImmSrc), 
        .RegWrite(RegWrite), 
        .ALUControl(ALUControl_Top)
    );

    Data_Memory Data_Memory_uut (
        .A(ALUResult), 
        .WD(RD2_Top), 
        .WE(MemWrite), 
        .clk(clk), 
        .rst(rst), 
        .RD(ReadData)
    );

    Mux Mux_DataMem_to_RegisterFile_uut (
        .A(ALUResult), 
        .B(ReadData), 
        .S(ResultSrc), 
        .Out(Result)
    );

    PC_Adder PC_Adder_uut (
        .A(PC_Top), 
        .B(32'd4), 
        .C(PCPlus4)
    );

endmodule
