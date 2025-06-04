module skid_buffer #( parameter DATA_WIDTH = 32)(
  input logic clk,rst_n,
  input logic in_valid_i,
  input logic en_ready_i,
  input logic [DATA_WIDTH - 1 : 0] data_in,
  output logic en_valid_o,
  output logic in_ready_i,
  output logic [DATA_WIDTH - 1 : 0] data_out
);

  logic buf_valid,buf_valid_q,buf_valid_en;
  logic i_ready_q;
  logic [DATA_WIDTH - 1 : 0] buf_data_q;
  logic e_valid;

  always@(posedge clk or negedge rst_n)
    begin
      if(!rst_n)
        begin
          buf_valid_q <= 0;
          buf_data_q <= 0;
        end
      else if (buf_valid_en)
        begin
          buf_valid_q <= buf_valid;
          buf_data_q <= data_in;
        end
    end

  assign i_ready_q = ~buf_valid_q;
  assign e_valid_q = buf_valid | i_valid_i;
  assign buf_valid_en = buf_valid | e_ready_i;
  assign data_out = buf_valid ? buf_data_q : data_in;
endmodule
          
