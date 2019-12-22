---
title: C Shell Colorful UI
date: 2019-03-27
tags: [c,shell]
---

# 字符

## Escape Code

| Escape Sequence | Representation |
| --------------- | -------------- |
| \a              | alert          |
| \n              | newline        |
| \t              | Horizontal Tab |
| \v              | Vertical Tab   |
| \',\",\?        | Symbol         |
| \nnn            | ASCII in octal |
| \xhh            | ASCII          |
| \uhhhh          | Unicode        |
| \uhhhhhhhh      | Unicode        |

<!--more-->

## Escape Character

* \e[#m
* \033
* \x1b
* Different format seperated by ;
* (x) if not work in iterm

| Format     | Representation                                        |
| ---------- | ----------------------------------------------------- |
| 0          | Default                                               |
| 1          | Dim                                                   |
| 4          | Underline                                             |
| 5          | Blink (x)                                             |
| 7          | Reverse (invert the foreground and background colors) |
| 8          | Hidden (x)                                            |
| 9          | strikes (x)                                           |
| 20+i       | Reset above values                                    |
| 39         | Default fg color                                      |
| 30+i       | 8 color: Black,R,G,Y,B,M,C,Light gray                 |
| 90+i       | 16 color: Dark gray,lR,lG,lY,lB,lM,lC,W               |
| 38;5;ASCII | 256 color                                             |
| 38;2;R;G;B | RGB color                                             |
| 49         | Default bg color                                      |
| 40+i       | 8 color for bg                                        |
| 100+i      | 16 color for bg                                       |
| 48;5;ASCII | 256 color                                             |
| 48;2;R;G;B | RGB color                                             |

Without m:

| Name | Representation                                            |
| ---- | --------------------------------------------------------- |
| K    | Delete everything from the cursor to the end of the line. |
| 2K   | erases everything written on line before this             |
| nA   | moves cursor n line above                                 |
| nB   | moves cursor n line under                                 |
| nC   | moves cursor n spacing to the right                       |
| nD   | moves cursor n spacing to the left                        |
| s    | save cursor position                                      |
| u    | restore cursor position                                   |
| ?25l | Hide cursor                                               |
| ?25h | Show cursor                                               |
| H    | Move the cursor to the upper-left corner of the screen    |
| r;cH | Move the cursor to row r, column c (Start at 1)           |
| 2J   | Clear the screen                                          |

## 判断是否为终端

* isattr(STDOUT_FILENO)

# 屏幕输入

`<termios.h>` `<unistd.h>`

## tcgetattr

`int tcgetattr(int fd, struct termios *termios_p);`

* struct termios
  * c_iflag 输入模式
  * c_oflag 输出模式
  * c_cflag 控制模式
  * c_lflag 局部模式
    * ECHO 显示字符
    * ICANON 启用特殊字符
  * c_cc 特殊控制字符

## tcsetattr

`int tcsetattr(int fd, int optional_actions, const struct termios *termios_p);`

* STDIN_FILENO: 标准输入
* optional_action:
  * TCSANOW 立即改变
  * TCSADRAIN 当目前输出完成时改变
  * TCSAFLUSH 当目前输入完成时改变并舍弃目前所有输入

```C
void setBufferedInput(bool enable) {
	static bool enabled = true;
	static struct termios old;
	struct termios new;

	if (enable && !enabled) {
		tcsetattr(STDIN_FILENO,TCSANOW,&old);
		enabled = true;
	} else if (!enable && enabled) {
		tcgetattr(STDIN_FILENO,&new);
		old = new;
		new.c_lflag &=(~ICANON & ~ECHO);
		tcsetattr(STDIN_FILENO,TCSANOW,&new);
		enabled = false;
	}
}
```

# 信号处理

`<signal.h>`

## 中断

`<stdint.h>`  
`signal(SIGINT, signal_callback_handler)`

```C
void signal_callback_handler(int signum) {
	printf("         TERMINATED         \n");
	setBufferedInput(true);
	printf("\033[?25h\033[m");
	exit(signum);
}
```

# 时间管控

`<time.h>`

* usleep(ms)

# 获取终端大小

`<sys/ioctl.h>`

* struct winsize w
* ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
* w.ws_row, w.ws_col

# 游戏模型

```C
next_frame = 0;
while (1) {
  while (uptime() < next_frame) ; // 等待一帧的到来
  while ((key = readkey()) != _KEY_NONE) {
    kbd_event(key);         // 处理键盘事件
  }
  game_progress();          // 处理一帧游戏逻辑，更新物体的位置等
  screen_update();          // 重新绘制屏幕
  next_frame += 1000 / FPS; // 计算下一帧的时间
}
```