module auto_fetch_controller(
  input logic  clk,rst_n,
  input logic  start_fetch,
  input logic  [ 3:0] fetch_count,
  input logic  [31:0] base_addr,
  output logic [31:0] current_addr,
  output logic done
);
  logic [3:0] count;
  always_ff@(posedge clk or negedge rst_n)
    begin
      if(~rst_n)
        begin
          count <= 0;
          current_addr <= 0;
        end
      else if (start)
        begin
          if(count < fetch_count)
            begin
              current_addr <= base_addr + (count << 2);
              count <= count + 1'b1;
              done <= '0;
            end
          else
            done <= '1;
        end
      else
        done <= '0;
    end
endmodule
          
