`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 03:03:34 PM
// Design Name: 
// Module Name: Data_Memory_tb
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


module Data_Memory_tb;

    reg [31:0] A;
    reg WE;
    reg [31:0] WD;
    reg clk;
    reg rst;
    wire [31:0] RD;

    // Instantiate the Data_Memory module
    Data_Memory UUT (
        .A(A), 
        .WD(WD), 
        .WE(WE), 
        .clk(clk), 
        .rst(rst), 
        .RD(RD)
    );

    // Clock generator
    always begin
        #5 clk = ~clk;
    end

    // Testbench stimulus
    initial begin
        clk = 0;
        rst = 0;
        #10;
        rst = 1;
        #10;
        rst = 0;
        #10;
        WD = 32'h8FEDCBA0;

        for(A = 0; A < 1023; A = A + 1) begin
            // Write to memory
            WD = WD + 1;
            WE = 1'b1;
            #10;

            // Read from memory
            WE = 1'b0;
            #10;

            $display("reset = %b, WD = %h, RD = %h", rst, WD, RD);   

            // Check the read data
            if (RD == WD) begin
                $display("%d Test Passed", A);
            end else begin
                $display("%d Test Failed", A);
            end

        end

        $finish;
    end

endmodule
