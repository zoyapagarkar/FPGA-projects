// Project Name: INDAT-Basys3-template
// Author: Prof. Eric Prebys, UC Davis
// 
// This is a template Basys3 project, used as a starter for the INDAT FPGA lab at UC Davis.
// This simple version has no starting configurations, but many can be enabled 
// by simply commenting out certain lines or following the instructions.
//
//  Version history
//  1.0  EjP  20220610 - Original. Based on io-counter-Basys3
//  1.1  EjP  20220621 - cleaned up. Leave display in HEX for now
//  1.2  RsH  20220627 - Updated project structure to obstruct xadc functionality 
//                       and variables away from students except for variables
//                       they will be directly using (JXADC, ADC).
//                       Also, add comments to explain instructions of lab 
//                       and verilog basics alongside the main lab manual
//  1.3  EjP   20230620 - moved to INDAT...  older version of Vivado
//  1.4  RsH   20230620 - Further updates
//  1.4.1  RsH 20250609 - Slight reworking of some comments
//  1.5  RsH   20251225 - Update lab for solo indpendent FPGA work
//                        Change mentions of "ADC" to "count"

module indat_lab(
    // All these particular variables below are defined to have special names that match internal names in the constraint files
    // By choosing these variables to have certain names, they will automatically match to things on the FPGA
    // Part 1 Variables: connecting switches to LEDs
    input clk,              // 100MHz clock
    input [15:0] sw,        // 16 switches
    output [15:0] led,      // 16 LEDs 

    // Part 2 Variables: the seven segment display
    output [6:0] seg,
    output [3:0] an, 
    output dp,
    
    );
     
    // ~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~ //
    // Lab Part 1: Tying the LEDs to the switches //
    // ~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~ //

    // Try to tie the first four switches (sw[0], ...)  to LEDs (led[0], ...) individually using "assign"
    // Use "assign" in Verilog to tie the value of an input to an output.
    // Example:     
    //     assign output_variable = input_variable;
    // The above would assign the value of output_variable to the value of an input_variable
    // The output variables in this case should be LEDs, and the input variables should be switches.
    
    // Try to tie the first four switches (sw[0], sw[1], sw[2], sw[3]) to the first four LEDs (led[0], led[1], led[2], led[3]):
    // For the rest of the switches and LEDs, try tying them together in bulk. You can assign led[15:4] to sw[15:4].
    // assign ___ = ____;
    // Write five "assign" statements below to complete the above task




    

    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~ //
    // Lab Part 2: Showing values on the seven segment display //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~ //

    // This value will hold our count value
    reg [15:0] count = 0;  // 16-bit register to hold the count value

    // Put in code to increment the counter whenever ADC sees an edge (ADC is above threshold, previous ADC is below)
    // See the Verilog help document for hints on how to write this code. We don't need a reset for now, just the 
    // count increment is fine.
    always @(posedge clk) begin
      // User code here...
    end

    

    // This variable will be the bytes we feed into the seg7decimal module to be displayed 
    // It is a wire, which means it does not hold a value by itself, it just connects other things together
    //   and carries a value from one to another. The "value" on it at any point is just the value of whatever
    //   it is connected to.   
    wire [15:0] display_bytes; // The bytes you want to display on the 7-segment display
    
    // The below line will enable the seg7decimal display to show its value
    // The modules is called seg7decimal, then "u1" is our local instantiation name we give it. 
    // If there's ever a design where we implement two copies of the same module, then the instantiation names
    //   would differentiate them (u1, u2, etc) 


    // This instance converts a 16 bit number to a 4 digit hex display. Uncomment the below line and fill in the blank.
    // seg7decimal u1 (.clk(clk), .input_bytes(______),     .a_to_g(seg),.an(an), .dp(dp));
    //                       ^ two inputs  ^                 ^ ouptuts (don't touch these)

    // For filling in the blank:
    //  Think about the physical connections: what do you want to go into the seg7decimal module to be displayed?
    
    
    

    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    // Lab Part 3: Modifying the code                         //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    // Follow the instructions on the lab document for "Part 3". 
    // First, edit the assign statements from Part 1 of the lab to contain the logic outlined in the lab report
    // Note, 16'h8000 means "a 16-bit hexadecimal number with the hexadecimal value 8000"
    // A random other example: 6'b 100100 would be "a 6-bit binary number with the binary value 100100"
    // Adding a space after the letter is optional (6'b1001000 or 6'b 1001000 are both fine)

    // Make sure to either edit the assign statements from part 1, or comment them out and rewrite them here, but 
    // don't leave both versions of the assign statements active at the same time, or you'll get errors (why?)
    
    
    
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    // Lab Part 4: Convert hexadecimal to decimal display     //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    
    // Next, at the bottom of page 7, bring in the module that will convert hexadecimal to bcd (binary coded decimal)
    // It tells you the input is hex and the output is dec, so you'll need something like (fill in the blanks)
    // hex2bcd u3 (.hex(___), .dec(___));
    //
    // Reconsider the flow of data at this point. Try to draw a diagram of which wires carry which data between which modules.
    
    
    

    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    // Lab Part 5: Implementing a button to reset the counter //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    
    // In the above always block, add some code at the end that resets count to 0 when btnC == 1. 
    // You'll need to add btnC as an input to our module at the top (go do this!)
    // Vivado will automatically detect that btnC is an input and connect it to the right pin on the FPGA 
    //   based on the constraints file.
  
  
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~ //
    // Lab Part 6: Final optional project!                    //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~ ~~ ~~~~~~~~~~~~~~~~~~~~~~~~~ //






endmodule