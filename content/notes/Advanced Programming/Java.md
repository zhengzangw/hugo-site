---
title: Java 
date: 2018-09-06
tags: [java]
---

## 示例代码

```java
// HelloWorld
public class HelloWorld{
    public static void main(String[] args){
        System.out.println("Hello World!")
    }
}
```

<!--more-->

```java
// A+B
import java.io.*;
import java.util.*;

public class Main
{
    public static void main(String args[]) throws Exception
    {
        Scanner cin=new Scanner(System.in);
        int a=cin.nextInt();
        int b=cin.nextInt();
        System.out.println(a+b);
    }
}
```

## Java 1.2 语法基础

* 基本类型--包装器
  * BigInteger, BigDecimal
  * 对象储存在堆中
  * 基本类型储存在栈中
  * 包装器对象无法改变
  * (java5) 自动装包/拆包
* array
  * 可在运行中确定大小
* .java 文件中的每个类，它们都有一个 .class 扩展名

```java
int[] a = new int[100];
int[] a = new int[] {1, 3, 5, 7, 9};
int[] a = {1, 3, 5, 7, 9}
int[][][] a2 = new int[2][2][4];
```

* 构造函数
  * this()
  * super()
* finalize()
* 基本数据初始化为0，对象引用初始化为 null
* 类中可定义初始值
  * 成员必须初始化
  * 先静态，再变量初始化，再构造函数
* 静态块与匿名内部类初始化
* protected 它本身是私有的，但可由从这个类继承的任何东西或者同一个包内的其他任何东西访问
* 单个编译单元内的所有类相互间都是自动“友好”的
  * 包访问权限
* 类只能 public 或 友好的
  * 不愿他人访问：所有构造器设为 private, 用 static 初始化
* 组合与继承
* toString(): 非基本对象都有
* 向上转换：子类引用转为父类引用
* final
  * 基本数据类型：常数
  * 对象引用：不可更改
  * final 函数：继承类不可修改
  * final class: 不可继承
* java 程序加载过程
  * 递归找到基类
  * 从基类开始初始化 static
  * 创建对象
    * 基本数据类型：默认值
    * 对象引用：null
  * 从基类开始按序初始化实例对象
  * 执行构造器剩余主体部分
* 绑定
  * java 后期绑定
  * final 前期绑定

```java
Shape s = new Circle();
s.draw()  //circle's draw
```

* 覆盖与重载
* abstract 类
* interface
  * 不规定方法主体
  * 可以 extends 其它接口
  * 自动拥有 final static
    * 不能是空白 final，但可以初始化成非常数表达式
* 内部类
* 向下转换
  * RTTI
* switch: char,int,enum

## Java 5

* 可变参数 `(type... name)`
  * `int... data`
* foreach 循环：`for (int x:data)`
* 泛型：`Collection<String> c=new ArrayList<String>()`
  * Java中的泛型，只在编译阶段有效
  * 泛型类 `public class Name<T>`
  * 泛型接口
  * 泛型通配符 `<?>`
  * 泛型方法：public 与返回值之间的`<T>`必不可少，这表明这是一个泛型方法，并且声明了一个泛型T
  * `<A extends Number>`
* Enum
  * values()
  * valueOf()

```Java
enum Signal {  
    GREEN, YELLOW, RED  
}

public enum Color {  
    RED("红色", 1), GREEN("绿色", 2), BLANK("白色", 3), YELLO("黄色", 4);  
    // 成员变量
    // 构造方法  
    // 普通方法  
    // get set 方法  
}
```

* 注解：`@interface`
  * 使用 `@name`
  * 元注解
    * `@Retention`
      * `RetentionPolicy.SOURCE`
      * `RetentionPolicy.CLASS`
      * `RetentionPolicy.RUNTIME`
    * `@Documented`
    * `@Target`
    * `@Inherited`
    * `@Repeatable`
  * 属性
    * `int id();`
    * `int id() default -1;`
  * 赋值方式：在括号内 `value=2`
  * 使用
    * `Name.class.isAnnotationPresent(Annotationclass.class)`
    * `getAnnotation`
  * `import static`
* 集合类
  * Arrays
  * Queue
    * `Queue q = new LinkList();`
    * offer, poll

## 集合类

* Legacy
  * Vector
    * size()
    * addElement()
    * elementAt()
    * elements(): 返回迭代器
  * Bitset
  * Stack
  * Hashtable
  * 迭代器
    * Enumeration
      * nextElement()
      * hasMoreElements()
