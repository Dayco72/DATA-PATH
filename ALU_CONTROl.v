//Diego Jared Jimenez Silva
// Gael Ramses Alvarado Lomeli

module ALU_CONTROL(
	input [1:0] OP,
	input [5:0] FUNCTION,
	output reg [3:0] OPOUT
);
always @(*) begin
    // Filter
    case (OP)
        1'b00: begin
			OPOUT = 4'b0010;	// LW and SW incomplete (add apparently)
        end
        1'b01: begin
			OPOUT = 4'b0110;	// Branch equal incomplete 
        end
		1'b10: begin
			case(FUNCTION)
				1'b100000:begin // ADD
					OPOUT = 4'b0010;
				end
				1'b100010:begin // SUB
					OPOUT = 4'b0110;
				end
				1'b101010:begin	// SLT
					OPOUT = 4'b0111;
				end
				1'b100101:begin	// OR
					OPOUT =	4'b0001;
				end
				1'b100100:begin	// AND
					OPOUT = 4'b0000;
				end
				1'b000000:begin	// NOP
					OPOUT = 4'b1111;	// Force default case
				end
				defa
		end
    endcase
end
endmodule