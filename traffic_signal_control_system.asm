
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc'
msg_print macro arg1
    mov dx,offset arg1
    mov ah,09h
    int 21h
endm

org 100h  
.data
n db 0
m1 db "  Choose Traffic Condition to Simulate $"
m2 db "1. Accident at vertical Victoria Street $"
m3 db "2. Road Works at horizontal Holt Street $"  
m4 db "3. Normal Road Condition $"
m5 db "4. Traffic Signal Malfunction $"
m6 db "5. Exit $"
m7 db "Enter your choice (1/2/3/4/5): $"


; add your code here
.code  
;main proc
#start=Traffic_Lights.exe#

name "traffic"

l:     
printn
msg_print m1
printn 
printn
msg_print m2
printn
msg_print m3
printn
msg_print m4 
printn
msg_print m5
printn 
msg_print m6
printn
printn 
msg_print m7

call scan_num
mov n,cl
;mov [bx],cx
cmp n,3 
je l1
cmp n,2
je l2
cmp n,1
je l3
cmp n,4
je l4
cmp n,5
je exit  

l1:   ;Normal Race Condition

mov bl,4

mov ax, all_red
out 4, ax


mov si, offset situation


next:
mov ax, [si]
out 4, ax

; wait 5 seconds (5 million microseconds)
mov     cx, 4Ch    ;    004C4B40h = 5,000,000
mov     dx, 4B40h
mov     ah, 86h
int     15h


add si, 2 ; next situation 
cmp si, sit_end
jb  next
sub bl,1  
cmp bl,0
je l 

mov si, offset situation
jmp next


;                        FEDC_BA98_7654_3210
situation        dw      0000_0011_0000_1100b
s1               dw      0000_0010_1000_1010b
s2               dw      0000_1000_0110_0001b
s3               dw      0000_0100_0101_0001b
sit_end = $


all_red          equ     0000_0010_0100_1001b 


l2:     ;road work at horizontal street
mov bl,4

mov ax, all_red
out 4, ax


mov si, offset situatio


nex:
mov ax, [si]
out 4, ax

; wait 5 seconds (5 million microseconds)
mov     cx, 4Ch    ;    004C4B40h = 5,000,000
mov     dx, 4B40h
mov     ah, 86h
int     15h


add si, 2 ; next situation
cmp si, sit_en
jb  nex
sub bl,1  
cmp bl,0
je l
mov si, offset situatio
jmp nex

 

;                        FEDC_BA98_7654_3210
situatio          dw      0000_0011_0000_1100b
sa1               dw      0000_0010_1000_1010b
sa2               dw      0000_1000_0100_1001b
sa4               dw      0000_0100_0100_1001b
sit_en = $



all_red          equ     0000_0010_0100_1001b 


l3:            ;accident at vertical street
mov bl,4

mov ax, all_red
out 4, ax


mov si, offset situat


ne:
mov ax, [si]
out 4, ax

; wait 5 seconds (5 million microseconds)
mov     cx, 4Ch    ;    004C4B40h = 5,000,000
mov     dx, 4B40h
mov     ah, 86h
int     15h


add si, 2 ; next situation
cmp si, sit_e
jb  ne
sub bl,1  
cmp bl,0
je l
mov si, offset situat
jmp ne

 

;                        FEDC_BA98_7654_3210
situat            dw      0000_0010_0100_1100b
se1               dw      0000_0010_0100_1010b
se2               dw      0000_1000_0110_0001b
se3               dw      0000_0100_0101_0001b
sit_e = $



all_red          equ     0000_0010_0100_1001b 

l4:          ;traffic malfunction
mov bl,4

mov ax, all_red
out 4, ax


mov si, offset situa


net:
mov ax, [si]
out 4, ax

; wait 5 seconds (5 million microseconds)
mov     cx, 4Ch    ;    004C4B40h = 5,000,000
mov     dx, 4B40h
mov     ah, 86h
int     15h


add si, 2 ; next situation
cmp si, site
jb  net
sub bl,1  
cmp bl,0
je l
mov si, offset situa
jmp net

 

;                        FEDC_BA98_7654_3210
situa             dw     0000_0101_0001_0010b
e1               dw      0000_0100_0100_1010b
e2               dw      0000_0011_0010_0010b
e3               dw      0000_0101_0001_0100b
site = $



all_red          equ     0000_0010_0100_1001b 

exit:
ret

define_scan_num
define_print_num_uns
end




