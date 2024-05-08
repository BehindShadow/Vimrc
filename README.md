# Linux Editor Configuration


## Vim

Vim 文件夹下有两个文件

```sh
.vimrc
.vimrc.orig
```

其中 .vimrc.orig 文件为原始配置，用于 C/C++ 编程

.vimrc 文件为极小的，无插件的，即配即用的 vim 阅读器的配置，便捷无桌面端的服务器配置

将 .vimrc 复制到 ~/ 目录下即可

## Tmux

一个极小的 Tmux 可使用配置文件，优化了样式。

- 未更改默认的按键配置
- 未加入插件

### Usage

将文件拷贝到 ~ 下，键入如下命令生效

```sh
tmux source-file ~/.tmux.conf
```

倘若修改配置文件没有使得 Tmux 界面改变，可能是由于Tmux的后台缓存机制原因，建议键入如下命令

```sh
tmux kill-server
```

复制文本：**shift + 拖动**  Ctrl + C

粘贴：Ctrl + V