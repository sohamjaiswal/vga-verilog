module SRFlipFlop (
  input wire S,  // Set input
  input wire R,  // Reset input
  input wire clk,  // Clock input
  output reg Q  // Q output
);

  always @(posedge clk) begin
    if (R) begin
      Q <= 0;  // Reset the flip-flop
    end else if (S) begin
      Q <= 1;  // Set the flip-flop
    end
    // If neither Set nor Reset is active, the flip-flop maintains its state
  end

endmodule