// UnidadDeControl
module UnidadDeControl (
    input  wire [5:0]  OpCode,
    output reg         MemToReg,
    output reg         MemToWrite,
	output reg         RegWrite,
    output reg [2:0]   ALUOp
);
    always @(*) begin
        // Valores por defecto
        MemToReg  = 1'b0;
        MemToWrite  = 1'b0;
        ALUOp     = 3'b000;
        RegWrite  = 1'b0;
        case (OpCode)
            6'b000000: begin // Instuccion R
                RegWrite = 1'b1;
                ALUOp    = 3'b010;
            end
            default: begin
                // Aquí se pueden agregar otros opcodes
            end
        endcase
    end
endmodule
