`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 05:15:52 PM
// Design Name: 
// Module Name: Control_Unit_Top
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


module Control_Unit_Top(
        Op, funct7, funct3, Branch, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUControl
    );

    input [6:0] Op;
    input [2:0] funct3;
    input [6:0] funct7;

    output Branch;
    output ResultSrc;
    output MemWrite;
    output ALUSrc;
    output RegWrite;
    output [1:0] ImmSrc;
    output [2:0] ALUControl; 

    wire [1:0] ALUOp;

    main_decoder main_decoder_uut (
        .Op(Op), 
        .RegWrite(RegWrite), 
        .MemWrite(MemWrite), 
        .ResultSrc(ResultSrc), 
        .ALUSrc(ALUSrc), 
        .ImmSrc(ImmSrc), 
        .ALUOp(ALUOp), 
        .Branch(Branch)
    );

    alu_decoder alu_decoder (
        .Op(Op), 
        .ALUOp(ALUOp), 
        .funct3(funct3), 
        .funct7(funct7), 
        .ALUControl(ALUControl)
    );

endmodule
