`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 04:03:10 PM
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(
        Op, 
        // Zero, 
        RegWrite, MemWrite, ResultSrc, ALUSrc, ImmSrc, ALUOp, 
        Branch
        // PCSrc
    );

    // input Zero;
    input [6:0] Op;

    // output PCSrc;
    output ResultSrc;
    output MemWrite;
    output ALUSrc;
    output [1:0] ImmSrc;
    output RegWrite;
    output [1:0] ALUOp;
    output Branch;

    // wire Branch;

    assign RegWrite = ((Op == 7'b0000011) | (Op == 7'b0110011)) ? 1'b1 : 1'b0;

    assign ImmSrc = (Op == 7'b0100011) ? 2'b01 : (Op == 7'b1100011) ? 2'b10 : 2'b00;
    
    assign ALUSrc = ((Op == 7'b0000011) | (Op == 7'b0100011)) ? 1'b1 : 1'b0;
    
    assign MemWrite = (Op == 7'b0100011) ? 1'b1 : 1'b0;
    
    assign ResultSrc = (Op == 7'b0000011) ? 1'b1 : 1'b0;
    
    assign Branch = (Op == 7'b1100011) ? 1'b1 : 1'b0;
    
    assign ALUOp = (Op == 7'b0110011) ? 2'b10 : (Op == 7'b1100011) ? 2'b01 : 2'b00;

    // assign PCSrc = Zero & Branch;

endmodule
