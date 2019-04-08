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
		
		MOV		r2, #8
		LDR		r6, [r0]
		LDR		r7, [r0, #4]
		LDR		r8, [r3]
		MOV		R10, #0
		
loop		AND		r9, r7, r8
		ADD		R10, r10, r6, LSL r9
done		SUBS		r2, r2, #1
		LSL		r8, r8, #4
		BNE		loop
		
numbers	DCD		0b1100101010010001, 0b1111010101000011
shiftnum	DCD		4
mask		DCD		0x0000000F
result	FILL		4
carry	FILL		4
