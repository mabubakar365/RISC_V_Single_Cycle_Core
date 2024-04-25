`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 04:28:10 PM
// Design Name: 
// Module Name: main_decoder_tb
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


module main_decoder_tb;

    // reg Zero;
    reg [6:0] Op;
    // wire PCSrc;
    wire Branch;
    wire ResultSrc;
    wire MemWrite;
    wire ALUSrc;
    wire [1:0] ImmSrc;
    wire RegWrite;
    wire [1:0] ALUOp;

    // Instantiate the main_decoder
    main_decoder u1 (
        .Op(Op), 
        // .Zero(Zero), 
        .RegWrite(RegWrite), .MemWrite(MemWrite), .ResultSrc(ResultSrc), 
        .ALUSrc(ALUSrc), .ImmSrc(ImmSrc), .ALUOp(ALUOp), 
        .Branch(Branch)
        // .PCSrc(PCSrc)
    );

    initial begin
        // Zero = 0;
        // Iterate over all possible values of Op and Zero
        for (Op = 0; Op < 127; Op = Op + 1) begin
                #1;  // Wait for some time to let the outputs settle
                if((Op == 7'b0000011) | (Op == 7'b0100011) | (Op == 7'b0110011) | (Op == 7'b1100011)) begin
                $display("Op = %b, Branch = %b, ResultSrc = %b, MemWrite = %b, ALUSrc = %b, ImmSrc = %b, RegWrite = %b, ALUOp = %b", 
                          Op, Branch, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUOp);   
                end
        end

        // Zero = 1;
        // Iterate over all possible values of Op and Zero
        for (Op = 0; Op < 127; Op = Op + 1) begin
                #1;  // Wait for some time to let the outputs settle
                if((Op == 7'b0000011) | (Op == 7'b0100011) | (Op == 7'b0110011) | (Op == 7'b1100011)) begin
                $display("Op = %b, Branch = %b, ResultSrc = %b, MemWrite = %b, ALUSrc = %b, ImmSrc = %b, RegWrite = %b, ALUOp = %b", 
                          Op, Branch, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite, ALUOp);   
                end
        end
    end

endmodule
