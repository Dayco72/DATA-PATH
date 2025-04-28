// TB_DPTR.v
module TB_DPTR;
// Parámetro: número de instrucciones en el archivo "datos.txt"
 parameter NUM_INSTR = 10;
 
    reg         clk;
    reg  [31:0] Instr;
    wire        ZF;
	
	// Memoria para almacenar las instrucciones leídas del archivo
  reg [31:0] instr_mem [0:NUM_INSTR-1];


    // Instanciación del datapath
    DPTR dut(
        .clk(clk),
        .Instr(Instr),
        .ZF(ZF)
    );
	integer i;

    initial begin
    clk = 0;
    forever #100 clk = ~clk; //Tiempo para que se procesen los datos devidamente
end
initial begin	
// Esperar un breve lapso para que se inicialicen otros bloques
    #1000;
    // Cargar el archivo binario en la memoria instr_mem
    $readmemb("datos.txt", instr_mem);
	
      // Recorremos las instrucciones una a una
    for (i = 0; i < NUM_INSTR; i = i + 1) begin
      Instr = instr_mem[i];
      // Esperar tiempo suficiente para que la instrucción se ejecute
      #1000;
    end
    
    $stop;
  end
  
endmodule

    

