---
title: 8-假设检验
date: 2019-03-21
tags: [math, notes]
weight: 8
---

* 原假设/null hypothesis $H_0$
  * 备择假设/alternate hypothesis $H_1$
  * 单边假设/双边假设
  * 简单假设/复合假设
  * 参数检验假设/非参数假设检验
* 假设检验的错误
  * 第一类错误（弃真错误）
    * P(拒绝 $H_0$|$H_0$)=$\alpha$
    * 显著性水平 $\alpha$
  * 第二类错误（存伪错误）
    * P(接受 $H_0$|$H_1$)=$\beta$
  * Neyman-Pearson 原则
    * 在控制第一类错误 $\alpha$ 的前提下，使第二类错误的概率 $\beta$ 尽量小
    * 拒绝有充分证据
    * 接受：目前找不到拒绝 $H_0$ 的理由，先接受 $H_0
* 参数假设检验
  * 参数处理的假设检验问题
    * $H_0$ and $H_1$
    * $\alpha$ and $n$
    * 确定检验统计量 $U$ 和临界值、接受域、拒绝域
    * 计算统计量的观察值，判断是接受还是拒绝 $H_0$
  * 正态总体均值的假设检验
    * $\sigma^2$ 已知 （$u$ 检验）
      * $U=\frac{\overline{X}-\mu_0}{\sigma/\sqrt{n}}$
      * 双边拒绝域：$W=\{|U|\geq u_{\alpha/2}\}$
    * $\sigma^2$ 未知但相等 （$t$ 检验）
      * $T=\frac{\overline{X}-\mu_0}{S/\sqrt{n}}$
      * 双边拒绝域：$W=\{|T|\geq t_{\alpha/2}(n-1)\}$
      * 成对数据：成对$t$检验
  * 两个正态总体的均值差
    * $\sigma_1^2,\sigma_2^2$ 已知：$U=\frac{\overline{X}-\overline{Y}}{\sqrt{\frac{\sigma_1^2}{n_1}+\frac{\sigma_2^2}{n_2}}}$
      * 双边拒绝域 $W=\{|U|\geq u_{\alpha/2}\}$
    * $\sigma_1^2,\sigma_2^2$ 未知：$T=\sqrt{\frac{n_1n_2(n_1+n_2-2)}{n_1+n_2}}\frac{(\overline{X}-\overline{Y})}{(n_1-1)S_1^2+(n_2-1)S_2^2}$
  * 方差的假设检验 ($\chi^2$ 检验法)
    * $\chi^2=\frac{(n-1)S^2}{\sigma_0^2}$
    * 双边拒绝域 $W=\{\chi^2\leq \chi^2_{1-\alpha/2}(n-1)\}\cup\{\chi^2\geq\chi_{\alpha/2}^2(n-1)\}$
  * 方差比 $\sigma_1^2/\sigma_2^2$
    * $F=\frac{S_1^2}{S_2^2}$
    * 双边拒绝域 $W=\{F\leq F_{1-\alpha/2}(n_1-1,n_2-1)\}\cup\{F\geq F_{\alpha/2}(n_1-1,n_2-1)\}$
* 分布拟合优度检验
  * 假设 $H_0:F(x)=F_0(x;\theta)$
  * 皮尔逊$\chi^2$拟合优度检验
    * 将样本空间分为 $k$ 个互不相交的事件 $A_1,A_2,\cdots,A_k$
    * 计算 $A_i$ 上的理论频数：若 $\theta$ 未知，可利用极大似然估计，$\hat p_i=P(X\in A_i|\theta=\hat\theta)$
    * 计算实际频率 $n_i$
    * 计算两者偏差方之和 $\chi^2=\sum_{i=1}^k\frac{(n_i-n\hat p_i)^2}{n\hat p_i}$
    * 由Pearson-Fisher 定理，拒绝域：$W=\{\chi^2\geq \chi^2_{\alpha}(k-r-1)\}$
      * 大样本，$n\geq 50, n\hat p_i>5$
* 独立性检验
  * 假设 $H_0:X\perp Y$
  * 列联表：$r\times s$ 列联表
    * 独立性检验：$H_0:p_{ij}=p_i*p_j$
    * 极大似然估计：$\hat p_{i*}=\frac{n_{i*}}{n},\hat p_{*j}=\frac{n_{*j}}{n}$
    * $\chi^2=\sum_{i=1}^r\sum_{j=1}^s\frac{n_{ij}-n_{i*}n_{*j}/n}{n_{i*}n_{*j}/n}$
