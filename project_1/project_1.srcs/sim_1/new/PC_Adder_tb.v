`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 09:47:15 PM
// Design Name: 
// Module Name: PC_Adder_tb
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


module PC_Adder_tb;

    reg [31:0] A;
    reg [31:0] B;

    wire [31:0] C;

    PC_Adder uut(
        .A(A), 
        .B(B), 
        .C(C)
    );

    initial begin
        A = 32'h11111111;
        B = 32'h00000004;
        #10;
        $display("A = %h, B = %h, C = %h", A, B, C);

        A = 32'h22222222;
        B = 32'h00000004;
        #10;
        $display("A = %h, B = %h, C = %h", A, B, C);
        

        A = 32'h33333333;
        B = 32'h00000004;
        #10;
        $display("A = %h, B = %h, C = %h", A, B, C);
        
        A = 32'h44444444;
        B = 32'h00000004;
        #10;
        $display("A = %h, B = %h, C = %h", A, B, C);
        
        A = 32'h55555555;
        B = 32'h00000004;
        #10;
        $display("A = %h, B = %h, C = %h", A, B, C);
        
    end

endmodule
