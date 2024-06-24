typedef enum logic [3:0] {
    ADD=0, SUB=1, SLL=2, SLT=3, SLTU=4, XOR=5, SRL=6, SRA=7,OR=8, AND=9,
    //ADDI=10, XORI=13, ORI=14, ANDI=15, SLLI=16, SLTI=11, SRLI=17, SRAI=18, SLTIU=12, 
    BEQ=10, BNE=11, BLT=12, BGE=13, BLTU=14, BGEU=15, ERR = 4'bxxxx
    //LB=16, LH=17, LW=18, LBU=19, LHU=20, LW=21, SB=22, SH=23, SW=24 (just add)
    } operation_t;


