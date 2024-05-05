TITLE PGM4_1: ECHO PROGRAM 
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    ; Display prompt
    MOV AH, 02H   ; Display character function
    MOV DL, '?'; Character is '?'
    INT 21H       ; Display it

    ; Input a character
    MOV AH, 01H   ; Read character function
    INT 21H; Character in AL
    MOV BL, Al; Save it in BL

    ; Go to a new line
    MOV AH, 02H   ; Display character function
    MOV DL, 0DH   ; Carriage return
    INT 21H; Execute carriage return
    MOV DL, 0AH   ; Line feed
    INT 21h; Execute line feed

    ; Display the character
    CALL DISPLAY

    ; Return to DOS
    MOV AH, 4CH   ; Set AH to 4C (DOS exit function)
    INT 21H       ; Exit to DOS
MAIN ENDP

DISPLAY PROC
    MOV DL, BL; Retrieve character from BL
    INT 21H       ; Display character
    RET; Return to calling procedure
DISPLAY ENDP

END MAIN