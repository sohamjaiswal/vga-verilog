`include "img_eeprom.v"  // Include the module we want to test
`timescale 1ns/1ns  // Define simulation timescale

module imgStorage_tb;

  reg clk;         // Clock signal
  reg rst;         // Reset signal
  reg HDraw;       // Horizontal drawing signal
  reg VDraw;       // Vertical drawing signal
  wire [23:0] data; // Data output

  // Instantiate the imgStorage module
  imgStorage imgStorage_inst (
    .clk(clk),
    .rst(rst),
    .HDraw(HDraw),
    .VDraw(VDraw),
    .data(data)
  );

    // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Memory initialization
  initial begin
    $dumpfile("dump.vcd"); // Optional: Generate VCD waveform dump file
    $dumpvars(0, imgStorage_inst);

    // Initialize signals
    clk = 0;
    rst = 1;
    HDraw = 0;
    VDraw = 0;

    // Apply reset
    #10 rst = 0;

    // Wait for a few clock cycles
    #20;

    HDraw = 1;
    VDraw = 1;

    // End simulation
    #1000 $finish;
  end

endmodule