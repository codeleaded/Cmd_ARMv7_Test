// Groeße	Load	Store	Register
//-----------------------------------------
// 8 Bit	LDRB	STRB	wX
// 16 Bit	LDRH	STRH	wX
// 32 Bit	LDR	STR	wX
// 64 Bit	LDR	STR	xX

.global _start






.global _start
.global add

// STP fp, lr, [sp, #-SIZE]!
// MOV fp, sp
// 
// Code
// 
// LDP fp, lr, [sp], #SIZE
// RET

add:
    // Prolog
    STP x29, x30, [sp, #-16]!   // Stack runter
    MOV x29, sp

    // c = a + b
    ADD w2, w0, w1              // w2 = a + b

    // lokale Variable c auf Stack
    STR w2, [sp, #0]

    // Rückgabewert laden
    LDR w0, [sp, #0]

    // Epilog
    LDP x29, x30, [sp], #16
    RET

.global func_name    // Exportiert die Funktion
func_name:
    STP x29, x30, [sp, #-16]!   // Prolog: alten Frame Pointer & LR sichern
    MOV x29, sp                 // neuer Frame Pointer

    // --- Funktionskörper hier ---

    LDP x29, x30, [sp], #16     // Epilog: alten FP & LR wiederherstellen
    RET                          // Rückkehr
    
main:
    SUB sp, sp, #16
    MOV w0, #3          // Wert für x
    STR w0, [sp, #0]    // x = 3

    MOV w1, #4          // Wert für y
    STR w1, [sp, #4]    // y = 4

    BL func              // ALIGNMENT FAULT möglich
    ADD sp, sp, #16      // Stack aufräumen
    RET


get:
    ldr r0, [r0]
    bx  lr

_start:
    sub sp, sp, #4
    mov r0, #5
    str r0, [sp]
    mov r0, sp
    bl foo
    add sp, sp, #4


    sub sp, sp, #4      // Platz reservieren
    str r0, [sp]        // a = r0
    ldr r1, [sp]        // r1 = a
    add sp, sp, #4      // Stack aufräumen

    sub sp, sp, #12     //
    str r0, [sp, #0]
    str r1, [sp, #4]
    str r2, [sp, #8]



    mov x0, 1           // stdout
    ldr x1, =msg        // Adresse der Nachricht
    mov x2, 12          // Länge der Nachricht
    mov x8, 64          // syscall write
    svc 0

    mov x8, 93          // syscall exit
    mov x0, 0
    svc 0

.data
msg: .ascii "Hello ARM64\n"
