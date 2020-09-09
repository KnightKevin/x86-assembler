; 5-1.asm
; 主引导扇区代码

mov ax,0xb800 ;指向文本模式的显存缓冲区
mov es,ax

mov byte [es:0x00],'L'
mov byte [es:0x01],0x07
mov byte [es:0x02],'a'
mov byte [es:0x03],0x07
mov byte [es:0x04],'b'
mov byte [es:0x05],0x07
mov byte [es:0x06],'e'
mov byte [es:0x07],0x07
mov byte [es:0x08],'l'

mov ax,number  ; 取得标号number的偏移地址
mov bx,10

; 因为该代码没有单独设置数据都安，所以设置数据段的基地址，只是为了方便构建数据地址而已，
; 不过我觉得这个作者有点画蛇添足，老老实实按照
; 要求设置数据段就好了
mov cx,cs
mov ds,cx

; 求个位上的数据
mov dx,0
div bx
mov [0x7c00+number+0x00],dl; 保存个位上的数字

; 求十位上的数字
xor dx,dx  ; 作用就是清零，不使用mov dx,0的原因是因为，xor的写法占用空间少，而且源数据和目的数都是寄存器，所以会非常快
div bx
mov [0x7c00+number+0x01],dl; 保存十位上的数字

; 求百位上的数字
xor dx,dx
div bx
mov [0x7c00+number+0x02],dl

; 求千位上的数字
xor dx,dx
div bx
mov [0x7c00+number+0x03],dl

; 求万位上的数字
xor dx,dx
div bx
mov [0x7c00+number+0x04],dl


; 转换成十进制对应的ascii码
mov al,[0x7c00+number+0x04]
add al,0x30
mov [es:0x1a],al
mov byte [es:0x1b],0x04

mov al,[0x7c00+number+0x03]
add al,0x30
mov [es:0x1c],al
mov byte [es:0x1d],0x04

mov al,[0x7c00+number+0x02]
add al,0x30
mov [es:0x1e],al
mov byte [es:0x1f],0x04

mov al,[0x7c00+number+0x01]
add al,0x30
mov [es:0x20],al
mov byte [es:0x21],0x04

mov al,[0x7c00+number+0x00]
add al,0x30
mov [es:0x22],al
mov byte [es:0x23],0x04

infi: jmp near infi ;无限循环

number: db 0,0,0,0,0

times 510-($-$$) db 0
          db 0x55,0xaa
