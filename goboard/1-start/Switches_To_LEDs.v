module Switches_To_LEDs
 (
    // Inputs
    // default size: 1 bit
    input  i_Switch_1,
    input  i_Switch_2,
    input  i_Switch_3,
    input  i_Switch_4,

    // Outputs
    // default size: 1 bit
    output o_LED_1,
    output o_LED_2,
    output o_LED_3,
    output o_LED_4
  );

  // Logic of the design
  
  // Continuous assignment
  // There is no clock. It is like physical wiring on breadboard
  assign o_LED_1 = i_Switch_1;
  assign o_LED_2 = i_Switch_2;
  assign o_LED_3 = i_Switch_3;
  assign o_LED_4 = i_Switch_4;

endmodule