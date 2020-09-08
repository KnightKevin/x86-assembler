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

; 求各位上的数据
mov dx,0
div bx
mov [0x700+number+0x00],dl; 保存个位上的数字


infi: jump near infi ;无限循环

number db 0,0,0,0,0

times 203 db 0
          db 0x55,0xaa
