		;		ARM Programming Assignment #1: Capitalizer
		;
		;		Write a program that goes through the characters in chars,
		;		and Capitalizes every lower-case letter that it finds..
		;		Write the number of capitalizations the program performed
		;		In the caps "fill" memory provided.
		
		;		Your code here
		ADR		r0, chars
		ADR		r1, caps
		ADR		r2, lowera
		ADR		r3, lowerz
		ADR		r4, upper
		LDR		r5, [r2]		;load 'a' into r5
		LDR		r6, [r4]		;load 'A' into r6
		LDR		r7, [r3]		;load 'z' into r7
		SUB		r2, r5, r6  ;Set offset of a and A
		
		LDR		r3, [r0]
		LDR		r4, [r1]
		MOV		r8, #11
		MOV		r9, #0	;Set counter to 0
		
loop		LDR		r3, [R0]
		CMP		r3, r5	;Check if r3 is less than 'a'
		Bmi		done		; Branch if it is
		CMP		r3, r7	; Check if r3 is greater than 'z'
		BGT		done
		SUB		r3, r3, r2
		ADD		r9, r9, #1
done		SUBS		r8, r8, #1
		STR		r3, [r0], #4
		BNE		loop
		END
		
		
lowera	DCD		'a'
lowerz	DCD		'z'
upper	DCD		'A'
chars	DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
caps		FILL		4
