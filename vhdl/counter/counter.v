module HCounter (
  input wire clk,  // Clock signal
  input wire rst,  // Reset signal
  output reg [10:0] count,  // 11-bit counter output
  output reg int_reset
);
  always @(posedge clk or posedge rst) begin
    int_reset <= 0;
    if (rst) begin
      count <= 11'b0;  // Reset the counter to zero when rst is asserted
    end else begin
      if (count == 11'd1056) begin  // Check if the counter is at 1056
        count <= 11'b0;  // Reset the counter when it reaches 1056
        int_reset <= 1; // Reset the internal counter
      end else begin
        count <= count + 1;  // Increment the counter
      end
    end
  end
endmodule

module VCounter (
  input wire clk,  // Clock signal
  input wire rst,  // Reset signal
  output reg [9:0] count,  // 10-bit counter output
  output reg int_reset
);
  always @(posedge clk or posedge rst) begin
    int_reset <= 0;
    if (rst) begin
      count <= 10'b0;  // Reset the counter to zero when rst is asserted
    end else begin
      if (count == 10'd628) begin  // Check if the counter is at 628
        count <= 10'b0;  // Reset the counter when it reaches 628
        int_reset <= 1; // Reset the internal counter
      end else begin
        count <= count + 1;  // Increment the counter
      end
    end
  end
endmodule