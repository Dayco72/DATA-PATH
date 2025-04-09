// Diego Jared Jimenez Silva
// Gael Ramses Alvarado Lomelí

module CTRL(
	input [4:0] IN,    		// Entrada de 2 bits
	output reg WE,     		// Salida del banco de registros (declarada como reg para uso en always)
	output reg W,      		// Escritura de MemDatos
	output reg R,       	// Lectura de MemDatos
	output reg [1:0] OPCTRL	// Salida a ALU CONTROl
);

always @(*) begin
	// Decodificador
	case (IN)
		// TIPO R
		2'b00: begin
			WE = 1'b1;      // Escribimos en el banco de registros
			W = 1'b0;       // No utilizamos MemDatos
			R = 1'b0;       // No utilizamos MemDatos
			ALUOP = 2'b10; 	// Mandamos la instrucción a la ALU
		end

		// TIPO I
		2'b01: begin
			WE = 1'b1;
			W = 1'b0;
			R = 1'b0;
			ALUOP = 2'b00; 
		end

		// TIPO J
		2'b10: begin
			WE = 1'b1;
			W = 1'b0;
			R = 1'b0;
			ALUOP = 2'b01;   
		end
	endcase
end
endmodule