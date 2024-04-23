`timescale 1ns / 1ps  // Specify simulation time scale

module testbench_counter_4bit;

// Inputs
reg clk;    // Clock input
reg reset;  // Reset input

// Outputs
wire [3:0] count;  // 4-bit count output

// Instantiate the 4-bit counter module
counter_4bit dut(
    .clk(clk),
    .reset(reset),
    .count(count)
);

// Clock generation
always begin
    clk = 0;
    #5;  // Half clock period
    clk = 1;
    #5;  // Half clock period
end

// Stimulus
initial begin
    $dumpfile("counter_4bit.vcd");  // Dump waveform to a VCD file
    $dumpvars(0, testbench_counter_4bit);  // Dump all variables

    reset = 1;  // Assert reset initially
    #10;       // Wait for a few cycles
    reset = 0;  // De-assert reset

    // Wait for 20 clock cycles to observe the count
    #100;

    $finish;  // End simulation
end

endmodule
