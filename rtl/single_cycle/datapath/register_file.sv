module register_file #(
    parameter DATA_WIDTH = 32,
    parameter REG_COUNT  = 32,
    parameter ADDR_WIDTH = 5
)(
    input  logic                     clk,
    input  logic                     we,          // write enable
    input  logic [ADDR_WIDTH-1:0]    rs1,
    input  logic [ADDR_WIDTH-1:0]    rs2,
    input  logic [ADDR_WIDTH-1:0]    rd,
    input  logic [DATA_WIDTH-1:0]    wd,          // write data
    output logic [DATA_WIDTH-1:0]    rd1,         // read data 1
    output logic [DATA_WIDTH-1:0]    rd2          // read data 2
);

logic [DATA_WIDTH-1:0] registers [REG_COUNT-1:0];


// write port
always_ff @(posedge clk) begin
    if (we && rd != 0)
        registers[rd] <= wd;
end


// read port 1
assign rd1 = (rs1 == 0) ? '0 : registers[rs1];

// read port 2
assign rd2 = (rs2 == 0) ? '0 : registers[rs2];

endmodule