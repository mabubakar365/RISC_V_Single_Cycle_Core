`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 10:41:00 PM
// Design Name: 
// Module Name: Sign_Extend
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


module Sign_Extend(
        In, Imm_Extend, ImmSrc
    );

    input [31:0] In;
    input ImmSrc;

    output [31:0] Imm_Extend;

    // assign Imm_Extend = (In[31] == 1'b1) ? {{20{1'b1}}, In[31:20]} : {{20{1'b0}}, In[31:20]};

    assign Imm_Extend = (ImmSrc == 1'b1) ? ({{20{In[31]}}, In[31:25], In[11:7]}) : {{20{In[31]}}, In[31:20]};

endmodule
