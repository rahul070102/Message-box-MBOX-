interface axi_master_if(input logic ACLK , input logic ARESETN);
  logic [31:0] AWADDR,WDATA,ARADDR;
  logic [ 2:0] AWPROT,ARPROT;
  logic [ 3:0] WSTRB;
  logic        AWVALID,AWREADY,WVALID,WREADY;
  logic        BVALID,BREADY;
  logic [ 1:0] BRESP;
  logic        ARVALID,ARREADY,RVALID,RREADY;
  logic [31:0] RDATA;
  logic [ 1:0] RRESP;
endinterface
