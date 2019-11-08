.386
.MODEL     flat, stdCALL
OPTION     casemap :none




include \masm32\include\windows.inc   ; Includes
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc 
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


.DATA  
PrimerNumero DB 1,0
SegundoNumero DB 1,0
Complemento DB 1,0
Complemento2 DB 1,0
input1 DB 0,0
input2 DB 0,0
msMayor DB "es Mayor ",0
msIgual DB "son Iguales",0
msj DB "Ingrese Numero",0
msjsuma DB "suma ",0
msjresta DB "resta ",0
.DATA?
JK DB 50 dup(?)

.CODE 
 
 
Inicio:
main PROC
	INVOKE StdOut, addr msj      ; imprimir Mensaje
invoke StdOut, addr input1     ; Pedir Primer Numero
	invoke StdIn, addr PrimerNumero, 10
	invoke atodw, addr PrimerNumero	
	SUB PrimerNumero,30h
INVOKE StdOut, addr msj
invoke StdOut, addr input2     ; Pedir Segundo Numero
	invoke StdIn, addr SegundoNumero, 10
	invoke atodw, addr SegundoNumero
	SUB SegundoNumero,30h
	XOR AX,AX
	XOR CL,CL
	MOV AL,PrimerNumero
	MOV CL,SegundoNumero
	MOV Complemento,AL
	MOV Complemento2,CL
	MOV BL,Complemento
	CMP BL,Complemento2
	JE MismoNumero
	JG EsMayor
	JP EsMayor1
	
	
	
EsMayor1:
    ADD Complemento2,30h
    INVOKE StdOut, addr msMayor
	INVOKE StdOut, addr Complemento2
	JMP DeNuevo
	
	
MismoNumero:
    INVOKE StdOut, addr msIgual
	JMP DeNuevo
	
	
EsMayor:
	ADD Complemento, 30h
    INVOKE StdOut, addr msMayor
	INVOKE StdOut, addr Complemento
	JMP DeNuevo
	
	
Fin:
	INVOKE ExitProcess,0
	main ENDP
	
	
DeNuevo:
	XOR AX,AX
	XOR CL,CL
	MOV AL,PrimerNumero
	MOV CL,PrimerNumero
	ADD AL,SegundoNumero
	SUB CL,SegundoNumero
	MOV PrimerNumero,AL
	MOV SegundoNumero,CL
	ADD SegundoNumero,30h ;VAloresAscii
	ADD PrimerNumero, 30h 
    INVOKE StdOut, addr msjsuma
	INVOKE StdOut, addr PrimerNumero
    INVOKE StdOut, addr msjresta	
	INVOKE StdOut, addr SegundoNumero
JMP Fin


END Inicio