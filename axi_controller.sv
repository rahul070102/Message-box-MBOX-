module axi_controller #
  (parameter ADDR_WIDTH = 32 , DATA_WIDTH = 32)
  (input logic  clk,rst_n,
   input logic  start_write,
   input logic  start_read,
   input logic  [ADDR_WIDTH - 1 : 0] addr,
   input logic  [DATA_WIDTH - 1 : 0] wdata,
   output logic [DATA_WIDTH -1 : 0] rdata,
   input logic  [3:0]    wstrb,
   output logic           done,
   output logic           error,
   axi_master_if          axi_if
  );

  typedef enum logic [1:0]{IDLE, AW, W, B, AR, R}state_t;

  state_t state,next_state;

  logic [1:0] bresp_reg,rresp_reg;

  always_ff@(posedge clk or negedge rst_n)
    if(!rst_n)
      state <= IDLE;
    else
      state <= next_state;

  always_comb
    begin
      next_state = IDLE;
      done = '0;
      error = '0;
      axi_if.AWVALID = '0;
      axi_if.
