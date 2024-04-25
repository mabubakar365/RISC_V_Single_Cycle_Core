`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 03:35:42 PM
// Design Name: 
// Module Name: instruction_memory_tb
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


module instruction_memory_tb(

    );

    reg [31:0] A;
    reg rst;

    wire [31:0] RD;

    // Instantiate the instruction_memory module
    instruction_memory UUT (
        .A(A), 
        .rst(rst), 
        .Rd(RD)
    );

    // Testbench stimulus
    initial begin
        rst = 0;
        #10;
        rst = 1;
        #10;

        for(A = 0; A < 1023; A = A + 1) begin
            // Read from memory
            #10;
            $display("reset = %b, Adress = %d, Data = %h", rst, A, RD);  

        end

        $finish;
    end

endmodule
