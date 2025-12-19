// Groeße	Load	Store	Register
//-----------------------------------------
// 8 Bit	LDRB	STRB	wX
// 16 Bit	LDRH	STRH	wX
// 32 Bit	LDR	STR	wX
// 64 Bit	LDR	STR	xX

.global _start

f_add:
    // Prolog
    stp x29, x30, [sp, #-16]!   // Stack runter
    mov x29, sp

    add x0, x0, x1

    // Epilog
    ldp x29, x30, [sp], #16
    ret

_start:
    sub sp, sp, #16
    mov x0, #1
    mov x1, #2
    bl f_add             // Ergebnis in x0
    str x0, [sp, #0]

    mov x0, 1           // stdout
    ldr x1, =msg        // Adresse der Nachricht
    mov x2, 12          // Länge der Nachricht
    mov x8, 64          // syscall write
    svc 0

    ldr x8, [sp, #0]
    add sp, sp, #16

    mov x8, 93          // syscall exit
    mov x0, 0
    svc 0

.data
msg: .ascii "Hello ARM64\n"
