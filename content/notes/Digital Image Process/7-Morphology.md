---
title: Morphology
date: 2019-09-02
weight: 8
---

## 形态学基本概念

* 形态学(morphology)：生物学的分支，研究动植物形态和结构
* 数学形态学：提取表示区域形状的图像成分
  * 数学语言：集合论
* 集合的反射：$\hat B=\{w|w=-b,\forall b\in B\}$
* 集合的平移：$(B)_z=\{c|c=b+z,\forall b\in B\}$
* 结构元：研究图像性质的小集合（子图像），黑点表示结构元的原点
  * 矩形填充：背景，使可以容纳结构元
* 腐蚀(erosion)：$A\ominus B=\{z|(B)_z\subset A\}=\{z|(B)_z\cap A^c=\emptyset\}$ $B$对$A$的腐蚀
  * 形态学滤波
* 膨胀(dilation)：$A\oplus B=\{z|(\hat B)_z\cap A\neq\emptyset\}=\bigcup_{b\in B}(A)_b$
* $(A\ominus B)^c=A^c\oplus\hat B$
* $(A\oplus B)^c=A^c\ominus\hat B$
* 开操作(opening)
  * 平滑轮廓，断开窄连接，消除细突出
  * $A\circ B=(A\ominus B)\oplus B=\cup\{(B)_z\subseteq A\}$
* 闭操作(closing)
  * 平滑轮廓，熔合窄间断，消除缝隙和孔洞
  * $A\cdot B=(A\oplus B)\ominus B=\{z|(B)_z\cap A\neq\emptyset\}$
* hit-or-miss 变换：检测图像中的形状
  * $A\star B=(A\ominus D)\cap[A^c\ominus(W-D)]$
  * $B$ 为集合$D$及其背景

## 形态学基本算法

提取图像成分，预处理与后处理

* 边界提取：集合$A$的边界$\beta(A)=A-(A\ominus B)$
* 孔洞填充
  * 孔洞：由前景像素连成的边界包围的背景区域
  * 填充算法：$X_k=(X_{k-1}\oplus B)\cap A^c$ 直到 $X_k=X_{k-1}$
    * $X_0$：孔洞内的初始点设为 $1$，其余为 $0$
    * $B$：十字
* 连通分量提取
  * $X_k=(X_{k-1}\oplus B)\cap A$ 直到 $X_k=X_{k-1}$
    * $X_0$：连通分量的初始点设为 $1$，其余为 $0$
    * $B$ 八连通
* 凸包计算
  * 凸包 $H$：包含原集合的最小凸集合
  * 凸缺 $H-S$
  * 凸包算法
    * 四个结构元
    * $X_k^i=(X_{k-1}^i\star B^i)\cup A,i=1,2,3,4,k=1,2,3,4$
    * 加额外约束
* 细化：$A\otimes B=A-(A\star B)$
* 粗化：$A\odot B=A\cup(A\star B)$
* 骨架 $S(A)$：$\forall z\in S(A),(D)_z$ 为以 $z\in A$ 为中心的最大圆盘，则不存在包含 $(D)_z$ 且位于 $A$ 内的更大圆盘
  * 骨架搜索算法
    * $S_k(A)=(A\ominus^k B)-(A\ominus^k B)\circ B$
    * $K=\max\{k|(A\ominus^k B)\neq\emptyset\}$
    * $S(A)=\bigcup_{k=1}^K S_k(A)$
  * 重构集合：$A=\bigcup_{k=0}^K(S_k(A)\oplus^k B)$
* 裁剪(pruning)：去除骨架中的寄生分量（毛刺）
  * 假设寄生分量短