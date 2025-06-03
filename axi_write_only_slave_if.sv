interface axi_write_slave_if(input logic ACLK , input logic ARESETN);
  logic [31:0] AWADDR,WDATA;
  logic [ 3:0] WSTRB;
  logic        AWVALID,AWREADY,WVALID,WREADY;
  logic        BVALID,BREADY;
  logic [ 1:0] BRESP;
endinterface
