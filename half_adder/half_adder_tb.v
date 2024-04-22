`timescale 1ns / 1ps  // Specify simulation time scale

module testbench_half_adder;

// Inputs
reg A, B;

// Outputs
wire S, C;

// Instantiate the half adder module
half_adder dut(
    .A(A),
    .B(B),
    .S(S),
    .C(C)
);

// Stimulus
initial begin
    $dumpfile("half_adder.vcd");  // Dump waveform to a VCD file
    $dumpvars(0, testbench_half_adder);  // Dump all variables

    // Test case 1: A=0, B=0
    A = 0; B = 0;
    #10;  // Wait for 10 time units
    // Expected output: S=0, C=0

    // Test case 2: A=0, B=1
    A = 0; B = 1;
    #10;  // Wait for 10 time units
    // Expected output: S=1, C=0

    // Test case 3: A=1, B=0
    A = 1; B = 0;
    #10;  // Wait for 10 time units
    // Expected output: S=1, C=0

    // Test case 4: A=1, B=1
    A = 1; B = 1;
    #10;  // Wait for 10 time units
    // Expected output: S=0, C=1

    $finish;  // End simulation
end

endmodule
