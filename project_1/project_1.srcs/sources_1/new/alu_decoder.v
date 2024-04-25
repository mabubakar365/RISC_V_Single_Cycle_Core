`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 05:28:51 PM
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(
        Op, ALUOp, funct3, funct7, ALUControl
    );

    input [6:0] Op;
    input [6:0] funct7;
    input [2:0] funct3;
    input [1:0] ALUOp;

    output [2:0] ALUControl;

    wire [1:0] op_funct7;

    assign op_funct7 = {Op[5], funct7[5]};

    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 : 
                        (ALUOp == 2'b01) ? 3'b001 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ((op_funct7 == 2'b00) | (op_funct7 == 2'b01) | (op_funct7 == 2'b10))) ? 3'b000 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & (op_funct7 == 2'b11)) ? 3'b001 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 : 
                        ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011 :
                        ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 : 3'b000;
endmodule
