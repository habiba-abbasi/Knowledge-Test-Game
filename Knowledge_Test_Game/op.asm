.Model small
.stack 100h
.data

error db "Error Found$"
error1 db " close Error Found$"
error2 db " readError Found$"
msg db "This is our file$"
buffer db 512 dup (0)
fname db 30 dup (0)
handle dw ?
openerr db 0dh,0ah,"OPEN-ERROR-CODE$"
errorcode db 30h,'$'
prompt db "Enter FileName$"

.code
main proc
mov ax,@data
mov ds,ax
mov es,ax
call get_name
lea dx,fname
mov al,0

call open
jc open_error
mov handle,ax


mov handle,ax ;preserve handle

mov ah,40h
mov bx,handle
mov cx,16
lea dx,msg
int 21h

READ_LOOP:
lea dx,buffer
mov bx,handle
call READ
or Ax,AX
je exit
mov cx,ax
call display
jmp READ_LOOP

open_error:
lea dx,openerr
ADD errorcode,AL
MOV AH,9
int 21h
EXIT:
MOV BX,handle
Call close
mov ah,4ch
int 21h

main endp

get_name proc
push ax
push dx
push di
mov ah,9
lea dx,prompt
int 21h
cld
lea di,fname
mov ah,1

read_name:
int 21h
cmp al,0dh
je done
stosb
jmp read_name

done:
mov al,0
stosb
pop di
pop dx
pop ax
RET

get_name endp

READ proc near 
push cx
mov ah,3fh
mov cx,512
int 21h
pop cx
RET
READ endp

DISPLAY proc near
push bx 
mov ah,40h
mov bx,1
int 21h
pop bx
RET
DISPLAY endp

OPEN proc near
mov ah,3dh
mov al,0
int 21h
RET
OPEN endp

CLOSE proc near
mov ah,3eh
int 21h
RET
CLOSE endp

end main