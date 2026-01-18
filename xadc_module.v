`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2022 04:12:31 PM
// Design Name: 
// Module Name: xadc_module
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


module xadc_module(
    input clk,
    input [7:0] adc_input,
    output reg [15:0] adc_output  // output ADC register
    );
    
    reg [6:0] daddr_in = 8'h16;   // This hardcodes the XADC to read aux input 6, which is tied
                               // to JA1(+) and JA7(-)
    wire eoc_out, ready;
    wire [15:0] XADC_data;        // direct ADC output
    xadc_wiz_0
      xadc_wiz_inst (
      .daddr_in(daddr_in[6:0]),
      .dclk_in(clk),
      .den_in(eoc_out),              // tie EOC out to DEN_IN to continuously digitize
      .di_in(0),
      .dwe_in(0),
      .reset_in(),
      .vauxp6(adc_input[0]),              // Auxiliary channel 6
      .vauxn6(adc_input[4]),
      .busy_out(),
      .channel_out(),
      .do_out(XADC_data),
      .drdy_out(ready),
      .eoc_out(eoc_out),
      .eos_out(),
      .alarm_out(),
      .vp_in(),
      .vn_in()
      );
// clock data into output register when ready.  The ADC is a 12-bit conversion, but it is left-shifted into
// 16-bits, so we right shift it back at this point.
    always @(posedge clk)
      if(ready==1) adc_output = XADC_data[15:4];

endmodule
