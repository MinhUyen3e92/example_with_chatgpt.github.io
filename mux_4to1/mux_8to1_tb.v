`timescale 1ns / 1ps  // Specify simulation time scale

module testbench_mux_8to1;

// Inputs
reg [7:0] data_in;  // Four input data lines
reg [2:0] sel;      // Selection control signal

// Output
wire data_out;      // Output data line

// Instantiate the 4-to-1 multiplexer module
mux_8to1 dut(
    .data_in(data_in),
    .sel(sel),
    .data_out(data_out)
);

// Stimulus
initial begin
    $dumpfile("mux_8to1.vcd");  // Dump waveform to a VCD file
    $dumpvars(0, testbench_mux_8to1);  // Dump all variables

    // Test case 1: sel=00, data_in[0]=1, data_in[1]=0, data_in[2]=0, data_in[3]=0
    sel = 3'b000;
    data_in = 8'b1000_0000;
    #10;  // Wait for 10 time units
    // Expected output: data_out = data_in[0] = 1

    // Test case 2: sel=01, data_in[0]=0, data_in[1]=1, data_in[2]=0, data_in[3]=0
    sel = 3'b001;
    data_in = 8'b0000_0010;
    #10;  // Wait for 10 time units
    // Expected output: data_out = data_in[1] = 1

    // Test case 3: sel=10, data_in[0]=0, data_in[1]=0, data_in[2]=1, data_in[3]=0
    sel = 3'b010;
    data_in = 8'b0000_0010;
    #10;  // Wait for 10 time units
    // Expected output: data_out = data_in[2] = 1

    // Test case 4: sel=11, data_in[0]=0, data_in[1]=0, data_in[2]=0, data_in[3]=1
    sel = 3'b011;
    data_in = 8'b0000_1000;
    #10;  // Wait for 10 time units
    // Expected output: data_out = data_in[3] = 1

    $finish;  // End simulation
end

endmodule
