###
# @Description:
# @Author: fanshaoqiang
# @Date: 2021-12-13 17:36:36
# @LastEditTime: 2021-12-13 18:03:56
# @LastEditors: fanshaoqiang
###
#! /bin/bash
function read_dir() {
    for file in $(#注意此处这是两个反引号，表示运行系统命令
        ls $1
    ); do
        if [ -d $1"/"$file ]; then #注意此处之间一定要加上空格，否则会报错
            read_dir $1"/"$file
        else

            if [ "${file##*.}"x = "py"x ]; then
                echo $1"/"$file #在此处处理文件即可
                2to3 -f all -w $1"/"$file
            fi
        fi
    done
}
read_dir "./"
