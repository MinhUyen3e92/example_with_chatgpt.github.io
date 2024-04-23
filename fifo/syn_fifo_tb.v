`timescale 1ns / 1ps

module testbench_synchronous_fifo;

// Inputs
reg clk;
reg rst;
reg write_en;
reg [7:0] data_in;
reg read_en;

// Outputs
wire full, empty;
wire [7:0] data_out;

// Instantiate the synchronous FIFO module
syn_fifo dut(
    .clk(clk),
    .rst(rst),
    .write_en(write_en),
    .data_in(data_in),
    .full(full),
    .empty(empty),
    .read_en(read_en),
    .data_out(data_out)
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
    // Reset sequence
    rst = 1;
    write_en = 0;
    read_en = 0;
    data_in = 8'h00;
    #10;
    rst = 0;
    #10;

    // Write data to FIFO
    write_en = 1;
    repeat(17) begin
        data_in = $random;
        #10;
    end
    write_en = 0;

    // Read data from FIFO
    read_en = 1;
    repeat(17) begin
        #15;
    end
    read_en = 0;

    // Finish simulation
    #10;
    $finish;
end

endmodule
