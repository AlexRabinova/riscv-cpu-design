module instruction_memory #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 8         // 2^8 = 256 words
)(
    input  logic [DATA_WIDTH-1:0] addr,
    output logic [DATA_WIDTH-1:0] instr
);

localparam DEPTH = 1 << ADDR_WIDTH;

logic [DATA_WIDTH-1:0] ROM [0:DEPTH-1];

initial begin
    $readmemh("rtl/single_cycle/memory/test.dat", ROM);
end

// word aligned access
assign instr = ROM[addr[ADDR_WIDTH+1:2]];

endmodule