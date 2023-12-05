module dff(input wire d,clk, output reg q, qbar);
  always@(posedge clk)
    begin
      if(d == 1)
      begin
      q = 1;
      qbar = 0;
      end
      else if(d == 0)
      begin
      q = 0;
      qbar =1;
      end
  end
endmodule