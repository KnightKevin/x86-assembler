# x86 从实模式到保护模式学习

## 技术栈

1. nasm 2.15.05
2. VirtualBox

## 目录结构介绍

```shell

.
|-- build.sh   # 编译脚本
|-- log        # 学习日志
|   `-- 1 xxx.md
|-- out        # 编译后的二进制文件目录
|   `-- 4-2.bin
|-- readme.md 
|-- src        # 源码目录
|   `-- 4-2.asm
`-- tools      # 相关工具
    |-- HexView.exe # 二进制文件阅读器
    |-- blank.vhd   # 虚拟硬盘
    `-- fixvhdwr.exe # VHD虚拟硬盘写入工具

```
