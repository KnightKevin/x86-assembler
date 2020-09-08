; 这段带主要是往内存的显存区域中放入字符
mov ax,0xb800
mov ds,ax

; 书中是没有加byte的，是有问题的
; 因为须要告诉操作数的尺寸
mov byte [0x00],'a'
mov byte [0x02],'s'
mov byte [0x04],'m'
jmp $

times 510-($-$$) db 0
db 0x55,0xaa