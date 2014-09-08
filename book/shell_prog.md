---
layout: book
title: 轻触 shell 脚本编程
---

可以把很多命令直接流水账式的存放到一个文件中，Shell 可以把这个文件作为一个脚本来执行，这样我一次就可以干很多事情了。

举个例子，要准备一个 rails 程序的运行环境，需要在 Linux 系统上作很多工作。我可以把这些任务都罗列到脚本中 <https://gist.github.com/happypeter/5187692> 一劳永逸。

但是仅仅排队执行还是很有局限的。其实 shell 也可以支持各种循环嵌套和条件控制机制，使用了这些机制，脚本能够完成的任务就更加强大和灵活了。这就是 shell 脚本编程。

作为一名系统管理员，脚本编程的功夫必须要足够硬。但是作为编程开发者我不建议大家系统的学习 shell 编程。多年以来我只是感觉每多学一个技巧就能在命令行的使用中多一份高效。所以这里我把我觉得最最最常用的技巧总结为八个小点来跟你一一分享。


# 指定解析器

我现在使用的 shell 叫做 bash，要写的脚本是 bash 脚本。每个 bash 脚本的第一行都应该这样写

    #!/usr/bin/env bash

告诉命令行，用 bash 的语法来解析下面的语句。如果机器上安装了 ruby 或者 python，这样我也可以用这两种语言来写脚本，这样第一行就应该是

    #!/usr/bin/env ruby

或

    #!/usr/bin/env python

# 命令就是语句，语句就是命令

可以把语句直接罗列到脚本中，每一个命令都是合法的脚本语句。也可以把很多语句包裹到一个函数中

    #!/usr/bin/env bash
    say_hello()
    {
      echo "hello"
    }
    say_hello # 呼叫执行

所以说“命令就是语句”。

另一方面，有些元素一般都是出现在脚本中作为语句的一部分出现的

    if [ $# != 1 ]
    then
      echo "hello"
    fi

例如上面的 `[ $# != 1 ]` 其实也是可以放到命令行里直接执行的

    $[ $# != 1 ]
    $ echo $?
    0

查看返回值为 0 表示命令执行成功。也就是 if 后面只有跟一个正确执行的命令，例如

    if ls

if 都会认为条件为真，而如果跟一个执行会出错误的命令

    $ ls shit # shit 是一个不存在的位置
    $ echo $？
    2

这样 `if ls shit` 会被认为条件为伪。这个跟一般的编程语言中 0 为 false，非0为 true 是正好相反的。如果不理解“语句就是命令”就会感觉奇怪。

# 位置参数：

有几个变量很重要，先来执行下面的脚本

    #!/usr/bin/env bash
    echo "
    Number of arguments: $#
    The program name is: $0
    The first argument is: $1
    "

`$#` 代表命令执行的时候，一共有几个参数。 $0 代表命令名，$1 代码第一个参数，$2 代表第二个参数，以此类推。位置参数在编程中是极为常用的，尤其是 $1，稍后会有例子。

# 脚本不在当前 shell 里执行

而是另起一个当前 shell 的子 shell

当前 shell 里导出一个环境变量

    $ export DIR="/home/"

脚本中不能使用。例如脚本中

    cd $DIR

是不能成功的。如果脚本写成

    export DIR="/home/"
    cd $DIR

./peter.sh 是可以成功的，但是是在脚本自己执行的那个 shell 里进行了 cd，我们当前的这个 shell 没有任何变化。

如果想让 shell 脚本中的语句在当前 shell 中执行，要使用

    $ source xxx.sh

# 循环控制：

  cd $1
  echo Hey now I am in `pwd`
  for file in `ls`
  do
    mv $file $file.txt
  done


# 远程执行

   ssh -t 'touch aa'

实际例子 <https://gist.github.com/happypeter/4f6425afa7527e433cb6>

# 确认执行

  #!/usr/bin/env bash

  echo -n "Want to say hello? (Y/n): "
  read AAA
  if [ "${AAA:-y}" = "y" ];then
      echo hello
  else
      echo Nothing done, bye.
  fi

实际例子：https://gist.github.com/happypeter/4248241


# 其他语言也可以写脚本

shell 脚本的语法很机器化，很多细节可以说是晦涩。对于使用 ruby，perl 或者 python 的开发者，也可以用自己喜欢的语言来写脚本。
LGCB 这本书的转换 pdf 的工作最早是用 bash 脚本，现在开始用 ruby 重写了。

比如 happygrep 项目最早是一个脚本：xxx，但是后来用 C 语言重写了。

好，更多学习资源参考 TLCL 的 shell 编程的相关章节。

