`timescale 1ns / 1ps  // Specify simulation time scale

module testbench_full_adder;

// Inputs
reg A, B, Cin;

// Outputs
wire S, Cout;

// Instantiate the full adder module
full_adder dut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
);

// Stimulus
initial begin
    $dumpfile("full_adder.vcd");  // Dump waveform to a VCD file
    $dumpvars(0, testbench_full_adder);  // Dump all variables

    // Test case 1: A=0, B=0, Cin=0
    A = 0; B = 0; Cin = 0;
    #10;  // Wait for 10 time units
    // Expected output: S=0, Cout=0

    // Test case 2: A=0, B=0, Cin=1
    A = 0; B = 0; Cin = 1;
    #10;  // Wait for 10 time units
    // Expected output: S=1, Cout=0

    // Test case 3: A=0, B=1, Cin=0
    A = 0; B = 1; Cin = 0;
    #10;  // Wait for 10 time units
    // Expected output: S=1, Cout=0

    // Test case 4: A=0, B=1, Cin=1
    A = 0; B = 1; Cin = 1;
    #10;  // Wait for 10 time units
    // Expected output: S=0, Cout=1

    // Test case 5: A=1, B=0, Cin=0
    A = 1; B = 0; Cin = 0;
    #10;  // Wait for 10 time units
    // Expected output: S=1, Cout=0

    // Test case 6: A=1, B=0, Cin=1
    A = 1; B = 0; Cin = 1;
    #10;  // Wait for 10 time units
    // Expected output: S=0, Cout=1

    // Test case 7: A=1, B=1, Cin=0
    A = 1; B = 1; Cin = 0;
    #10;  // Wait for 10 time units
    // Expected output: S=0, Cout=1

    // Test case 8: A=1, B=1, Cin=1
    A = 1; B = 1; Cin = 1;
    #10;  // Wait for 10 time units
    // Expected output: S=1, Cout=1

    $finish;  // End simulation
end

endmodule
