module mux_2to1(
    input [1:0] data_in,  // Two input data lines
    input sel,            // Selection control signal
    output reg data_out   // Output data line
);

always @(*) begin
    if (sel == 0)
        data_out = data_in[0];
    else
        data_out = data_in[1];
end

endmodule
