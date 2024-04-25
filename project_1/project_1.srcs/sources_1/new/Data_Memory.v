`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 10:10:02 PM
// Design Name: 
// Module Name: Data_Memeory
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


module Data_Memory(
        A, WD, WE, clk, rst, RD
    );

    input [31:0] A;
    input WE;
    input [31:0] WD;
    input clk;
    input rst;

    output [31:0] RD;

    reg [31:0] Data_MEM [9000:0];

    assign RD = (rst == 1'b1) ? Data_MEM[A] : 32'h00000000;

    always @(posedge clk) begin
        if(WE == 1'b1) begin
            Data_MEM[A] <= WD;
        end
    end

    initial begin
        // Data_MEM[28] = 32'h00000020;
        // Data_MEM[40] = 32'h00000002;
    end

endmodule
