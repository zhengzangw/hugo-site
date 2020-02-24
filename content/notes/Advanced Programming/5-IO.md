---
title: I/O
date: 2019-02-13
weight: 5
---

## I/O

- 输入输出基于字节流
- 过程式：printf, scanf
  - 不是强类型，不利于类型检查，会导致类型相关的运行错误
  - 当格式串描述与数据不一致时会导致运行时刻的错误
- 面向对象：cout, cin, <<, >>
- ios
  - istream 控制台输入
    - ifstream 文件输入
    - istrstream 字符串输入
  - ostream
    - ofstream
    - ostrstream
  - iostream
    - fstream
    - strstream

## 面向控制台 I/O

- 预定义 I/O 对象
  - cin(istream)
  - cout(ostream)
  - cerr(ostream) 不带缓冲
  - clog(ostream) 带缓冲
- 操纵符 `<iomanip>`

| 操纵符                    | 含义                                      |
| ------------------------- | ----------------------------------------- |
| endl                      | 输出换行符并 flush                        |
| flush                     | 输出缓存立刻输出                          |
| dec                       | 10                                        |
| oct                       | 8                                         |
| hex                       | 16                                        |
| setprecision(int n)       | 设置浮点数的精度                          |
| setiosflags(long flags)   | 设置输出格式，ios::scientific, ios::fixed |
| resetiosflags(long flags) | 取消输出格式                              |

- 浮点数输出格式为 ios::scientific 或 ios::fixed 时，setprecision 设置浮点数小数点后面的位数
- 输出格式为自动或两者都有时，setprecision 设置有效数字个数
- 字节流输出

```cpp
ostream& ostream::put(char ch);
cout.put('A');
ostream& ostream::write(const char *p, int count);
cout.write(a, n);
```

- 控制台输入

  - 在输入的各个数据之间用空白符（空格、\t、\n）分开
    - 输入前先跳过空白符
    - 输入时碰到空白符或当前数据类型不允许的字符结束
  - 操纵符
    - setw(int n): 把输入的字符串和'\0'放入 str 中，最多输入 n-1 个字符
  - 字节流

  ```cpp
    istream::get(char &ch);
    istream::getline(char *p, int count, char delim='\n');//输入一个字符串直到输入了count-1个字符或遇到delim指定的字符为止，并自动加上一个'\0'字符
    istream::read(char *p, int count);
  ```

- 重载输入输出操作符

```cpp
ostream& operator << (ostream& out, const A &a){
    out << a.x;
    return out;
}
```

## 面向文件 I/O

- 在 C++中，把文件看成是由一系列字节所构成的字节串，对文件中数据的操作（输入/输出）通常是逐个字节顺序进行，因此称为流式文件
- 位置指针：每个打开的文件都有一个，指出文件当前读写位置
- 进行读/写操作时，每读入/写出一个字节，文件位置指针会自动往后移动一个字节的位置
- 文件储存方式
  - 文本方式：只包含可显示的字符和有限控制符的编码，一般用于存储具有“行”结构的文本数据
  - 二进制方式：包含任意二进制字节，一般用于存储具有“行”结构的文本数据
- 文件输出

  - 创建 ofstream 类对象

    - 直接方式：`ofstream out_file(<文件名>,<打开方式>);`
    - 间接方式

    ```cpp
    ofstream out_file;
    out_file.open(<文件名>,<打开方式>);
    ```

  - 打开方式

    - ios::out

      打开一个外部文件用于写操作，如果外部文件已存在，则首先把它的内容清除；否则，先创建该外部文件，默认方式

    - ios::app

      打开一个外部文件用于添加（文件位置指针在末尾）操作，如果外部文件不存在，则先创建该外部文件

    - ios::out | ios::binary / ios::app | ios::binary

      按二进制打开，对以文本方式打开的文件，当输出的字符为'\n'时，在某些平台上（如：DOS 和 Windows 平台）将自动转换成'\r'和'\n'两个字符写入外部文件

    ```cpp
    out_file.write((char *)&s1, sizeof(s1));
    ```

  - 判断打开操作是否成功
    - !out_file
    - out_file.fail()
    - !out_file.is_open()
  - 关闭文件：把文件内存缓冲区的内容写到磁盘文件中

- 文件输入

  - 创建 ifstream 类对象

    - 直接方式：`ifstream in_file(<文件名>,<打开方式>);`
    - 间接方式

    ```cpp
    ifstream in_file;
    in_file.open(<文件名>,<打开方式>);
    ```

  - 打开方式

    - ios::in
    - ios::in | ios::binary

      对以文本方式打开的文件，当文件中的字符为连续的'\r'和'\n'时，在某些平台上（如：DOS 和 Windows 平台）将自动转换成一个字符'\n'输入

  - 判断文件是否结束
    - `int ios::eof()`：0 当且仅当文件位置指针在文件末尾，并且继续去读文件内容
    - `int ios::fail()`

- 文件输入输出
  - 创建 fstream 类对象
- 文件随机存储

```cpp
istream& istream::seekg(<位置>); //绝对位置
istream& istream::seekg(<偏移量>,<参照位置>); //指定相对位置
streampos istream::tellg(); //获取指针位置
ostream& ostream::seekg(<位置>); //绝对位置
ostream& ostream::seekg(<偏移量>,<参照位置>); //指定相对位置
streampos ostream::tellg(); //获取指针位置
//参照位置
ios::beg //文件头
ios::cur //当前位置
ios::end //文件尾
```
