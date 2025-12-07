.global _start
_start:
    mov x0, 1          // file descriptor stdout
    ldr x1, =msg       // address of message
    ldr x2, =len       // length of message
    mov x8, 64         // syscall write
    svc 0

    mov x8, 93         // syscall exit
    mov x0, 0
    svc 0

.data
msg: .ascii "Hello ARM64\n"
len: .word 12
