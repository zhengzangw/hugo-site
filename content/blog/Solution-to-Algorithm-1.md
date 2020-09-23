---
title: 算法程序设计与分析作业一
date: 2020-09-21
mathmode: false
---

作业评分：每题 10 分，选做属于加分题

**一些共性的问题**：

- 作业只收到 41 份，名单有 54 位同学，请确认自己已经提交作业
- 作业严禁抄袭
- 作业记得写好学号姓名，并用订书钉或回形针等方式装订好
- 许多同学表示不会写伪代码
  - 作业都只需要给出伪代码，理论上不应该使用任何一种实际的编程语言书写（如 java/c/python）很多同学作业中伪代码直接交了可运行的代码，这样书写很费时间，同时也没法很好展示自己的思路
  - 写伪代码主要在于展现算法思路，只需要保留核心算法部分即可。一些辅助函数在说明了功能后可以直接使用，没必要完整的写出来。这里放一篇 pseudo code 的[参考文章](https://www.geeksforgeeks.org/how-to-write-a-pseudo-code/)
  - 大家可以看一下教程上给的代码示例，如 4.8 Heapsort 这一章的伪代码

## 海盗分金

上交作业的同学必做部分（m=5）基本都得分了。泛化的情况属于选做部分，很多同学都给出了思路，主要失分点在于没有考虑到"乐观"这一条件

以下给一个 `python` 参考代码

```python
def solve(m, n):
    """解决海盗分金问题，时间复杂度 O(m^2lgm)；使用一些技巧可优化到 O(m^2)

    Args:
        m (int): 海盗数
        n (int): 金币数

    Returns:
        (list): 由第一个人分配，每个人期望分到的金币数，-1 表示无法存活
    """

    # 临界情况
    if m == 1:
        return [n]
    # 递归：规约问题到 m-1 个海盗
    plan = solve(m-1, n)

    # 按照 m-1 个海盗时每个人期望获得的金币数从小到大排序
    sorted_plan = sorted(zip(plan, list(range(m-1))))

    current_plan = [0] * m
    remain_money = n
    # 第一个海盗需要在剩下 m 个海盗中争取到 m/2（下取整）个同意票
    for i in range(m//2):
        expected_money, member_id = sorted_plan[i]
        expected_money += 1  # 嗜血：需要多给一个金币赢取同意
        remain_money -= expected_money
        # 如果金币不够分了，则无法存活
        if remain_money < 0:
            return plan + [-1]
        else:
            current_plan[member_id] = expected_money
    # 第一个海盗可以获得剩余所有金币
    # 注意：到目前为止，去除 -1，current_plan 之和为 n
    # 此时得到的是一个可行的分配方案
    current_plan[-1] = remain_money

    # 乐观：对于最后需要赢得同意的海盗，可能只需在多人中选部分即可
    # 但所有持相同期望金币的都认为自己会被选到，在此要更新他们认为的期望金币
    # n >= 6 时乐观起作用
    while i+1 < m and sorted_plan[i][0] == sorted_plan[i+1][0]:
        i += 1
        expected_money, member_id = sorted_plan[i]
        current_plan[member_id] = expected_money + 1

    return current_plan
```

## 扔鸡蛋

### 必做题

为了计算 $f(k,m)$，假设在第 $i$ 层楼扔一个蛋。如果碎了，我们还剩 $k-1$ 个蛋，强度肯定小于 $i$，故问题化为 $f(k-1, i)$；如果没碎，把第 $i$ 层楼看做是新的一楼，则问题化为 $f(k, m-i)$。最坏情况是两者的最大值，为了取得最优，我们选择最佳的第 $i$ 层。

故递归为 $f(k,m)=\min\{(\max\{f(k-1,i),f(k,m-i)\})+1|1\leq i\leq m\}$

部分同学没有避免重复计算。可以把算过的值放在二维数组中保存起来，遇到相同计算时直接使用数组中的值。该方法时间复杂度 $O(n^3)$

### 选做

可参考文章：从《鹰蛋》一题浅析对动态规划算法的优化

- [pdf](https://wenku.baidu.com/view/7c9de809581b6bd97f19ea72.html?sxts=1600782136301&word=%E5%8A%A8%E6%80%81%E8%A7%84%E5%88%92%E7%AE%97%E6%B3%95%E4%BE%8B%E9%A2%98)
- [slides](https://wenku.baidu.com/view/7d57940ef12d2af90242e6ac.html#)

选做部分如果没有解释或解释不清也适当扣分。很多同学看了题解做题，希望至少把题解看懂了再写上来
