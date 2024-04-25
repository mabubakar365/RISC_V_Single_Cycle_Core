`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 09:45:41 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
        A, rst, Rd
    );

    input [31:0] A;
    input rst;

    output [31:0] Rd;

    // 1024 registers, each of size 32 bits
    reg [31:0] Mem [1023:0];

    assign Rd = (rst == 1'b1) ? Mem[A[31:2]] : 32'h00000000;

    // initial begin
    //     $readmemh("memfile.hex", Mem);
    // end

    initial begin
        // Mem[0] = 32'hFFC4A303;
        // Mem[1] = 32'h00832383;
        // Mem[0] = 32'h0064A423;
        // Mem[1] = 32'h00B62423;
        Mem[0] = 32'h0062E3B3;
        Mem[1] = 32'h0062F433;
    end

endmodule
