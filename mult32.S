		;		ARM Programming Assignment #1: 32 bit multiplier
		;
		;		Write a 32-bit multiplier.
		;		Use the standard shift-and-add operation.
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
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA
shiftnum	DCD		8
mask		DCD		0x0000000F
result	FILL		4
carry	FILL		4
