module half_adder(
    input A, 
    input B, 
    output S, 
    output C
);

assign S = A ^ B;  // XOR operation for sum
assign C = A & B;  // AND operation for carry

endmodule
