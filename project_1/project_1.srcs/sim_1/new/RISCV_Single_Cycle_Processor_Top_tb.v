`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 10:28:43 PM
// Design Name: 
// Module Name: RISCV_Single_Cycle_Processor_Top_tb
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


module RISCV_Single_Cycle_Processor_Top_tb;

    reg clk = 1'b0;
    reg rst = 1'b0;

    RISCV_Single_Cycle_Processor_Top UUT (
        .clk(clk),
        .rst(rst)
    );

    initial begin
        $dumpfile("Single Cycle.vcd");
        $dumpvars(0);
    end

    always begin
        #50 clk = ~clk;
    end

    initial begin
        rst = 1'b0;
        #100;

        rst = 1'b1;
        #300;

        $finish;
    end
endmodule
