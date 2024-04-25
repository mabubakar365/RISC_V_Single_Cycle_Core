`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 09:55:07 PM
// Design Name: 
// Module Name: PC
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


module PCounter(
        PC_NEXT, PC, rst, clk
    );

    input [31:0] PC_NEXT;
    input clk;
    input rst;

    output reg [31:0] PC;

    always @(posedge clk) begin
        if(rst == 1'b0) begin
            PC = 32'h00000000;
        end

        else begin
            PC <= PC_NEXT;
        end
    end


endmodule
