#!/usr/bin/env bash

name='ysw'
#变量名外面的花括号是可选的，加不加都行，加花括号是为了帮助解释器识别变量的边界
echo name
echo 'my name is ${name}'
echo "my name is ${name}"

#使用 readonly 命令可以将变量定义为只读变量，只读变量的值不能被改变。
readonly name
#使用 unset 命令可以删除变量。
haha="haha"
unset haha
echo
echo ${haha}

#变量类型
#运行shell时，会同时存在三种变量：
#1) 局部变量 局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量。
#2) 环境变量 所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量。
#3) shell变量 shell变量是由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些变量保证了shell的正常运行

#单引号字符串的限制：
#单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
#单引号字串中不能出现单引号（对单引号使用转义符后也不行）。
#双引号的优点：
#双引号里可以有变量
#双引号里可以出现转义字符

#获取字符串长度
name2="fsfs"
echo ${#name2}

#截取字符, 从第3个开始截取2个
str="0123456789"
echo ${str:3:2}

#数组
array=(sda fsdff dasd dadada  dasada)
echo ${array[1]}
echo ${array[@]}
array_length=${#array[@]}
echo $array_length



#传入参数
#$0表示文件名
echo "要执行的脚本名：$0"
echo "请输入名字：$1"
#传入参数个数
echo "你输入了$#个参数"
# 全部参数
echo "你输入了$*个参数"
echo "你输入了$@个参数"
echo "你输入了$-个参数"
echo "你输入了$?个参数"
for i in "$@"
do
    echo $i
done
for i in "$*"
do
    echo $i
done


#运算符
echo "两数相加 = `expr $1 + $2`"
echo "两数相减 = `expr $1 - $2`"
echo "两数相乘 = `expr $1 \* $2`"
echo "两数相除 = `expr $1 / $2`"

#read 读取标准输入一行
read str1
echo $str1

#显示换行
echo -e "OK! \n" # -e 开启转义
echo "It it a test"
#显示不换行
echo -e "OK! \c" # -e 开启转义 \c 不换行
echo "It is a test"

#显示日期
echo `date`

#shell 流程控制
if condition1
then
    command1
elif condition2
then
    command2
else
    commandN
fi

for var in item1 item2 ... itemN
do
    command1
    command2
    ...
    commandN
done

while condition
do
    command
done

case $x in
1)
   cmd
   cmd;;
esac