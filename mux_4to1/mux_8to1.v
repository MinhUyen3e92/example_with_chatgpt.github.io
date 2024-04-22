`include "./mux_4to1.v"
module mux_8to1(
    input [7:0] data_in,   // Four input data lines
    input [2:0] sel,       // Selection control signal (2 bits for 4 inputs)
    output data_out    // Output data line
);

wire o1, o2;
assign data_out = sel[2]? o2 : o1;
mux_4to1 mux1(data_in[3:0], sel[1:0], o1);
mux_4to1 mux2(data_in[7:4], sel[1:0], o2);


endmodule