typedef enum logic [3:0] {
    ADD=0, SUB=1, SLL=2, SLT=3, SLTU=4, XOR=5, SRL=6, SRA=7,OR=8, AND=9,
    BEQ=10, BNE=11, BLT=12, BGE=13, BLTU=14, BGEU=15, ERR = 4'bxxxx
    } operation_t;


`timescale 1ms/1ns
module tb_top ();
    
    logic [31:0] instruction; //instruction to CPU
    logic [31:0] alu_result;  //numerical/logical output of ALU
    logic ctrl_err, //error flag indicating invalid instruction (not w/in RISC-V 32I), from alu control
        zero_flag, //ALU flag whenever output == 0
        eq_flag, //ALU branch flag used for beq, bge, and bgeu
        less_flag, //ALU flag used for blt, bltu
        err_flag; //ALU flag invalid operation, from ALU

    top CPU(.instruction(instruction), .alu_result(alu_result), .zero_flag(zero_flag), .eq_flag(eq_flag), .less_flag(less_flag), .err_flag(err_flag));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars; 
    
        instruction = 32'b00000000100100010001001100010011;  //slli x6, x2, 9

        #10;

        $display("ALU Result: %d\nctrl err: %b\nzero: %b\neq: %b\nless:%b\nerror:%b", alu_result, ctrl_err, zero_flag, eq_flag, less_flag, err_flag);

    end
    
endmodule

