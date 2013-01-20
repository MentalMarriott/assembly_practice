.ORIG	X3000			;SET ORIGIN

				;R0 CONTAINS VALUE TO COUNT 1'S
				;R1 CONTAINS NUMBER OF ONES
				;LOOP 16 TIMES AS 16 BITS 

LD	R6, MASK		;LOADS FIRST MASK INTO R6
LD 	R5, LOOP_TOTAL		;LOOP THIS NUMBER OF TIMES

LOOP
AND	R4, R0, R6		;COMPARES MASK TO FIRST BIT IN R0
BRz	NOT_ONE			;IF RESULT IS 0 THEN MOVE ON TO DOUBLING MASK THEN TRY AGAIN
ADD	R1, R1, #1		;ADDS 1 TO THE COUNT OF ONES STORED IN R1
 
NOT_ONE
ADD 	R6, R6, R6		;ADDS R6 TO R6 (DOUBLES VALUE IN IT)
BRp	LOOP
		
MASK		.FILL		x0001	;SETS MASK THAT WILL BE USED TO COUND 1'S
LOOP_TOTAL	.FILL		X0010

.END
