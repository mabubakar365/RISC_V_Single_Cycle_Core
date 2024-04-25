`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 08:32:04 PM
// Design Name: 
// Module Name: Control_Unit_Top_tb
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


module Control_Unit_Top_tb;

    reg [6:0] Op;
    reg [2:0] funct3;
    reg [6:0] funct7;

    wire Branch;
    wire ResultSrc;
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    wire [1:0] ImmSrc;
    wire [2:0] ALUControl;

    Control_Unit_Top UUT(
        .Op(Op), 
        .funct7(funct7), 
        .funct3(funct3), 
        .Branch(Branch), 
        .ResultSrc(ResultSrc), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .ImmSrc(ImmSrc), 
        .RegWrite(RegWrite), 
        .ALUControl(ALUControl)
    );

    initial begin

        // Iterate over all possible values of Op
        for (Op = 0; Op < 127; Op = Op + 1) begin
                #1;  // Wait for some time to let the outputs settle
                if((Op == 7'b0000011) | (Op == 7'b0100011) | (Op == 7'b0110011) | (Op == 7'b1100011)) begin
                $display("Op = %b, Branch = %b, ResultSrc = %b, MemWrite = %b, ALUSrc = %b, ImmSrc = %b, RegWrite = %b", 
                          Op, Branch, ResultSrc, MemWrite, ALUSrc, ImmSrc, RegWrite);   
                end
        end

        Op = 7'b0000011; 
        funct7 = 1'b0;
        funct3 = 3'b000;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

        Op = 7'b0100011; 
        funct7 = 1'b0;
        funct3 = 3'b000;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

        Op = 7'b1100011; 
        funct7 = 7'b0000000;
        funct3 = 3'b000;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

        Op = 7'b0110011; 
        funct7 = 7'b0000000;
        funct3 = 3'b000;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

        Op = 7'b0110011; 
        funct7 = 7'b0100000;
        funct3 = 3'b000;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

        Op = 7'b0110011; 
        funct7 = 7'b0000000;
        funct3 = 3'b000;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

        Op = 7'b0110011; 
        funct7 = 7'b0100000;
        funct3 = 3'b000;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

        Op = 7'b0110011; 
        funct7 = 7'b0100000;
        funct3 = 3'b010;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

        Op = 7'b0110011; 
        funct7 = 7'b0100000;
        funct3 = 3'b110;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

        Op = 7'b0110011; 
        funct7 = 7'b0100000;
        funct3 = 3'b111;
        #2
        $display("Op = %b, funct3 = %b, {op, funct7} = %b, ALUControl = %b", Op, funct3, {Op[5], funct7[5]}, ALUControl);

    end


endmodule
