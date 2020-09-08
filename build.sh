#!/bin/bash

file_path=$1

file_name=${1/src\//}

file_name_without_suffix=${file_name/\.asm/}

out_file_name="./out/${file_name_without_suffix}.bin"

echo "file path is ${file_path}"

echo "file name is ${file_name}"

echo "out file name is ${out_file_name}"

nasm -f bin $file_path -o $out_file_name