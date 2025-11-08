`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 23:58:22
// Design Name: 
// Module Name: mux16to1
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


module mux16to1(
input [0:15]i,
input [0:3]s,
output out
    );
    wire [0:3]w;
    mux4to1 m1 (i[0:3],s[0:1],w[0]);
    mux4to1 m2 (i[4:7],s[0:1],w[1]);
    mux4to1 m3 (i[8:11],s[0:1],w[2]);
    mux4to1 m4 (i[12:15],s[0:1],w[3]);
    
    mux4to1 final(w[0:3],s[2:3],out);
endmodule
module mux4to1(i,s,out);
input [0:3]i;
input [0:1]s; 
output reg out;

always@(*)
begin
   case(s)
   2'b00 : out = i[0];
   2'b01 : out = i[1];
   2'b10 : out = i[2];
   2'b11 : out = i[3];
   
   endcase
end
endmodule