`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:53 06/12/2014 
// Design Name: 
// Module Name:    seg7decimal 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module seg7display(

	input [15:0] input_bytes,
    input clk,
    output reg [6:0] a_to_g,  // specifies the seven segments of a digit to display
    output reg [3:0] an,  // specifies which of four displays are enabled
    output wire dp  // single-bit, decimal point
	 );
	 
	 
wire [1:0] s;	 
reg [3:0] digit;
wire [3:0] aen;
reg [19:0] clkdiv;

assign dp = 1;
assign s = clkdiv[19:18];
assign aen = 4'b1111; // all turned off initially

// quad 4to1 MUX.


always @(posedge clk)// or posedge clr)
	
	case(s)
	0:digit = input_bytes[3:0]; // s is 00 -->0 ;  digit gets assigned 4 bit value assigned to x[3:0]
	1:digit = input_bytes[7:4]; // s is 01 -->1 ;  digit gets assigned 4 bit value assigned to x[7:4]
	2:digit = input_bytes[11:8]; // s is 10 -->2 ;  digit gets assigned 4 bit value assigned to x[11:8
	3:digit = input_bytes[15:12]; // s is 11 -->3 ;  digit gets assigned 4 bit value assigned to x[15:12]
	
	default:digit = input_bytes[3:0];
	
	endcase
	
	//decoder or truth-table for 7a_to_g display values
	always @(*)

case(digit)


//////////<---MSB-LSB<---
//////////////gfedcba////////////////////////////////////////////              a
0:a_to_g = 7'b1000000;////0000												   __					
1:a_to_g = 7'b1111001;////0001												f/	  /b
2:a_to_g = 7'b0100100;////0010												  g
//                                                                           __	
3:a_to_g = 7'b0110000;////0011										 	 e /   /c
4:a_to_g = 7'b0011001;////0100												 __
5:a_to_g = 7'b0010010;////0101                                               d  
6:a_to_g = 7'b0000010;////0110
7:a_to_g = 7'b1111000;////0111
8:a_to_g = 7'b0000000;////1000
9:a_to_g = 7'b0010000;////1001
'hA:a_to_g = 7'b0001000; // 1010
'hB:a_to_g = 7'b0000011; // 1011
'hC:a_to_g = 7'b1000110; // 1100
'hD:a_to_g = 7'b0100001; // 1101
'hE:a_to_g = 7'b0000110; // 1110
 default:a_to_g = 7'b0001110; //1111
endcase


always @(*)begin
an=4'b1111;
if(aen[s] == 1)
an[s] = 0;
end


//clkdiv

always @(posedge clk) begin
  clkdiv <= clkdiv+1;
end


endmodule
