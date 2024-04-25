`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 10:01:33 PM
// Design Name: 
// Module Name: Register_files
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


module Register_files(
        A1, A2, A3, WD3, WE3, clk, rst, RD1, RD2
    );

    input [4:0] A1;
    input [4:0] A2;
    input [4:0] A3;
    input [31:0] WD3;
    input clk;
    input rst;
    input WE3;

    output [31:0] RD1;
    output [31:0] RD2;

    reg [31:0] Registers [31:0];

    assign RD1 = (rst == 1'b0) ? 32'h00000000 : Registers[A1];
    assign RD2 = (rst == 1'b0) ? 32'h00000000 : Registers[A2];

    always @(posedge clk) begin
        if(WE3 == 1'b1) begin
            Registers[A3] = WD3;
        end
    end

    initial begin
        // Registers[9] = 32'h00000020;
        // Registers[6] = 32'h00000040;
        // Registers[11] = 32'h28;
        // Registers[12] = 32'h30;
        Registers[5] = 32'h5;
        Registers[6] = 32'h4;
    end

endmodule
