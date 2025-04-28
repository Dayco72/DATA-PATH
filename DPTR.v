// DPTR.v
module DPTR (
    input  wire        clk,
    input  wire [31:0] Instr,
    output wire        ZF
);
    // Campos de instrucción
    wire [5:0]  OpCode = Instr[31:26];
    wire [4:0]  rs     = Instr[25:21];
    wire [4:0]  rt     = Instr[20:16];
    wire [4:0]  rd     = Instr[15:11];
    wire [5:0]  funct  = Instr[5:0];

    // Señales de control
    wire MemToReg, MemToWrite, RegWrite;
    wire [2:0]  ALUOp;

    // Buses internos

    wire [31:0] C1, C2, C3, C5, WriteData;
    wire [2:0]  C4;
 
   

    // Instanciación de módulos
    UnidadDeControl UC(
        .OpCode(OpCode),
        .MemToReg(MemToReg),
        .MemToWrite(MemToWrite),
        .ALUOp(ALUOp),
        .RegWrite(RegWrite)
    );

    BancoReg BR(
        .clk(clk),
        .RegEn(RegWrite),
        .ReadReg1(rs),
        .ReadReg2(rt),
        .WriteReg(rd),
        .WriteData(WriteData),
        .ReadData1(C1),
        .ReadData2(C2)
    );

    ALuControl AC(
        .ALUOp(ALUOp),
        .funct(funct),
        .ALUCtl(C4)
    );

    ALU alu(
        .OP1(C1),
        .OP2(C2),
        .ALUCtl(C4),
        .Res(C3),
        .ZF(ZF)
    );

    MemDatos MD(
	    .clk     (clk),
        .MemToWrite(MemToWrite),
        .Address(C3),
        .WriteData(C2),
        .ReadData(C5)
    );

    Mux2_1_32 MUX(
        .entrada0(C3),
        .entrada1(C5),
        .sel(MemToReg),
        .salida(WriteData)
    );

endmodule
