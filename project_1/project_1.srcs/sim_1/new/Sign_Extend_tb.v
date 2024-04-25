`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 10:44:53 PM
// Design Name: 
// Module Name: Sign_Extend_tb
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


module Sign_Extend_tb;

    reg [31:0] In;
    wire [31:0] Imm_Extend;

    // Instantiate the Sign_Extend
    Sign_Extend u1 (
        .In(In), .Imm_Extend(Imm_Extend)
    );

    initial begin
        In = 32'b0000_1010_0101_0101_1010_0101_1010_0101;
        #10;  // Wait for some time to let the outputs settle
        $display("In = %b, Imm_Extend = %b", In[31:20], Imm_Extend);

        In = 32'b1010_1100_1101_0101_1010_0101_1010_0101;
        #10;  // Wait for some time to let the outputs settle
        $display("In = %b, Imm_Extend = %b", In[31:20], Imm_Extend);

        In = 32'b0101_0000_1101_0101_1010_0101_1010_0101;
        #10;  // Wait for some time to let the outputs settle
        $display("In = %b, Imm_Extend = %b", In[31:20], Imm_Extend);

        In = 32'b1011_1100_1111_0101_1010_0101_1010_0101;
        #10;  // Wait for some time to let the outputs settle
        $display("In = %b, Imm_Extend = %b", In[31:20], Imm_Extend);

    end
    
endmodule
