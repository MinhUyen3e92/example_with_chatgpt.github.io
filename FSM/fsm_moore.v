module moore_fsm (
    input clk,          // Clock input
    input reset,        // Reset input
    input in,           // Input signal
    output reg out      // Output signal
);

// Define states
parameter STATE_A = 2'b00;
parameter STATE_B = 2'b01;

// Define state register
reg [1:0] state;

// Moore output logic
always @(state) begin
    case (state)
        STATE_A: out = 1;  // Output is 1 in state A
        STATE_B: out = 0;  // Output is 0 in state B
        default: out = 1;  // Default output
    endcase
end

// Next state logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= STATE_A;  // Reset to initial state
    end else begin
        case (state)
            STATE_A: state <= in ? STATE_B : STATE_A;  // Transition to state B on input 1
            STATE_B: state <= in ? STATE_B : STATE_A;  // Transition to state A on input 0
            default: state <= STATE_A;  // Default transition
        endcase
    end
end

endmodule
