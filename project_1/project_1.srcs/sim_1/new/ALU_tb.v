`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 05:29:06 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;

      // Inputs
  reg [31:0] A;
  reg [31:0] B;
  reg [2:0] ALUControl;

  // Output
  wire [31:0] Result;
  wire Z;
  wire N;
  wire C;
  wire V;
  // Instantiate the Unit Under Test (UUT)
  ALU uut (
    .A(A), 
    .B(B), 
    .ALUControl(ALUControl), 
    .Result(Result),
    .Z(Z),
    .N(N),
    .V(V),
    .C(C)
  );

  initial begin
    // Initialize Inputs
    A = 0;
    B = 0;
    ALUControl = 0;

    // Wait 100 ns for global reset to finish
    #100;
      
    // Add stimulus here
    A = 32'h12345678; // Example value for A
    B = 32'h9ABCDEF0; // Example value for B
    ALUControl = 3'b000; // Example ALU control code

    // Wait for 100 ns
    #100;

    // Display the result
    $display("%h + %h = %h", A, B, Result);
    $display("Z = %b", Z);
    $display("N = %b", N);
    $display("V = %b", V);
    $display("C = %b", C);

        // Wait 100 ns for global reset to finish
    #100;
      
    // Add stimulus here
    A = 32'h12345678; // Example value for A
    B = 32'h9ABCDEF0; // Example value for B
    ALUControl = 3'b001; // Example ALU control code

    // Wait for 100 ns
    #100;

    // Display the result
    $display("%h - %h = %h", A, B, Result);
    $display("Z = %b", Z);
    $display("N = %b", N);
    $display("V = %b", V);
    $display("C = %b", C);
        // Wait 100 ns for global reset to finish
    #100;
      
    // Add stimulus here
    A = 32'h12345678; // Example value for A
    B = 32'h9ABCDEF0; // Example value for B
    ALUControl = 3'b010; // Example ALU control code

    // Wait for 100 ns
    #100;

    // Display the result
    $display("%h & %h = %h", A, B, Result);
    $display("Z = %b", Z);
    $display("N = %b", N);
    $display("V = %b", V);
    $display("C = %b", C);

    // Wait 100 ns for global reset to finish
    #100;
      
    // Add stimulus here
    A = 32'h12345678; // Example value for A
    B = 32'h9ABCDEF0; // Example value for B
    ALUControl = 3'b011; // Example ALU control code

    // Wait for 100 ns
    #100;

    // Display the result
    $display("%h | %h = %h", A, B, Result);
    $display("Z = %b", Z);
    $display("N = %b", N);
    $display("V = %b", V);
    $display("C = %b", C);

    // Wait 100 ns for global reset to finish
    #100;
      
    // Add stimulus here
    A = 32'h12345679; // Example value for A
    B = 32'h9ABCDEF0; // Example value for B
    ALUControl = 3'b101; // Example ALU control code

    // Wait for 100 ns
    #100;

    // Display the result
    $display("%h slt %h = %h", A, B, Result);
    $display("Z = %b", Z);
    $display("N = %b", N);
    $display("V = %b", V);
    $display("C = %b", C);

  end

endmodule
