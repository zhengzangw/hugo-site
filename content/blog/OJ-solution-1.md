---
title: 编程总结
date: 2018-03-22
tags: [oj, ps]
---

> 程序设计能力=问题的形式化能力+数学模型能力+透视数据组织的能力+算法设计能力+高级语言写作能力

# 2018.3.22 编程

## Problem A Train Problem

模拟栈，注意queue与stack的区别

## Problem D

Trivial

## Problem B

1. 时间复杂度分析：若认为一个包含两重循环的程序是O(n^2)应该要详细论证，考虑周全
2. 单调队列
满足两个操作：Insert;top  
满足两个性质：队列中的值没有过期；队列保持单调（最大值—>递减）  
使用情形：需要在已经访问过的状态中以一定区间范围选择最值。本题中，我们需要的是最小前缀和。
3. 循环问题
加长一倍变为线性
4. std::ios::sync_with_stdio(false);

<!--more-->

## Problem C: Strategic Game

树形dp：

1. 建树：child可用vector，用list循环外删除（防止RE）
2. 审题，看是边还是点

二分图匹配：  
给一颗树，求最小顶点覆盖。  
定理：无向图G为二分图的充分必要条件是,G至少有两个顶点,且其所有回路的长度均为偶数.  
推论：树是二分图  
二分图中，最小顶点覆盖=最大匹配


# 3.29 编程总结

## Crazy Tank

物理题，计算需正确，角度弧度转换，角度取值0到180。遍历角度

## Buildings

贪心

## Physics Experiment

物理题。首先观察得小球碰撞可视为继续运动，只不过向下运动的增加2\*R，向上的减少2\*R（以向下为正方向）。  
但难点是把小球当做质点后，找到增加减少距离的规律。假设原来球i为第i个释放的球，结束时从下向上为第j个球。则其向下穿过了（负数为向上）i-j,增加2R(i-j)。又原先处于H上方2Ri,故2R(i-j)+(-2Ri) = -2Rj。 故只需将最后结果向上移2Rj。

## Game of Connections

卡特兰数+高精度。  
这里尝试了用类实现，但尚不完整。待周末写个高精度数类。

## 总结

这次编程注重数学计算和编程实现能力。

# 4.11 编程总结

## Lining Up

计算几何，枚举即可

## The Castle

将墙转换为与四个方向的连通性，储存在a[][][4]中。搜索即可

## Jurassic Remains

穷举集合子集为指数级，数据量24。可以穷举一半，考虑meet in mid.

首先，原题要求可转换为每种字母总数为偶数，只需奇偶性，故可将字符串转换为01串，两个字符串并等价于两01串异或。位操作基本操作： a|b （合并） a & (1<<j) （取第j位）

其次，穷举子集可能性，也用01串表示取或不取。判断如下：

```c++
for (int j = 0; j < n; j++)
        {
            if (i & (1 << j))
                tmp ^= a[j], count++;
        }
```

因折半，第一部分为0000 -- 1111， 第二部分为00000000 -- 11110000 注意对第二部分的构造。

附核心代码如下：

```C++
int main()
{
    cin >> n;
    for (int i = 0; i < n; i++)
    {
        tmp = 0;
        cin >> s;
        for (int j = 0; j < s.length(); j++)
            tmp ^= (1 << (s[j] - 'A'));
        a[i] = tmp;
    }

    map<int, int> state;
    map<int, int> c;

    for (int i = 0; i < (1 << (n / 2)); i++)
    {
        tmp = 0;
        count = 0;
        for (int j = 0; j < n / 2 + 1; j++)
        {
            if (i & (1 << j))
                tmp ^= a[j], count++;
        }
        if (state.count(tmp) == 0 || c.count(tmp) < count)
        {
            state[tmp] = i;
            c[tmp] = count;
        }
    }

    int ans = 0, index = 0;
    for (int ii = 1; ii < 1 << (n - n / 2); ii++)
    {
        int i = ii << (n / 2);
        tmp = 0;
        count = 0;
        for (int j = 0; j < n; j++)
        {
            if (i & (1 << j))
                tmp ^= a[j], count++;
        }
        if (state.count(tmp))
        {
            ans = max(ans, count + c[tmp]);
            index = i | state[tmp];
        }
    }

    cout << ans << endl;
    bool flag = true;
    for (int i = 0; i < n; i++)
        if (index & (1 << i))
        {
            if (flag)
                cout << i + 1, flag = false;
            else
                cout << ' ' << i + 1;
        }

    return 0;
}
```

## The Troublesome Frog

一直TLE 哭了
一开始用的$(n^2\log n)$的算法，二分，一直超。
后来发现可以开h[5000][5000]......

先排序（在点间定义经典序），枚举两点组合，如果可以从此处开始，则判断是否能成功。

好像有更好的算法（状压）

# 4.18 编程总结

## Probability|Given

Use recursion to calculate $p^n*(1-p)^{m-n}$

## Chocolate

