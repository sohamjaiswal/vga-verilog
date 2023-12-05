`include "./comparator/comparator.v"
`include "./counter/counter.v"
`include "./srff/srff.v"
`timescale 1ns/1ns

module tb_vga;
  reg clk;  // Clock signal
  reg rst;  // Reset signal
  wire [10:0] Hcount;  // Counter output
  wire HReset;
  wire [9:0] Vcount;  // Counter output
  wire VReset;

  wire match1056;
  wire match800;
  wire match840;
  wire match968;

  wire match600;
  wire match628;
  wire match601;
  wire match605;

  wire isDrawingPixels;
  wire isDrawingLines;
  wire isHSyncing;
  wire isVSyncing;
  wire hSyncPulse;
  wire vSyncPulse;

  // Instantiate the counter module
  HCounter counter_inst (
    .clk(clk),
    .rst(rst),
    .count(Hcount),
    .int_reset(HReset)
  );

  // Horizontal sync logic
  Comparator11 comparator1056_inst (
    .input_value(Hcount),
    .loaded_value(11'b10000100000), // Wave end value
    .match(match1056)
  );

  Comparator11 comparator800_inst (
    .input_value(Hcount),
    .loaded_value(11'b1100100000), // Drawing end value
    .match(match800)
  );

  Comparator11 comparator840_inst (
    .input_value(Hcount),
    .loaded_value(11'b1101001000), // HSync end value
    .match(match840)
  );

  Comparator11 comparator968_inst (
    .input_value(Hcount),
    .loaded_value(11'b1111001000), // HSync end value
    .match(match968)
  );

  SRFlipFlopDef1 isDrawing_srff_inst ( // default 1 sr flipflop
    .S(match1056),
    .R(match800),
    .clk(clk),
    .Q(isDrawingPixels)
  );

  SRFlipFlopDef0 isHSyncing_srff_inst ( // default 0 sr flip flop
    .S(match840),
    .R(match968),
    .clk(clk),
    .Q(isHSyncing)
  );
  
  // Vertical timings
  VCounter vcounter_inst (
    .clk(HReset), // counting number of horizontal sync pulses
    .rst(rst),
    .count(Vcount),
    .int_reset(VReset)
  );

  // Vertical sync logic
  Comparator10 comparator600_inst (
    .input_value(Vcount),
    .loaded_value(10'b1001011000), // Drawing start value
    .match(match600)
  );

  Comparator10 comparator601_inst (
    .input_value(Vcount),
    .loaded_value(10'b1001011001), // Drawing end value
    .match(match628)
  );

  Comparator10 comparator605_inst (
    .input_value(Vcount),
    .loaded_value(10'b1001011101), // Drawing end value
    .match(match601)
  );

  Comparator10 comparator628_inst (
    .input_value(Vcount),
    .loaded_value(10'b1001110100), // Drawing end value
    .match(match605)
  );

  SRFlipFlopDef1 isDrawingLines_srff_inst ( // default 1 sr flipflop
    .S(match628),
    .R(match600),
    .clk(clk),
    .Q(isDrawingLines)
  );

  SRFlipFlopDef0 isVSyncing_srff_inst ( // default 0 sr flip flop
    .S(match601),
    .R(match605),
    .clk(clk),
    .Q(isVSyncing)
  );

  assign hSyncPulse = ~isHSyncing; // hSyncPulse active low when horizontal sync
  assign vSyncPulse = ~isVSyncing; // vSyncPulse active low when vertical sync

  // Clock generation for a 40 MHz clock
  initial begin
    clk = 0;
    forever #12.5 clk = ~clk;  // Toggle the clock every 12.5 ns (40 MHz)
  end

  // Initial block
  initial begin
    $dumpfile("dump.vcd");  // Specify the dumpfile name
    $dumpvars(1);  // Dump all variables
    $monitor("Time=%0t, Count=%d", $time, Hcount); // Monitor the counter value
    // Initialize reset and deassert after a short delay
    rst = 1;
    #10 rst = 0;

    // Run the simulation for sufficient time
    // single line 
    // #27469 $finish; 
    // double line (vertical match action)
    // #54938 $finish;  
    // multiline (vsync action) [~0.017278001 second (~60hz)]
    #17305470 $finish;
  end
endmodule