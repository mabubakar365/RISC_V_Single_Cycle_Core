`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 04:00:44 PM
// Design Name: 
// Module Name: PC_tb
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


module PC_tb;

    reg [31:0] PC_NEXT;
    reg clk;
    reg rst;

    wire [31:0] PC;

    // Instantiate the PC module
    PCounter UUT (
        .PC_NEXT(PC_NEXT), 
        .PC(PC),
        .rst(rst), 
        .clk(clk)
    );

    // Clock generator
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 0;
        #10;

        for(PC_NEXT = 0; PC_NEXT < 1023; PC_NEXT = PC_NEXT + 1) begin
            #10;
            $display("reset = %b, PC_NEXT = %h, PC = %h", rst, PC_NEXT, PC);
        end
        
        rst = 1;
        #10;

        for(PC_NEXT = 0; PC_NEXT < 1023; PC_NEXT = PC_NEXT + 1) begin
            #10;
            $display("reset = %b, PC_NEXT = %h, PC = %h", rst, PC_NEXT, PC);
        end

        $finish;
    end


endmodule
