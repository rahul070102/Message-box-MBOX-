module mutex(
  input logic clk, rst_n,
  input logic req0, req 1,
  output logic grant0, grant1
);
  always_ff@( posedge clk or negedge rst_n)
    if(!rst_n) 
      {grant0,grant1} = 2'b00;
    else
      begin
        if(req0 && !req1)
          {grant0,grant1} = 2'b10;
        else if(!req0 && req1)
          {grant0,grant1} = 2'b01;
        else
          {grant0,grant1} = 2'b00;
      end
endmodule
