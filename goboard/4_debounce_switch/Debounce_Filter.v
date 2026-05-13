module Debounce_Filter #(parameter DEBOUNCE_LIMIT = 20) (
  input  i_Clk,
  input  i_Bouncy,
  output o_Debounced);
 
  // Will set the width of this counter based on the input parameter
  // $clog2() built-in function (short for ceiling log base 2) determines the log2 of the number of clock cycle we want to count, rounded up.
  reg [$clog2(DEBOUNCE_LIMIT)-1:0] r_Count = 0;
  reg r_State = 1'b0;
  
  // Because the FPGA has no inherent concept of time, we implement the delay by counting clock cycles.
  // we will count for 25000 times / 10 ms (clock frequency is 25 MHz)
  // We implement the debounce filter using a series of if statements that are evaluated at each clock cycle.
  always @(posedge i_Clk)
  begin
    // Bouncy input is different than internal state value, so an input is
    // changing.  Increase the counter until it is stable for enough time.  
	if (i_Bouncy !== r_State && r_Count < DEBOUNCE_LIMIT-1)
    begin
      r_Count <= r_Count + 1;
    end
    
    // End of counter reached, switch is stable, register it, reset counter
    else if (r_Count == DEBOUNCE_LIMIT-1)
    begin
      r_State <= i_Bouncy;
      r_Count <= 0;
    end 

    // Switches are the same state, reset the counter
    else
    begin
      r_Count <= 0;
    end
  end
  
  // Assign internal register to output (debounced!)
  assign o_Debounced = r_State;
  
endmodule