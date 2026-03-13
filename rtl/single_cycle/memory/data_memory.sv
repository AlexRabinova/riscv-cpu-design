module data_memory #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 8
)(
    input  logic                   clk,
    input  logic                   we,
    input  logic [DATA_WIDTH-1:0]  a,
    input  logic [DATA_WIDTH-1:0]  wd,
    output logic [DATA_WIDTH-1:0]  rd
);

localparam DEPTH = 1 << ADDR_WIDTH;

logic [DATA_WIDTH-1:0] RAM [0:DEPTH-1];

assign rd = RAM[a[ADDR_WIDTH+1:2]];

always_ff @(posedge clk)
begin
    if (we)
        RAM[a[ADDR_WIDTH+1:2]] <= wd;
end

endmodule