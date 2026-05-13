module Debounce_Project_Top
  (input  i_Clk,
   input  i_Switch_1,
   output o_LED_1);

  // multiple modules are present, so we need wire for connecting them
  wire w_Debounced_Switch;
   
  // Module 1 Instantiation
  // Instantiate Debounce Filter
  // value of module's parameter is overriden from default 20 to 250000 clocks or 10ms(for 25MHz clock cycle)
  Debounce_Filter #(.DEBOUNCE_LIMIT(250000)) Debounce_Inst
  (.i_Clk(i_Clk), 
   .i_Bouncy(i_Switch_1),
   .o_Debounced(w_Debounced_Switch));
   
  // Module 2 Instantiation
  // Instantiate LED Toggle Module (from Chapter 04)
  LED_Toggle_Project LED_Toggle_Inst 
  (.i_Clk(i_Clk),
   .i_Switch_1(w_Debounced_Switch),
   .o_LED_1(o_LED_1));
   
endmodule