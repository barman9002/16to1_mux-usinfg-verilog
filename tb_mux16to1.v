`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2025 23:58:56
// Design Name: 
// Module Name: tb_mux16to1
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


`timescale 1ns / 1ps

module tb_mux16to1;

    // Inputs
    reg [0:15] i;
    reg [0:3] s;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    mux16to1 uut (
        .i(i),
        .s(s),
        .out(out)
    );

    initial begin
        $monitor("Time=%0t | Select=%b | Output=%b", $time, s, out);

        // Initialize inputs
        i = 16'b0000_0000_0000_0000;
        s = 4'b0000;

        // Test each input line one by one
        // At each step, only one bit of i is set to 1
        // and selection lines choose that bit
        #10 i = 16'b1000_0000_0000_0000; s = 4'b0000;  // i[0]
        #10 s = 4'b0001;                              // i[1]
        #10 s = 4'b0010;                              // i[2]
        #10 s = 4'b0011;                              // i[3]

        #10 i = 16'b0001_0000_0000_0000; s = 4'b0100; // i[4]
        #10 s = 4'b0101;                              // i[5]
        #10 s = 4'b0110;                              // i[6]
        #10 s = 4'b0111;                              // i[7]

        #10 i = 16'b0000_0001_0000_0000; s = 4'b1000; // i[8]
        #10 s = 4'b1001;                              // i[9]
        #10 s = 4'b1010;                              // i[10]
        #10 s = 4'b1011;                              // i[11]

        #10 i = 16'b0000_0000_0000_1000; s = 4'b1100; // i[12]
        #10 s = 4'b1101;                              // i[13]
        #10 s = 4'b1110;                              // i[14]
        #10 s = 4'b1111;                              // i[15]

        $display("Simulation completed!");
        $finish;
    end

endmodule