dp[i][j] = dp[i-1][j-1]\*(c-j+1)/c + dp[i-1][j+1]\*(j+1)/c

Special check for j=0 and j=c

Pruning  
n > 1000 : n=1000+(n&1) 中心极限定理  
m>x||m>n||(n+m)&1 : 0.000  
m=n=0 : 1.000  
This is a Gauss Distribution

循环数组利用 ^1

## Football

P(n,j) denotes j exists after j turns  
P(n,j) = sum(P(n-1,j)\*P(n-1,k)\*a[n,j]|k and j are neighbour at turn n)  

To check two number have the same binary representation except the last bit, use a^1==b

Each turn if one team stands, it cut off its last bit.

清数组（多组数据出错）

## Headshot

SHOOT : the probability of 0 after 1
ROTATE : the probability of 1 occurs

# 4.25 编程总结

## Jersey Politics

最小的K个数可以确定。接下来调整使另两个区域成立

* 法一：随机交换两个区域中的元素至相等（需要概率大）
* 法二：搜索+剪枝

<!--more-->

## Matrix Multiplication

* 法一：随机验证C中元素是否正确(定义变量在函数外，scanf都可以加速）
* 法二：行向量X,$X*A*B=C$

## Shuffle

计算所有窗口（共s+n个，2s个长度不为s）是否合法。穷举第一组的长度，判断是否成立。

## Tug of war

* 法一：随机法
  * 随机交换两个队中的元素更新最值
* 法二：状态压缩
  * $dp[w] = dp[w]|(dp[w-arr[i]]<<1)$（dp[w]为二进制表示） 最接近平均值的数的时候还要判断他否可以 n/2 || n/2+1 个人组成

# 5.10 编程总结

## Fence Repair

Haffman Tree, 只需记录权值之和

## Assistance Required

打表

## Largest Rectangle in a Histogram

* DisjointSet
贪心，从高到底合并  
标号排序 sort(ref,ref+n,cmp), cmp:h[a]>h[b]

```C++
For i from 1 to N do
    if (leftone higher than it) s.merge(ref[i],ref[i]+1)
    if (rightone higher than it) s.merge(ref[i],ref[i]+1)
    ans = max(ans,s.getsetlen(ref[i])*h[ref[i]]);
```

* 单调栈  
从左到右压入，出来时累计宽度，保存最值
* 笛卡尔树  
中序index为顺序，value小根堆。由于笛卡尔树相邻节点的index是连续的，以任意节点为根子树是连续的（构成一个区间）。决定大矩形高度的又是极小值，即根。故此题极其适合用小根堆做。

## Tree Grafting

DFS, L(T) = L(T.parent) + whichson(T,T.parent)

    DFS(T,num,L):
        ans = max(ans,L+num);
        whichson = 0;
        For all son:
            whichson+=1
            DFS(son,whichson-1,L+1)

## Apple Tree

DFS序转换子树为区间，BIT解

# 9.13 编程总结

## Problem A: "OJ-oriented" Problem Solving

简化：给定数列{$a_n$},求最少改变几个数可以使其成为严格上升数列。

注意到严格上升序列即数列{$a_n$},$\forall i,j$, a[i]-(i-j+1)<a[j], 即 a[i] - i <= a[j] - j.

原问题化为：给定数列{$a_n-i$},求最少改变几个数可以使其成为非严格上升数列。

找最长不下降序列即可。

## Problem B: 外卖

状态：在已走过集合S中的宿舍并停在宿舍i时，f[S][i]为当前最优代价。其中S用状态压缩。从后向前搜索：

转移：f[S][i] =min( f[S\t][t] + map[t][i] | t in S) 
边界: f[{t}][t] = map[0][t]

不方便bottom to top, 故采用记忆化搜索。

题目又要求字典序最大，则从头向后搜索
转移：f[S][i] =min( f[S\t][t] + map[i][t] | t in S) 
边界: f[{t}][t] = 0
ans = min(f[S][i] + map[0][i] | i in S)

# Problem C: 彩色网格

观察只一行最多有m+1种状态
f[i][j]表示到第i行，状态为j时的方案总数(j=0~m)。
在根据给定的given color排除一些方案。
从后向前:

$$f[i][j] = sum(f[i-1][k]|k<j)[no\ given\ B\ after][no\ given\ R\ before]$$
$$ans = \sum(f[0][j]|j=0\sim m)$$

# 11.29 编程总结

## 抠门的龙

以字母为顶点，每个单词为边，求欧拉路  

* 有向图欧拉回路：入度=出度
* 有向图欧拉路：入读=出度/一点出度=入度+1且一点入读=出度+1

## 关于我转生成为史莱姆的那件事

打印欧拉路：dfs，从后向前输出即可

## 竞赛图哈密尔顿通路

分三类讨论，数学归纳法可证明竞赛图一定存在哈密尔顿通路。

## 扫雷兵George

中国邮递员问题：遍历所有边的最短路径->加最少长度的边使途变为欧拉图  
Floyed求距离->所有奇点状态压缩->动态规划