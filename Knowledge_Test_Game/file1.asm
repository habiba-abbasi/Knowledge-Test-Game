.model small
.stack 100h

.data
game db "*********************KNOWLEDGE-TEST GAME*********************",10,13,"$"
rule1 db "=>RULES:",10,13,"1. In the game Your Vocabulary will be judged by the 15 words you guess.",10,13,"Each word is a name of something common from a different field.",10,13,"$"
rule2 db "2. Each word will rather increase or decrease your score by 1.",10,13,"On th right guess it will increase and on the wrong it will decrease.",10,13,"$"
rule3 db "3. In the End of test your knowledge will be justified in words.",10,13,"The total marks will be 15.",10,13,"$"
rule4 db "4. According to the marks you can judge your common knowledge and Improve.$"
clear db 10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,10,13,"$"
press db 10,13,10,13,"Press C to Countinue!$"

filename db "c:\Giraffe.txt"
filename1 db "c:\Australia.txt"
filename2 db "c:\Dhaka.txt"
filename3 db "c:\Pixel.txt"
filename4 db "c:\Rugby.txt"
filename5 db "c:\Sapodilla.txt"
filename6 db "c:\Candela.txt"
filename7 db "c:\Amazone.txt"
filename8 db "c:\Miraje.txt"
filename9 db "c:\Charcoal.txt"
filename10 db "c:\Facebook.txt"
filename11 db "c:\Bay.txt"
filename12 db "c:\Turkey.txt"
filename13 db "c:\Macaw.txt"
filename14 db "c:\Bicycle.txt"
buffer db 512 dup(0)
handle dw ?
coun db 0
count dw 7
openerr db 0AH,0AH,"OPEN ERROR - CODE "
errcode db 30h,"$"
cont db ?
var db 20 dup(?)
var1 db 'g','i','r','a','f','f','e'
var2 db 'a','u','s','t','r','a','l','i','a'
var3 db 'd','h','a','k','a'
var4 db 'p','i','x','e','l'
var5 db 'r','u','g','b','y'
var6 db 's','p','a','d','i','l','l','a'
var7 db 'c','a','n','d','e','l','a'
var8 db 'a','m','a','z','o','n','e'
var9 db 'm','i','r','a','g','e'
var10 db 'c','h','a','r','c','o','a','l'
var11 db 'f','a','c','e','b','o','o','k'
var12 db 'b','a','y'
var13 db 't','u','r','k','e','y'
var14 db 'm','a','c','a','w'
var15 db 'b','i','c','y','c','l','e'

score dw 0
wr db 10,13,"Wrong!$"
rr db 10,13,"Right!$"
input db 20 dup(?)
result db 10,13,"Marks Obtained: $"
masg db 10,13,"You need to gain knowledge!$"
masg2 db 10,13,"You have normal knowledge!$"
masg3 db 10,13,"You are good!$"
masg4 db 10,13,"You are Brilliant!$"
last db 10,13,"*******************THE END********************$"

.code

main proc

mov ax,@data
mov ds,ax
mov es,ax



lea dx,game
mov ah,9
int 21h

lea dx,rule1
int 21h
lea dx,rule2
int 21h
lea dx,rule3
int 21h
lea dx,rule4
int 21h
Pro_loop:

lea dx,press
int 21h


mov ah,1
int 21h
mov al,0
mov ah,9
lea dx,clear
int 21h


cmp coun,0
jne L1
lea dx,filename
mov di,0
Push di
Call Copy1 
jmp L16
L1:
cmp coun,1
jne L2
lea dx,filename1
mov di,1
Push di
Call Copy1
mov count,9 
jmp L16
L2:
cmp coun,2
jne L3
lea dx,filename2
mov di,2
Push di

Call Copy1
mov count,5 
jmp L16
L3:
cmp coun,3
jne L4
lea dx,filename3
mov di,3
Push di
Call Copy1
mov count,5 
jmp L16
L4:
cmp coun,4
jne L5
lea dx,filename4
mov di,4
Push di
Call Copy1
mov count,5 
jmp L16
L5:
cmp coun,5
jne L6
lea dx,filename5
mov di,5
Push di
Call Copy1
mov count,9 
jmp L16
L6:
cmp coun,6
jne L7
lea dx,filename6
mov di,6
Push di
Call Copy1
mov count,7 
jmp L16
L7:
cmp coun,7
jne L8
lea dx,filename7
mov di,7
Push di
Call Copy1
mov count,7 
jmp L16
L8:
cmp coun,8
jne L9
lea dx,filename8
mov di,8
Push di
Call Copy1
mov count,6 
jmp L16
L9:
cmp coun,9
jne L10
lea dx,filename9
mov di,9
Push di
Call Copy1
mov count,8 
jmp L16
L10:
cmp coun,10
jne L11
lea dx,filename10
mov di,10
Push di
Call Copy1
mov count,8 
jmp L16
L11:
cmp coun,11
jne L12
lea dx,filename11
mov di,11
Push di
Call Copy1
mov count,3 
jmp L16
L12:
cmp coun,12
jne L13
lea dx,filename12
mov di,12
Push di
Call Copy1
mov count,6
jmp L16
L13:
cmp coun,13
jne L14
lea dx,filename13
mov di,13
Push di
Call Copy1
mov count,6 
jmp L16
L14:
cmp coun,14
jne L16
lea dx,filename14
mov di,14
Push di
Call Copy1
mov count,7 
jmp L16

L16:
cmp coun,15
je exit

