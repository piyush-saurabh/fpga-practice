module and_gate
 (
    // Inputs
    input  i_Switch_1,
    input  i_Switch_2,

    // Outputs
    output o_LED_1
  );

  // Continuous assignment
  // There is no clock. It is like physical wiring on breadboard
  assign o_LED_1 = i_Switch_1 & i_Switch_2;
endmodule
