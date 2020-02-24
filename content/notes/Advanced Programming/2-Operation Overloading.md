---
title: Operation Overloading
date: 2019-02-12
weight: 2
---

## 操作符重载

- 只能重载 C++语言中已有的操作符
  - 不可臆造新的操作符
  - 不能改变操作数个数
  - 不改变原操作符的优先级和结合性
- 可以重载 C++中除下列操作符外的所有操作符：`. .* ?: :: sizeof`
- 重载方法

  - 类的非静态成员函数

  ```cpp
  class Complex
  {
      public:
        Complex operator + (const Complex &x) const{
            Complex temp;
            temp.real = real + x.real;
            temp.imag = imag + x.imag;
            return temp;
        }
  };
  ```

  - 全局函数

  ```cpp
  class Complex
  {
    friend Complex operator +(const Complex &c1, const Complex &c2);
  };
  Complex operator + (const Complex &c1, const Complex &c2){
    Complex temp;
    temp.real = real + x.real;
    temp.imag = imag + x.imag;
    return temp;
  };
  ```

## 特殊操作符的重载

### ++ --

```cpp
class Counter
{
    int value;
    public:
    Counter() { value = 0; }
    Counter& operator ++() //前置++
    {
        value++;
        return *this;
    }
    const Counter operator ++(int)//后置++
    {
        Counter temp = *this;
        ++(*this);
        return temp;
    }
};
```

### =

- 隐式赋值操作符重载函数：逐个成员进行赋值操作
  - 普通成员：赋值
  - 成员对象：调用成员对象赋值操作重载函数进行赋值
  - 基类对象：调用基类的赋值操作符重载函数进行赋值

```cpp
class A
{
    A& operator = (const A& a){
        if (&a == this) return *this;
        delete []p;
        p = new char[strlen(a.p)+1];
        strcpy(p, a.p);
        x = a.x; y = a.y;
        return *this;
    }
};
```

- 赋值操作符只能作为非静态的成员函数来重载，不能被继承
- 一般来讲，需要自定义拷贝构造函数的类通常也需要自定义赋值操作符重载函数

### []

```cpp
Vector &operator[] (int i){ return p_data[i]; } //左值
Vector operator[] (int i) const { return p_data[i]; } //右值
```

### new & delete

- new
  - 为动态对象分配空间
  - 调用对象类的构造函数
  - 操作符 new 必须作为静态的成员函数来重载（static 可以省略）
- delete
  - 调用对象类的析构函数
  - 释放动态对象的空间
  - 操作符 delete 必须作为静态的成员函数来重载（static 可以省略）
- new[] 函数的参数 size 的实际值比对象数组需要的空间多 4 个字节，用于系统管理

```cpp
void *operator new(size_t size){ //size_t = unsigned int
    void *p = malloc(size);
    memset(p, 0, size);
    return p;
}
void *operator new(size_t size, ...); //... 为其它参数
p = new (...) A(...); //带其它参数的 new 构造方法

void operator delete(void *p, size_t size); //第二个参数可选

void *operator new[](size_t size);
void operator delete[](void *p);
```

### ()

- 函数调用也作为一种操作符来看待：操作数为函数名以及各个实参
- 函数调用操作符重载主要用于只有一个操作的对象（函数对象，functor），该对象除了具有一般函数的行为外，它还可以拥有状态
- λ 表达式通过函数对象来实现

### 间接类成员访问操作符 ->

- 双目操作符，第一个操作数为一个指向类或结构的指针，第二个操作数为第一个操作数所指向的类或结构的成员
- 以单目操作符形式定义
- 实现智能指针

```cpp
class B  //智能指针类
{
    A *p_a;
    int count;
public:
    B(A *p) {
        p_a = p; count = 0;
    }
    A *operator ->()  //操作符“->”的重载函数
    {
        count++;  return p_a;
    }
    int num_of_a_access() const{
        return count;
    }
};
```

### 类型转换操作符

- 类中带一个参数的构造函数可以用作从其它类型到该类的转换
  - 通过给 A 类的构造函数 A(int i) 加上一个修饰符 explicit，禁止把它当作隐式类型转换符来用
- 自定义类型转换，从一个类转换成其它类型

```cpp
class A
{
    int x,y;
    public:
        operator int() { return x+y; }
};
```

## 表达式

- 常量表达式（表达式中不含变量）在编译期间可确定其值；
- 算术表达式的值通常是一个整数或小数，具体类型由表达式中操作数的类型决定，一般存储在内存的- 临时空间里（前缀自增/自减操作的结果存储在操作数中）；
- 关系或逻辑表达式的值一般也是存储在内存的临时空间里，要么为“真”（true，计算机中用1存储），要么为“假”（false，计算机中用0存储）；
- 赋值表达式的值一般存储在左边的操作数中；
- 条件表达式的值是第二个或第三个子表达式的值，一般存储在内存的临时空间里；
- 整个逗号表达式的值是最后一个子表达式的值，一般存储在内存的临时空间里（比如 a=3\*5, a\*4 这个逗号表达式的值为60，a为15）
- 操作符的副作用：左边必须是左值表达式
  - 赋值操作符
  - 自增/自减操作符