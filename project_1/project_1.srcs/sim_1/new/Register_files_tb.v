`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 04:15:21 PM
// Design Name: 
// Module Name: Register_files_tb
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


module Register_files_tb;

    reg [4:0] A1;
    reg [4:0] A2;
    reg [4:0] A3;
    reg [31:0] WD3;
    reg clk;
    reg rst;
    reg WE3;

    wire [31:0] RD1;
    wire [31:0] RD2;

    Register_files UUT(
        .A1(A1), 
        .A2(A2), 
        .A3(A3), 
        .WD3(WD3), 
        .WE3(WE3), 
        .clk(clk), 
        .rst(rst), 
        .RD1(RD1), 
        .RD2(RD2)
    );

    // Clock generator
    always begin
        #5 clk = ~clk;
    end

    initial begin
        WE3 = 0;
        clk = 0;
        rst = 0;
        #10;

        for(A1 = 0; A1 < 31; A1 = A1 + 1) begin
            $display("reset = %b, Address = %h, Data = %h", rst, A1, RD1);
            #10;
        end
        
        rst = 1;
        #10;

        for(A1 = 0; A1 < 31; A1 = A1 + 1) begin
            $display("reset = %b, Address = %h, Data = %h", rst, A1, RD1);
            #10;
        end

        rst = 0;
        #10;

        for(A2 = 0; A2 < 31; A2 = A2 + 1) begin
            $display("reset = %b, Address = %h, Data = %h", rst, A2, RD2);
            #10;
        end
        
        rst = 1;
        #10;

        for(A2 = 0; A2 < 31; A2 = A2 + 1) begin
            $display("reset = %b, Address = %h, Data = %h", rst, A2, RD2);
            #10;
        end

        WD3 = 32'h00000000;
        WE3 = 0;
        #10;

        for(A3 = 0; A3 < 31; A3 = A3 + 1) begin
            #10;
            $display("WE3 = %b, Address = %h, Data = %h", WE3, A3, WD3);
            WD3 = WD3 + 1;
        end
        
        WD3 = 32'h00000000;
        WE3 = 1;
        #10;

        for(A3 = 0; A3 < 31; A3 = A3 + 1) begin
            #10;
            $display("WE3 = %b, Address = %h, Data = %h", WE3, A3, WD3);
            WD3 = WD3 + 1;
        end

        $finish;

    end

endmodule
