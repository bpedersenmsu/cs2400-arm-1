		;		ARM Programming Assignment #1: 32 bit multiplier
		;
		;		Write a 32-bit multiplier.
		;		Use the standard shift-and-add operation.
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
		ADR		r0, numbers
		ADR		r1, mask
		ADR		r2, maskone
		ADR		r3, masktwo
		
		LDR		r4, [r0]
		LDR		r5, [r0, #4]
		LDR		r6, [r1] ;mask
		LDR		r7, [r2]
		LDR		r8, [r3]
		
		AND		r0, r4, r7
		AND		r1, r4, r8
		AND		r2, r5, r7
		AND		r3, r5, r8
		LSR		r1, r1, #16
		LSR		r3, r3, #16
		
		ADR		R4, temp
		Mov		r14, #0
		
domult	CMP		r14, #0
		Bmi		domult2
		BGT		domult2
		ADD		r7, r0, #0 ; Set up value to be multiplied
		ADD		r8, r2, #0 ; Set up multiplier
		B		multiply
domult2	CMP		r14, #4
		Bmi		domult3
		BGT		domult3
		ADD		r7, r1, #0 ; Set up value to be multiplied
		ADD		r8, r2, #0 ; Set up multiplier
		B		multiply
domult3	CMP		r14, #8
		Bmi		domult4
		BGT		domult4
		ADD		r7, r0, #0 ; Set up value to be multiplied
		ADD		r8, r3, #0 ; Set up multiplier
		B		multiply
domult4	CMP		r14, #12
		Bmi		finish
		BGT		finish
		ADD		r7, r1, #0 ; Set up value to be multiplied
		ADD		r8, r3, #0 ; Set up multiplier
		B		multiply
multiply	MOV		r9, r6 ; Set up Mask
		MOV		r10, #16
		MOV		r11, #0
		MOV		r12, #0
loop		AND		r5, r8, r9
		CMP		R12, R5
		ADDmi	R11, R11,	R7
		LSL		R7, R7, #1
done		SUBS		r10, r10, #1
		LSL		r9, r9, #1
		BNE		loop
		STR		R11, [r4, r14]
		ADD		R14, R14, #4
		B		domult
finish	ADR		r2, maskone
		ADR		r3, masktwo
		ADR		r14, temp
		LDR		r7, [r2]
		LDR		r8, [r3]
		LDR		r4, [r14]
		LDR		r5, [r14, #4]
		LDR		r6, [r14, #8]
		AND		r9, r5, r7
		AND		r10, r5, r8
		AND		r11, r6, r7
		AND		r12, r6, r8
		LSR		r10, r10, #16
		LSR		r12, r12, #16
		LSL		r9, r9, #16
		LSL		r11, r11, #16
		LDR		r8, [r14, #12]
		MOV		r0, #0
		MOV		r1, #0
		ADDs		r1, r8, r10
		ADDs		r1, r1, r12
		ADDs		r0, r4, r9
		ADDCC	r1, r1, #1
		ADDs		r0, r0, r11
		ADDCC	r1, r1, #1
		STR		R0, [r14, #16] ; Store 1st 32bits
		STR		R1, [r14, #24] ; Store 2nd 32bits
		
		
		
		
DONE
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA
mask		DCD		0x00000001
maskone	DCD		0x0000FFFF
masktwo	DCD		0xFFFF0000
shiftnum	DCD		8
result	FILL		8
carry	FILL		4
temp		FILL		4
