		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		ADR		r0, numbers
		ADR		r3, mask
		ADR		r4, result
		ADR		r5, carry
		
		MOV		r2, #16
		LDR		r6, [r0]
		LDR		r7, [r0, #4]
		LDR		r8, [r3] ;Init mask
		MOV		R10, #0
		MOV		R14, #0
		
loop		AND		r9, r7, r8
		CMP		R14, R9
		ADDmi	R10, R10,	R6
		LSL		R6, R6, #1
done		SUBS		r2, r2, #1
		LSL		r8, r8, #1
		BNE		loop
		Mov		R0, #0
DONE
		
numbers	DCD		0b1100101010010001, 0b1111010101000011
shiftnum	DCD		4
mask		DCD		0x00000001
result	FILL		4
carry	FILL		4
		
		;should	= C211 C8F3
