---
title: Tikz 
date: 2018-11-20
tags: [latex]
---

# 图片放置

```tex
\begin{figure}[htbp]
    \centering
    \subfloat[subtitle1]{
        \begin{tikzpicture}
            %code
        \end{tikzpicture}
    }
    \subfloat[subtitle2]{
        \begin{tikzpicture}
            %code
        \end{tikzpicture}
    }
    \caption{caption}
\end{figure}

\tikz %code
```

<!--more-->

# PGF/TikZ

* \draw
  * \draw (-1,0) -- (0,1) -- (1,0) -- (0,-1) -- (-1,0);
  * \draw [help lines] (-2,-2) grid (2,2);
  * \filldraw[fill=green!20!white, draw=green!50!black](0,0) -- (3mm,0mm) arc (0:30:3mm) -- cycle;
* \node
  * \node [below\above\left\right\below right\above right\below left\below right] at () {text}
  * 允许$\LaTeX$
* \begin{tikzpicture}[变量]
  * scale=3 放缩
  * xscale
  * yscale
  * name/.style={}
    * 全局定义 \tikzset{name/.style={}, ...}
  * [every node/.style={fill=blue!30,draw=blue!70,rounded corners},
* 形状
  * --
  * () rectangle ()
  * () circle [radius=2]
  * () ellipse (3 and 5)
  * () arc [radius=4,start angle=45,end angle=120]
  * () to [out=90,in=195] () %曲线
  * (0,0) .. controls (1,1) and (2,1) .. (2,0) 贝塞尔曲线
* 样式(,分隔)
  * [very thin/thin/semithick/thick/very thick/ultra thick/line width=]
  * [->/<-/|->/<->]
  * [above, sloped]
  * [dashed/dotted/densely dotted/loosely dotted/densely dashed/loosely dashed]
  * [red/green/blue/cyan/magenta/yellow/black/gray/blackgray/bbrow/lime/olive/orange/pink/purple/teal/violet/white]
    * color = red!70
    * color =
  * [fill=red]
  * [rounded corners]
  * [help lines]
  * [shift={()},xshift=,scale=,xscale=,rotat=,xslant=rotate around={45:()}]
* 函数
  * \draw [domain=0:2*pi] plot(\x,{sin(\x r)})
  * (\x, {function})
  * factorial(\x)、sqrt(\x)、pow(\x, y)、exp(\x)、ln(\x)、log10(\x)、log2(\x)、abs(\x)、mod(\x,y)、round(\x)、floor(\x)、ceil(\x)、sin(\x)、cos(\x)、tan(\x)、min(\x,y)、max(\x,y)、rnd
  * e, pi
  * 弧度: 参数后加r
* 循环
  * \foreach \x in {1,...,5}
    * \node[] (w1_\x) at (2*\x,0){$\int_\Omgega x_\x}

# node tree

```tex
\node{root}
child {node {a1}}
child {node {a2}
    child{node{b1}}
    child{node{b2}}
    }
```

# dot

```tex
\usetizpackage{graphs}
\graph{
    "$x_1$" -> b -- 1;
    1->2;
}
```

## graphviz dot

```bash
    brew install graphviz
    dot -Tpng *.dot -o *.png
```

### 语法

* [graphviz](http://www.graphviz.org/Documentation.php)
* 注释//
* digraph 有向图
* graph 无向图
* 哈希表

```tex
digraph g{
    nodesep = .5
    randkir = LR
    node[shape=record, width=.1, height-.1]
    node0[label="<f0> |<f1> |<f2> |<f3> |<f4> |<f5> |<f6> ", height=2.5];

    node[width=1.5];
    node1[label="{<n> a13 | 111 | <p>}"]; 
    node2[label="{<n> hello | 2387 | <p>}"];
    node3[label="{<n> g23 | 344 | <p>}"];
    node4[label="{<n> k535 | 246 | <p>}"];
    node5[label="{<n> h25 | 13 | <p>}"];
    node6[label="{<n> dj | 04 | <p>}"];
    node7[label="{<n> sbd | 0x543 | <p>}"];

    node0:f0 -> node1:n;
    node0:f1 -> node2:n;
    node0:f2 -> node3:n;
    node0:f5 -> node4:n;
    node0:f6 -> node5:n;
    node2:p -> node6:n;
    node4:p -> node7:n;
}
```

* 属性 a[]
  * shape=box/polygon,sides=5/polygon,distortion=0.5/polygon,skew=0.5/triangle/circle/more on manual
  * label
  * style=fillled
  * fillcolor=red/"#ABACBA"
* [参考文章](https://www.jianshu.com/p/e44885a777f0)

## 例子

```bash
node [color=red!70,pos=0.25,above,sloped]
```