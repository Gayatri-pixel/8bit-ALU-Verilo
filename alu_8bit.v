`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 10:46:38
// Design Name: 
// Module Name: alu_8bit
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


module alu_8bit(
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] ALU_Sel,
    output reg [7:0] ALU_Out,
    output reg CarryOut,
    output Zero
);

    wire [8:0] sum;

    assign sum = {1'b0, A} + {1'b0, B};
    assign Zero = (ALU_Out == 8'b00000000);

    always @(*) begin
        CarryOut = 0;
        case (ALU_Sel)
            3'b000: begin ALU_Out = A + B; CarryOut = sum[8]; end
            3'b001: ALU_Out = A - B;
            3'b010: ALU_Out = A & B;
            3'b011: ALU_Out = A | B;
            3'b100: ALU_Out = A ^ B;
            3'b101: ALU_Out = (A < B);
            3'b110: ALU_Out = A;
            default: ALU_Out = 8'h00;
        endcase
    end
endmodule
