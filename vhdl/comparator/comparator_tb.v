`include "comparator.v"
`timescale 1ns/1ns

module tb_comparator;
  reg [10:0] input_value;
  reg [10:0] loaded_value;
  wire match;

  // Instantiate the comparator module
  ElevenBitComparator comparator_inst (
    .input_value(input_value),
    .loaded_value(loaded_value),
    .match(match)
  );

  // Testbench stimulus
  initial begin
    $dumpfile("dump.vcd");  // Specify the dumpfile name
    $dumpvars(1);  // Dump all variables
    // Load a value into the comparator
    loaded_value = 11'b11011011011;

    // Test case 1: Input matches loaded value
    input_value = 11'b11011011011;
    #10;  // Wait for a few time units
    $display("Test Case 1: Match = %b", match);

    // Test case 2: Input does not match loaded value
    input_value = 11'b10101010101;
    #10;  // Wait for a few time units
    $display("Test Case 2: Match = %b", match);

    $finish;  // End simulation
  end
endmodule