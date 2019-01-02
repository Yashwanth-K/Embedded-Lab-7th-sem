   NAME MAIN
      SECTION datas:CONST(2)
NUM 
    DC8 0X02,0X07,0X09,0X01
RESULT 
    DS32 1
  PUBLIC __iar_program_start
    SECTION .INTVEC:CODE:NOROOT(2)
__iar_program_start
MAIN
  LDR R0,=NUM
  MOV R5,#04
  MOV R1,#00
  EOR R2,R2,R2
  MOV R10,#10
  
LOOP MOV R7,R1
   MUL R1,R7,R10
   LDRB R4,[R0],#1
   ADD R1,R1,R4
   SUBS R5,R5,#1
   BNE LOOP
   
   STR R1,RESULT
STOP B STOP
  END