mov al,0 
call open 
jc open_error
mov handle,ax

read_loop:

lea dx,buffer
mov bx,handle
call read
or ax,ax
je clos
mov cx,ax
call display

jmp read_loop
open_error:
lea dx,openerr
add errcode,al
mov ah,9
int 21h

clos:
mov bx,handle
call close

mov cx,count
Call inp
mov si,0
mov cx,count
Comp_loop:
mov bl,var1[si]
cmp bl,input[si]
jne wrong
inc si
loop Comp_loop
right:
mov ah,9
lea dx,rr
int 21h
add score,1
jmp next

wrong:
mov ah,9
lea dx,wr
int 21h
sub score,1

next:
add coun,1
jmp Pro_loop

exit:
mov ah,9
lea dx,clear
int 21h

lea dx,result
int 21h
mov ax,score
Call outdec
cmp score,7
jle M1
jg M2
M1:
lea dx,masg
jmp show
M2:
cmp score,12
jle M3
jg M4
M3:
lea dx, masg2
jmp show
M4:
cmp score,15
jne M5
M5:
lea dx,masg3
jmp show
lea dx,masg4
show:
mov ah,9
int 21h
lea dx,last
int 21h

mov ah,4ch
int 21h
main endp

open proc near
mov ah,3DH
mov al,0 
int 21h
ret
open endp

read proc near
push cx
mov ah,3FH
mov cx,512
int 21h
pop cx
ret
read endp

display proc near
push bx
mov ah,40H
mov bx,1 
int 21h
pop bx
ret
display endp

close proc near
mov ah,3EH
int 21h
ret
close endp

inp proc
mov cx,count
mov si,0
in_loop:
mov ah,1
int 21h
mov input[si],al
inc si
loop in_loop
mov input[si],'$'
ret
inp endp
outdec proc

     push ax
     push bx
     push cx
     push dx
     
     mov cx,0
     cmp ax,0
     jge else_label

     push ax
     mov ah,2
     mov dl,'-'
     int 21h
     pop ax
     neg ax

    else_label:
        mov bx,10
        mov dx,0
        div bx
        push dx
        inc cx
        cmp ax,0
             jne else_label

       mov ah,2
      print_label:
          pop dx
          add dx,30h
          int 21h

         loop print_label

   pop dx
   pop cx
   pop bx
   pop ax


 ret
 outdec endp

Copy1 proc
pop ax
mov si,0
cmp ax,0
jne n1
mov cx,lengthof var1
j1:
mov ah,2
mov dl,byte ptr var1[Si]
mov var[si],dl
int 21h
inc si
 Loop j1
n1:
cmp ax,1
jne n2
mov cx,lengthof var2
j2:
mov ah,2
mov dl,byte ptr var2[Si]
mov var[si],dl
int 21h
inc si
 Loop j2

n2:
cmp ax,2
jne n3
mov cx,lengthof var3
j3:
mov ah,2
mov dl,byte ptr var3[Si]
mov var[si],dl
int 21h
inc si
 Loop j3

n3:
cmp ax,3
jne n4
mov cx,lengthof var4
j4:
mov ah,2
mov dl,byte ptr var4[Si]
mov var[si],dl
int 21h
inc si
 Loop j4
n4:
cmp ax,4
jne n5
mov cx,lengthof var5
j5:
mov ah,2
mov dl,byte ptr var5[Si]
mov var[si],dl
int 21h
inc si
 Loop j5

n5:
cmp ax,5
jne n6
mov cx,lengthof var6
j6:
mov ah,2
mov dl,byte ptr var6[Si]
mov var[si],dl
int 21h
inc si
 Loop j6

n6:
cmp ax,6
jne n7
mov cx,lengthof var7
j7:
mov ah,2
mov dl,byte ptr var7[Si]
mov var[si],dl
int 21h
inc si
 Loop j7

n7:
cmp ax,7
jne n8
mov cx,lengthof var8
j8:
mov ah,2
mov dl,byte ptr var8[Si]
mov var[si],dl
int 21h
inc si
 Loop j8

n8:
cmp ax,8
jne n9
mov cx,lengthof var9
j9:
mov ah,2
mov dl,byte ptr var9[Si]
mov var[si],dl
int 21h
inc si
 Loop j9

n9:
cmp ax,9
jne n10
mov cx,lengthof var10
j10:
mov ah,2
mov dl,byte ptr var10[Si]
mov var[si],dl
int 21h
inc si
 Loop j10

n10:
cmp ax,10
jne n11
mov cx,lengthof var11
j11:
mov ah,2
mov dl,byte ptr var11[Si]
mov var[si],dl
int 21h
inc si
 Loop j11

n11:
cmp ax,11
jne n12
mov cx,lengthof var12
j12:
mov ah,2
mov dl,byte ptr var12[Si]
mov var[si],dl
int 21h
inc si
 Loop j12

n12:
cmp ax,12
jne n13
mov cx,lengthof var13
j13:
mov ah,2
mov dl,byte ptr var13[Si]
mov var[si],dl
int 21h
inc si
 Loop j13

n13:
cmp ax,13
jne n14
mov cx,lengthof var14
j14:
mov ah,2
mov dl,byte ptr var14[Si]
mov var[si],dl
int 21h
inc si
 Loop j14

n14:
cmp ax,14
jne return
mov cx,lengthof var15
j15:
mov ah,2
mov dl,byte ptr var15[Si]
mov var[si],dl
int 21h
inc si
 Loop j15
return:
ret
Copy1 endp

end main