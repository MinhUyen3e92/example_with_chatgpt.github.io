module syn_fifo(
    input clk,            // Clock input
    input rst,            // Reset input
    input write_en,       // Write enable input
    input [7:0] data_in,  // Data input
    output full,      // Full flag output
    output empty,
    input read_en,        // Read enable input
    output reg [7:0] data_out // Data output
);

parameter DEPTH = 15;  // Depth of the FIFO

reg [7:0] memory [0:DEPTH-1];  // Internal memory to store data
reg [3:0] write_ptr = 4'b0000; // Write pointer
reg [3:0] read_ptr = 4'b0000;  // Read pointer



// Write operation
always @(posedge clk) begin
    if (rst) begin
        write_ptr <= 4'b0000;  // Reset write pointer
    end else if (write_en && !full) begin
        memory[write_ptr] <= data_in;  // Write data to memory
        write_ptr <= write_ptr + 1'b1;     // Increment write pointer
    end
end

// Read operation
always @(posedge clk) begin
    if (rst) begin
        read_ptr <= 4'b0000;  // Reset read pointer
    end else if (read_en && !empty) begin
        data_out <= memory[read_ptr];  // Read data from memory
        read_ptr <= read_ptr + 1'b1;       // Increment read pointer
    end
end
assign full = ((write_ptr + 1'b1) == read_ptr);
assign empty = (write_ptr == read_ptr);

endmodule
