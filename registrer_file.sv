module register_file(
  input logic clk,rst_n,
  input logic write_en,
  input logic  [3:0]  addr,
  input logic  [31:0] wdata,
  output logic [31:0] rdata,
  output logic [31:0] base_addr,
  output logic [ 3:0] fetch_count,
  output logic        start_fetch
);
  logic [31:0]mem[15:0];
  always_ff@(posedge clk or negedge rst_n)
    begin
      if(~rst_n)
        begin
          for(int i = 0; i < 16 ;  i = i+1)
            mem[i] <= 0;
        end
      else if (write_en)
        reg[addr] <= wdata;
    end
  assign base_addr  = mem[0];
  assign fetch_count = mem[3:0][1];
  assign start_fetch = mem[0][2];
  assign rdata = mem[addr];
endmodule
  
