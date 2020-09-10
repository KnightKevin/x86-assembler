; 2020-09-09 16:12:00
; 主引导扇区代码，升级版

jmp near start

mytest: db 'L',0x70,'a',0x70,'b',0x70,'e',0x70,'l',0x70,' ',0x70,\
            ':',0x70,'o',0x70,'f',0x70,'f',0x70,'s',0x70,'e',0x70,'t',0x70

number: db 0,0,0,0,0

start:
    ; 设置数据段基址
    mov ax,0x7c0
    mov ds,ax

    ; 设置显卡的文本缓冲区
    mov ax,0xb800
    mov es,ax

    cld ; 设置方向标志
    mov si,mytest ; 设置源数据的地址
    mov di,0 ; 设置目的地址
    mov cx,(number-mytest)/2 ; 设置字的长度
    rep movsw ; 字转移指令

    mov cx,5
    mov ax,number
    mov bx,ax ; 用bx保存偏移地址
    mov si,10

; 将各个位上的数字取出来
digit:
    xor dx,dx
    div si
    mov [bx],dl
    inc bx
    loop digit

    mov bx,number
    mov si,4
show:
; 待完成
    mov al,[bx+si]
    add al,0x30
    mov ah,0x40
    mov [es:di],ax
    add di,2
    dec si
    jns show

    mov word [es:di],0x0744

    jmp near $

times 510-($-$$) db 0
db 0x55,0xaa