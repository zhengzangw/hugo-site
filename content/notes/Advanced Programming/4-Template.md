---
title: Template
date: 2019-02-13
weight: 4
---

## 泛型（类属）

- 类属：一个程序实体能对多种数据进行操作或描述的特性
- 参数化多态（类属）：一段带有类型作为参数的代码，给其提供不同的类型值就能得到多个不同的代码
- 泛型程序设计（类属程序设计 Generic Programming）:一段带有类型作为参数的代码，给其提供不同的类型值就能得到多个不同的代码

## 类属函数

- 采用通用指针类型的参数
- 函数模板
  - 定义了一系列重载函数
  - 实例化：给模板参数提供一个类型作为值，从而生成具体的函数
  - 隐式实例化（模板实参推演）：由编译程序根据函数调用的实参类型自动地把函数模板实例化为具体的函数

```cpp
template <class T1, class T2, ...>
<return_type> <func_name>(<params_list>){
    ...
}
```

- 显示实例化模板：max(int_num, double_num)
  - 显式类型转换
  - 显示实例化：`max<double>(x,m);`
  - 再定义一个 max 的重载函数
- 带非类型参数的模板：使用时必须显示实例化

```cpp
template <class T, int size> //size为一个int型的普通参数
void f(T a)
{
    T temp[size];
}

f<int,10>(1);
```

## 类模板

- 类属类：一个类的成员的类型可变
- 类模板

```cpp
template <class T>
class Stack{
    T buffer[100];
    bool pop(T &x);
};
template <class T>
bool Stack<T>::pop(T &x){}
```

- 类模板实例化序显式指出
- 类模板中的静态成员仅属于实例化后的类（模板类），不同类模板实例之间不共享类模板中的静态成员
- 可带非类型参数
- 类模板友元

```cpp
template <class T> class A;
template <class T> void f3(A<T>& a) { ... }
template class<T>
class A
{ T x,y;
  ......
  friend void f1(A<T>& a); //友元f1不是模板！
  template <class T1> friend void f2(A<T1>& a); //f2与A多对多实例化
  friend void f3<T>(A<T>& a); //f3与A一对一实例化(用相同参数类型)
};
void f1(A<int>& a) { ... }
template <class T> void f2(A<T>& a) {...}
......
A<int> a1; //实例化A<int>
A<double> a2; //实例化A<double>
f1(a1); //OK，调用f1(A<int>&)
f1(a2); //链接错误! 调用f1(A<double>&)，但它不存在！
f2(a1); //实例f2<int>是A<int>和A<double>的友元
f2(a2); //实例f2<double>是A<int>和A<double>的友元
f3(a1); //实例f3<int>是A<int>的友元，但不是A<double>的友元！
f3(a2); //实例f3<double>是A<double>的友元，但不是A<int>的友元！
```

- 实例化一定要见到相应的源代码，否则无法实例化：把模板的定义和实现都放在头文件中

## 模板复用

- STL(Standarad Template Library): 实现了数据结构和算法的复用，大部分以模板形式给出
  - 容器类模板：序列化存储
  - 算法（函数）模板
  - 迭代器模板：抽象的指针功能；迭代器是容器和算法之间的桥梁

### 容器

- `vector<type>`
- `basic_string<type>`
  - string = `basic_string<char>`
  - wstring = `basic_string<wchar_t>`
- `list<type>`
- `deque<type>`
  - `stack<type>`
  - `queue<type>`
- `priority_queue<type>`
- `map<key_type, value_type>`
- `multimap<key_type, value_type>`
  - 每个元素是 pair 类型
- `set<type>`
- `multiset<type>`

### 容器操作

```cpp
T& front();
T& back();
void push_front(const T& x);
void pop_front();
void push_back(const T& x);
void pop_back();
void push(const T& x);
void pop();
T& top();
iterator begin();
iterator end();
iterator insert(iterator pos, const T&x );
iterator insert(iterator pos, InputIt first, InputIt last);
iterator erase(iterator pos);
iterator erase(iterator first, iterator last);
T& operator[](size_type pos);
ValueType& operator[](const KeyType& key);
T& at(size_type pos); //越界检查
iterator find(const T& key);
```

- 如果容器元素为类则可能需要
  - 自定义拷贝构造函数和赋值操作符重载函数，因为在对容器进行的操作中可能会创建新的元素（对象，拷贝构造）或进行元素间的赋值
  - 重载小于操作符（<），以适应容器的一些操作（如排序）所需要的元素比较运算

### 迭代器

- input/output - forward - bidirectional - random-access

| 迭代器           | 修改 | 读取 | \*  | ->  | ++  | ==, != | --  | Others             |
| ---------------- | ---- | ---- | --- | --- | --- | ------ | --- | ------------------ |
| 输出迭代器 OutIt | ✔    |      | ✔   | ✔   | ✔   |        |     |                    |
| 输入迭代器 InIt  |      | ✔    | ✔   | ✔   | ✔   | ✔      |     |                    |
| 前向迭代器 FwdIt | ✔    | ✔    | ✔   | ✔   | ✔   | ✔      |     |                    |
| 双向迭代器 BidIt | ✔    | ✔    | ✔   | ✔   | ✔   | ✔      | ✔   |                    |
| 随机迭代器 RanIt | ✔    | ✔    | ✔   | ✔   | ✔   | ✔      | ✔   | [],+=,-=,<,>,<=,>= |

- vector, deque, basic_string: RanIt
- list, map, set: BidIt
- const_iterator: 不能修改

### 算法

- 自定义操作条件
  - Pred 一元谓词
  - BinPred 二元谓词
  - Op/Fun 一元操作
  - BinIp/BinFun 二元操作

```cpp
//调序算法
void sort(RanIt first, RandIt last); //<
void sort(RanIt first, RandIt last, BinPred less);
//编辑算法
OutIt copy(InIt src_first, InIt src_last, OutIt dst_first);
//查找算法
//算术算法
size_t count_if(InIt first, InIt last, Pred cond);
//集合算法
//堆算法
//元素遍历算法
Fun for_each(InIt first, InIt last, Fun f);
T accumulate(InIt first, InIt last, T val); //+
T accumulate(InIt first, InIt last, T val, BinOp op);
OutIt transform(InIt src_first, InIt src_last, OutIt dst_first, Op f);
OutIt transform(InIt1 src_first1, InIt1 src_last1, InIt2 src_first2, OutIt dst_first, BinOp f);
//lambda 表达式
count_if(students.begin(),students.end(),[](Student &st) { return (st.get_major() == COMPUTER) && (st.get_sex() == FEMALE); });
```