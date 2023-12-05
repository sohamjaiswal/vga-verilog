`include "srff.v"
`timescale 1ns/1ns

module tb_SRFlipFlop;
  reg S, R, clk;  // Input signals
  wire Q;  // Output signal

  // Instantiate the SR flip-flop module
  SRFlipFlop flipflop_inst (
    .S(S),
    .R(R),
    .clk(clk),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle the clock every 5 time units
  end

  // Test cases
  initial begin
    $dumpfile("dump.vcd");  // Specify the dumpfile name
    $dumpvars(1);  // Dump all variables
    // Test case 1: Set the flip-flop
    S = 1;
    R = 0;
    #10;
    $display("Test Case 1: Q=%b", Q);

    // Test case 2: Reset the flip-flop
    S = 0;
    R = 1;
    #10;
    $display("Test Case 2: Q=%b", Q);

    // Test case 3: Do nothing (maintain state)
    S = 0;
    R = 0;
    #10;
    $display("Test Case 3: Q=%b", Q);

    // Test case 4: Set and Reset at the same time (undefined behavior)
    S = 1;
    R = 1;
    #10;
    $display("Test Case 4: Q=%b", Q);

    $finish;  // End simulation
  end
endmodule