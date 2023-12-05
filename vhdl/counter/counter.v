module Counter (
  input wire clk,  // Clock signal
  input wire rst,  // Reset signal
  output reg [10:0] count  // 11-bit counter output
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      count <= 11'b0;  // Reset the counter to zero when rst is asserted
    end else begin
      if (count == 11'd1056) begin  // Check if the counter is at 1056
        count <= 11'b0;  // Reset the counter when it reaches 1056
      end else begin
        count <= count + 1;  // Increment the counter
      end
    end
  end

endmodule