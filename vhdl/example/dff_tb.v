`include "dff.v"
module dff_tb;
  reg d, clk;
  wire q, qbar;
  // Instantiate the module we want to test (srff_behave)
  dff dut (
    .d(d),
    .clk(clk),
    .q(q),
    .qbar(qbar)
  );
  // Monitor TB ports
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1); 
    $monitor("CLK = %b, D = %b, Q = %b, QBAR = %b", clk, d, q, qbar);
  end
  // Generate clock signal
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  // Apply test vectors
  initial begin
    #100;
    d = 1;
    #100;
    d = 0;
    #100;
    $finish; // Terminate the simulation
  end
endmodule