* Collection
  * List 顺序
    * ArrayList
    * LinkedList
      * addFirst()，addLast()，getFirst()，getLast()，removeFirst(),removeLast()
  * Set
    * 内部对象必须定义 equals()
    * HashSet
    * TreeSet
    * ArraySet
* Map
  * HashMap
  * ArrayMap
  * TreeMap
* Comparable
  * Comparator

### Collection 方法

* boolean add(Object) ＊保证集合内包含了参数。如果它没有添加参数，就返回false（假）
* boolean addAll(Collection) ＊添加参数内的所有元素。如果没有添加元素，则返回true（真）
* void clear() ＊删除集合内的所有元素
* boolean contains(Object) 若集合包含参数，就返回“真”
* boolean containsAll(Collection) 若集合包含了参数内的所有元素，就返回“真”
* boolean isEmpty() 若集合内没有元素，就返回“真”
* Iterator iterator() 返回一个迭代器，以用它遍历集合的各元素
* boolean remove(Object) ＊如参数在集合里，就删除那个元素的一个实例。如果已进行了删除，就返回“真”
* boolean removeAll(Collection) ＊删除参数里的所有元素。如果已进行了任何删除，就返回“真”
* boolean retainAll(Collection) ＊只保留包含在一个参数里的元素（一个理论的“交集”）。如果已进行了任何改变，就返回“真”
* int size() 返回集合内的元素数量
* Object[] toArray() 返回包含了集合内所有元素的一个数组

### List 方法

* get()
* indexof()
* lastIndexOf()
* listIterator()
* set()

## IO

* InputStream (Reader:InputStreamReader)
  * ByteArrayInputStream (CharArrayReader)
  * StringBufferInputStream (StringReader)
    * int read()
  * StringBuffer
  * FileInputStream (FileReader)
  * PipedInputStream (PipeReader)
  * SequenceInputStream
  * FilterInputStream (FilterReader)
    * DataInputStream
      * -readLine()
      * available()
    * BufferedInputStream (BufferedReader:readLine())
    * LineNumberInputStream (LineNumberInputReader)
    * PushBackInputStream (PushBackReader)
  * InflaterInputStream
    * CheckedInputStream
    * ZipInputStream
    * GZIPInputStream
* OutputStream (Writer:OutputStreamWriter)
  * ByteArrayOutputStream (CharArrayWriter)
  * FileOutputStream (FileWriter)
  * PipedOutputStream (PipeWriter)
  * FilterOutputStream
  * FilterInputStream (FilterWriter)
    * DataOutputStream
      * writeBytes()
      * writeDouble()
    * BufferedOutputStream (BufferedWriter)
    * OutputStream
    * PrintStream (PrintWriter)
  * DeflaterOutputStream
    * CheckedOutputStream
    * ZipOutputStream
    * GZIPOutputStream
* RandomAccessFile
* StreamTokenizer
  * StringTokenizer
* System
  * in: InputStream
  * out: PrintStream
  * err: PrintStream
  * setIn/setOut/setErr
  * (java5) Scanner
    * nextLine()
    * hasNext()

## Java 7

* 多个异常： `catch (ExceptionA | ExceptionB a)`
* try-with-resource

## Lamdba 表达式 (Java 8)

* (parameters) -> expression
* (parameters) ->{ statements; }

## Clone

* clone()
* clonable 接口

## Class

* instanceof

## 注释文档

* /** */
* 支持 HTML
* @see
* class
  * @version
  * @author
* method
  * @param
  * @return
  * @exception
  * @deprecated

## 命令行工具

* 编译`javac name.java; java name`
* 命令行请求 public 类时，调用的是 main()

## Thread

* synchronized
* wait()
* notify()
* Thread
  * run(): 需要重写
  * start()
  * yield()
  * join()
* Runnable
* (Java5) java.util.concurrent
  * ThreadLocal
  * AtomicInteger
  * Lock
    * ReentrantLock
    * ReentrantReadWriteLock.ReadLock
    * ReentrantReadWriteLock.WriteLock
  * BlockingQueue
  * ConcurrentHashMap
  * ThreadPoolExecutor
    * corePoolSize: 核心池的大小
    * maximumPoolSize
    * KeepAliveTime
    * ExecutorService
      * Executors.newCachedThreadPool()
      * Executors.newFixedThreadPool(3)
      * Executors.newScheduledThreadPool(5);
      * Executors.newSingleThreadExecutor();

## 网络

* InetAddress.getByName()
  * InetAddress.getByName(null); localhost
* ServerSocket
* Socket