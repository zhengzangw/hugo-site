---
title: Arrange the Chips
date: 2018-09-17
tags: [oj, ps]
---

# Bob and Chips

Adaption from Others

## Description

In the Digital Logic Circuits Experiment, there are lots of chips for us to use. However, they are all mixed up! Bob wants to arrange the chips to make them more convenient to use.

There are $n$ different boxes numbered from $1$ to $n$ and $n$ different kinds of chips for use. In the beginning, all kinds of chips are in the 1st box and the number of $i$-th kind of chips is $a_i$. Bob needs to put all $i$-th kind chips into $i$-th box.

<!--more-->

Each time Bob will take all chips in a nonempty box and distribute them to 2 or 3 boxes. (That is to separate the chips he took into 2 or 3 non-empty groups and put these groups into different boxes). The cost of each operation is the number of chips he takes.

Now it's time for you to help Bob minimize the cost he will spend to put all chips into corresponding boxes.

## Input

The first line contains an integer $n$ which is the number of boxes (also the kinds of chips).

The second lines contains $n$ integer $a_1,a_2,...,a_n$ denoting the number of each kind of chip.

It is guaranteed that $1\leq n \leq 10^5​$,$1\leq a_i \leq 10^9​$.

## Output

One number denoting the minimum possible cost.

## Examples

### Input 

>3  
>2 4 6

### Output 1

>12

### Input 2

>4  
>1 2 3 4

### Output 2

>13

## Hint

In the first example, Bob takes all the chips from the first box, choose $k = 3$ and separate 12 chips into 2 of the 1st kind, 4 of the 2nd kind and 6 of the 3rd kind. The cost is 12.

In the second example, Bob performs two operations:

1. take all chips from the first box, choose $k=3$, put chips of the 3rd kind into the 3rd box, put chips of the 4th kind into the fourth box and the rest back into the first box. The cost is 10.
2. take all the chips from the first box, choose $k=2$ and put chips of the 1st kind into the first box and put chips of the 2nd kind into a 2nd box. The cost is 3.

Thus, the total cost is 13.