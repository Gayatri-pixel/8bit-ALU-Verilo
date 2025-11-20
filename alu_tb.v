`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 10:47:21
// Design Name: 
// Module Name: alu_tb
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


`timescale 1ns/1ps

module alu_tb;

    reg [7:0] A, B;
    reg [2:0] ALU_Sel;
    wire [7:0] ALU_Out;
    wire CarryOut, Zero;

    alu_8bit uut (.A(A), .B(B), .ALU_Sel(ALU_Sel),
                  .ALU_Out(ALU_Out), .CarryOut(CarryOut), .Zero(Zero));

    initial begin
        A = 8'd10; B = 8'd5;

        ALU_Sel = 3'b000; #10; // ADD
        ALU_Sel = 3'b001; #10; // SUB
        ALU_Sel = 3'b010; #10; // AND
        ALU_Sel = 3'b011; #10; // OR
        ALU_Sel = 3'b100; #10; // XOR
        ALU_Sel = 3'b101; #10; // SLT
        ALU_Sel = 3'b110; #10; // PASS A

        $stop;
    end
endmodule
