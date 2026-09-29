module instruction_memory #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 8         // 2^8 = 256 words = 1 KB 
)(
    input  logic [DATA_WIDTH-1:0] addr,
    output logic [DATA_WIDTH-1:0] instr
);

localparam DEPTH = 1 << ADDR_WIDTH;  // DEPTH = 2^ADDR_WIDTH

logic [31:0] ROM [0:DEPTH-1];

initial 
    $readmemh("rtl/single_cycle/memory/test.dat", ROM);

// word aligned access
 assign  instr = ROM[addr[ADDR_WIDTH+1:2]]; // The first two bits are not important for the words.

endmodule