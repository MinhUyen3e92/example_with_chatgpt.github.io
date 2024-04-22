module full_adder(
    input A, 
    input B, 
    input Cin,
    output S, 
    output Cout
);

assign S = A ^ B ^ Cin;  // XOR operation for sum
assign Cout = (A & B) | (B & Cin) | (A & Cin);  // OR operation for carry out

endmodule
