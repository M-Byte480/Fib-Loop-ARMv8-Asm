.globl   fib_asm
    .p2align 2
	.type    fib_asm,%function

fib_asm:

	cmp		x0, xzr
	bge		label_1
	mov		x0, #-1
	b		end_label

label_1:
	cmp		x0, #20
	ble		label_2
	mov		x0, #-1
	b		end_label

label_2:
	cmp		x0, #2
	bge		label_3
	b		end_label

label_3:
	nop
// Your Fibonacci sequence code goes here
//		x10 = i
	mov x10, #2
// 	x11, x12, x13 are a, b, c respectivelly
	mov x11, #0 // a
	mov x12, #1 // b
	mov x13, #0 // c

loop: 	// For loop(i = 2, i <= an, i++)
	cmp x10, x0
	bgt return_value
	add x13, x11, x12
	mov x11, x12
	mov x12, x13
	add x10, x10, #1
	b loop

return_value:
	mov x0, x12 // return b

end_label:		// Return from the function
	br		x30
