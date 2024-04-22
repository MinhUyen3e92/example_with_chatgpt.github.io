module mux_4to1(
    input [3:0] data_in,   // Four input data lines
    input [1:0] sel,       // Selection control signal (2 bits for 4 inputs)
    output reg data_out    // Output data line
);

always @(*) begin
    case (sel)
        2'b00: data_out = data_in[0];
        2'b01: data_out = data_in[1];
        2'b10: data_out = data_in[2];
        2'b11: data_out = data_in[3];
        default: data_out = 4'bxxxx; // Handle invalid selection
    endcase
end

endmodule
