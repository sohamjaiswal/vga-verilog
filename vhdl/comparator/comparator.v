module Comparator11 (
  input [10:0] input_value,
  input [10:0] loaded_value,
  output reg match
);
  always @(input_value, loaded_value) begin
    if (input_value == loaded_value) begin
      match = 1;  // Output high if input matches loaded value
    end else begin
      match = 0;  // Output low otherwise
    end
  end
endmodule

module Comparator10 (
  input [9:0] input_value,
  input [9:0] loaded_value,
  output reg match
);
  always @(input_value, loaded_value) begin
    if (input_value == loaded_value) begin
      match = 1;  // Output high if input matches loaded value
    end else begin
      match = 0;  // Output low otherwise
    end
  end
endmodule