`include "counter.v"  // Include the module we want to test
`timescale 1ns/1ns  // Specify timescale for simulation

module tb_counter;
  reg clk;  // Clock signal
  reg rst;  // Reset signal
  wire [10:0] count;  // Counter output

  // Instantiate the counter module
  Counter counter_inst (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Clock generation for a 40 MHz clock
  initial begin
    clk = 0;
    forever #12.5 clk = ~clk;  // Toggle the clock every 12.5 ns (40 MHz)
  end

  // Initial block
  initial begin
    $dumpfile("dump.vcd");  // Specify the dumpfile name
    $dumpvars(1);  // Dump all variables
    $monitor("Time=%0t, Count=%d", $time, count); // Monitor the counter value

    // Initialize reset and deassert after a short delay
    rst = 1;
    #10 rst = 0;

    // Run the simulation for sufficient time
    #27469 $finish;  // Terminate simulation after 53,000 ns (enough time for the counter to reach 1056 and reset)
  end

endmodule