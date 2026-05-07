module toggle_led
(
    // inputs
    input  i_Clk,
    input  i_Switch_1,

    // output
    output o_LED_1
);

    // registers (flip-flops)
    reg r_LED_1    = 1'b0;
    reg r_Switch_1 = 1'b0;
    
    // Purpose: Toggle LED output when i_Switch_1 is released.
    // This type of code block is triggered by changes in one or more signals
    // Here the block is triggered by the rising edge of the clock (i_Clk). This means that the code inside the block will execute when clock changes from low to high.
    always @(posedge i_Clk)
    begin
        // everything in this block happens in parallel, so order of the statement does not matter.  This is different from software programming where statements are executed sequentially.
       
        // Data Input (D): i_Switch_1
        // Output (Q): r_Switch_1
        // CLK: i_Clk
        // Assignments in an always or process block that use <= don’t occur immediately. Instead, they take place on each rising edge of the clock and therefore are all executed at the same time.
        r_Switch_1 <= i_Switch_1;  // create a flip flop (Register) 
    
        // This conditional expression looks for a falling edge on i_Switch_1.
        // Here, the current value (i_Switch_1) is low, but the previous value
        // (r_Switch_1) is high.  This means that we found a falling edge.
        if (i_Switch_1 == 1'b0 && r_Switch_1 == 1'b1) // 'and' uses LUT
        begin
            // LUTs
            r_LED_1 <= ~r_LED_1;   // Toggle LED output
        end
    end
    
    assign o_LED_1 = r_LED_1;
endmodule