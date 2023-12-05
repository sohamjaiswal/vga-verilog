module imgStorage (
  input wire clk,  // Clock input
  input wire rst,  // Reset input
  input wire HDraw,  // Horizontal drawing signal
  input wire VDraw,  // Vertical drawing signal
  output reg [23:0] data  // Data output
);
  reg [23:0] memory [0:47999];
  initial begin
    $readmemh("../out.txt", memory);
  end
  
  integer i;

  always @(posedge clk or posedge rst) begin
    if (i > 47999) begin
      i = 0;
    end
    if (rst) begin
      i = 0;
      data <= 0;
    end else if (HDraw&VDraw) begin
      data <= memory[i];
      i = i + 1;
    end else begin
      data <= 0;
    end
  end
endmodule