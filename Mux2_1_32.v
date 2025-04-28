// Mux2_1_32.v
module Mux2_1_32 (
    input  wire [31:0] entrada0,   // opción 0
    input  wire [31:0] entrada1,   // opción 1
    input  wire        sel,        // selector
    output reg [31:0] salida      // resultado
);
     always @(*) begin
     salida = sel ? entrada1 : entrada0;
	 end
endmodule
