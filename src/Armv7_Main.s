// r0–r12  (GPR)
// r13 = sp
// r14 = lr
// r15 = pc

_start:
    mov r0, 1           // stdout
    ldr r1, =msg        // Adresse der Nachricht
    mov r2, 12          // Länge der Nachricht
    mov r8, 64          // syscall write
    svc 0

    ldr r8, [sp, #8]
    add sp, sp, #16

    mov r8, 93          // syscall exit
    mov r0, 0
    svc 0

.data
msg: .ascii "Hello ARM64\n"