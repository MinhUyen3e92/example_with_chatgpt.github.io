`timescale 1ns / 1ps

module testbench_moore_fsm;

// Inputs
reg clk;
reg reset;
reg in;

// Outputs
wire out;

// Instantiate the Moore FSM module
moore_fsm dut (
    .clk(clk),
    .reset(reset),
    .in(in),
    .out(out)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    $dumpfile("wf.vcd");
    $dumpvars();
    reset = 1;
    in = 0;
    #10;
    reset = 0;
    #20;
    in = 1; // transition from STATE_A to STATE_B
    #10;
    in = 0; // transition from STATE_B to STATE_A
    #20;
    in = 1; // transition from STATE_A to STATE_B
    #10;
    $finish;
end

endmodule
