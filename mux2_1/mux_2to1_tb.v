`timescale 1ns / 1ps  // Specify simulation time scale

module testbench_mux_2to1;

// Inputs
reg [1:0] data_in;  // Two input data lines
reg sel;            // Selection control signal

// Output
wire data_out;      // Output data line

// Instantiate the 2:1 multiplexer module
mux_2to1 dut(
    .data_in(data_in),
    .sel(sel),
    .data_out(data_out)
);

// Stimulus
initial begin
    $dumpfile("mux_2to1.vcd");  // Dump waveform to a VCD file
    $dumpvars(0, testbench_mux_2to1);  // Dump all variables

    // Test case 1: sel=0, data_in[0]=0, data_in[1]=1
    sel = 0;
    data_in = 2'b01;
    #10;  // Wait for 10 time units
    // Expected output: data_out = data_in[0] = 0

    // Test case 2: sel=1, data_in[0]=1, data_in[1]=0
    sel = 1;
    data_in = 2'b10;
    #10;  // Wait for 10 time units
    // Expected output: data_out = data_in[1] = 0

    $finish;  // End simulation
end

endmodule
