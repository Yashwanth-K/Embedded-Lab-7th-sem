        NAME main
        
        PUBLIC  __iar_program_start
        SECTION datas:CONST(2)

STRING DCB 'ASDFGHJKL'
CPY DS8 20
REV DS8 20

LEN DC32 (CPY - STRING)

 SECTION .intvec:CODE:NOROOT(2)
 
__iar_program_start

main
    LDR R5,LEN
    MOV R6,R5
    LDR R0,=STRING
    MOV R1,R0
    ADD R1,R1,R5
    SUB R1,R1,#1
    
    LDR R2,=CPY
    ADD R2,R2,#2
    LDR R3,=REV
    ADD R3,R3,#2
    
LOOP1 SUBS R5,R5,#1
     BMI LOOP2
     LDRB R4,[R0],#1
     STRB R4,[R2],#1
     B LOOP1
LOOP2 SUBS R6,R6,#1
     BMI LOOP3
     LDRB R4,[R1],#-1
     STRB R4,[R3],#1
     B LOOP2 
LOOP3   
STOP   B STOP
 END