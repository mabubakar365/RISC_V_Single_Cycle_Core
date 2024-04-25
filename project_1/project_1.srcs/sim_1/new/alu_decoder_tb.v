`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 05:45:44 PM
// Design Name: 
// Module Name: alu_decoder_tb
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


module alu_decoder_tb;

    reg [6:0] Op;
    reg [6:0] funct7;
    reg [2:0] funct3;
    reg [1:0] ALUOp;

    wire [2:0] ALUControl;

    // Instantiate the alu_decoder
    alu_decoder u1 (
        .Op(Op), .funct7(funct7), .funct3(funct3), .ALUOp(ALUOp), .ALUControl(ALUControl)
    );

    initial begin

        Op = 7'b0000000;
        funct7 = 7'b0000000;
        funct3 = 3'b000;
        ALUOp = 2'b00;
        #2
        $display("Op = %b, funct7 = %b, funct3 = %b, ALUOp = %b, ALUControl = %b", Op, funct7, funct3, ALUOp, ALUControl);

        ALUOp = 2'b01;
        #2
        $display("Op = %b, funct7 = %b, funct3 = %b, ALUOp = %b, ALUControl = %b", Op, funct7, funct3, ALUOp, ALUControl);

        Op = 7'b0000000;
        funct7 = 7'b0000000;
        funct3 = 3'b000;
        ALUOp = 2'b10;
        #2
        $display("Op = %b, funct7 = %b, funct3 = %b, ALUOp = %b, ALUControl = %b", Op, funct7, funct3, ALUOp, ALUControl);

        Op = 7'b0000000;
        funct7 = 7'b0100000;
        funct3 = 3'b000;
        ALUOp = 2'b10;
        #2
        $display("Op = %b, funct7 = %b, funct3 = %b, ALUOp = %b, ALUControl = %b", Op, funct7, funct3, ALUOp, ALUControl);

        Op = 7'b0100000;
        funct7 = 7'b0000000;
        funct3 = 3'b000;
        ALUOp = 2'b10;
        #2
        $display("Op = %b, funct7 = %b, funct3 = %b, ALUOp = %b, ALUControl = %b", Op, funct7, funct3, ALUOp, ALUControl);

        Op = 7'b0100000;
        funct7 = 7'b0100000;
        funct3 = 3'b000;
        ALUOp = 2'b10;
        #2
        $display("Op = %b, funct7 = %b, funct3 = %b, ALUOp = %b, ALUControl = %b", Op, funct7, funct3, ALUOp, ALUControl);

        Op = 7'b0100000;
        funct7 = 7'b0100000;
        funct3 = 3'b010;
        ALUOp = 2'b10;
        #2
        $display("Op = %b, funct7 = %b, funct3 = %b, ALUOp = %b, ALUControl = %b", Op, funct7, funct3, ALUOp, ALUControl);

        Op = 7'b0100000;
        funct7 = 7'b0000000;
        funct3 = 3'b110;
        ALUOp = 2'b10;
        #2
        $display("Op = %b, funct7 = %b, funct3 = %b, ALUOp = %b, ALUControl = %b", Op, funct7, funct3, ALUOp, ALUControl);

        Op = 7'b0000000;
        funct7 = 7'b0100000;
        funct3 = 3'b111;
        ALUOp = 2'b10;
        #2
        $display("Op = %b, funct7 = %b, funct3 = %b, ALUOp = %b, ALUControl = %b", Op, funct7, funct3, ALUOp, ALUControl);

    end

endmodule
