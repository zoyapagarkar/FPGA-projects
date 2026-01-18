// Converts a 16 bit hexadecimal number into a 20 bit bcd
// (binary coded decimal) representation, in which each 
// 4 bits represents one digit
// 
module hex2bcd (
    input [15:0] hex,  // hexidecimal representation
    output [19:0] dec // decimal representation
  );
// Could do this in some sort of clever loop, bit
// it's easier to just type it out
  wire [3:0] dig0,dig1,dig2,dig3,dig4;
  
  assign dec={dig4,dig3,dig2,dig1,dig0};
  assign dig0=hex%10;
  assign dig1=(hex/10)%10;
  assign dig2=(hex/100)%10;
  assign dig3=(hex/1000)%10;
  assign dig4=(hex/10000)%10;
endmodule
