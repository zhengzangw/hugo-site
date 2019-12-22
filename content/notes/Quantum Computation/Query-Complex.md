---
title: Query Complex
date: 2019-09-05
tags: [cs, physics, notes]
weight: 4
---


## Polynomial method

* T-query algorithm: $|\psi_x^t\rangle=U_tO_xU_{t-1}O_x\cdots U_2O_xU_1O_x|\psi\rangle=\sum_{x,i}\alpha_{x,i}^{(t)}|i\rangle|\psi_{x,i}^t\rangle$
  * $\alpha_{x,i}^t$ is a deg $t$ polynomial
  * probability outputting $f(x)$ is a degree $2t$ polynomial
* Adversary method - polynomial method
  * negative adversary method
  * learning graph
* $\text{deg}_\epsilon(f)=\min\{d:f \text{ is a degree }d\text{ polynomial and }\forall x\in\{0,1\}^n,|f(x)-p(x)|\leq\frac{1}{3}\}$
* $Q_\epsilon(f)=\min\{t:\exists t$-query algorithm that computes $f$ correctly with probabiliy at least $1-\epsilon\}$
* Theorem: $Q_\epsilon(f)\geq\frac{1}{2}\text{deg}_\epsilon(f)$
* Parity function: $f:\{0,1\}^n\rightarrow\{0,1\},f(x)=[2|\sum_i x_i]$
  * $\text{deg}_\epsilon(f)=\Omega(n)$
* Symmetriazation
  * Given any $n$-variate multilinear polynomiial $p$, $P(k)=E_{|x|=k}[p(x)]$. Then $P$ is a polynomial with degree $\text{deg}(P)\leq\text{deg}(P)$
  * Symmetrizing + Symmetrizing the approximating function
* Unstructured search: $\text{deg}(P)\geq\Omega(n)$
* if the number of marked items is unknown, then there is no quantum speedup
* Theorem(Paturi 92): $\text{deg}_\epsilon(f)=\Theta(\sqrt{n(n-\Gamma(f))})$
* Theorem(Beals et.al. 95): for symmteric functions, $Q_\epsilon(f)=\Theta(\sqrt{n(n-\Gamma(f))})$
* Theorem: for any total booleam function $f$, it holds that $D(f)\leq O(Q_\epsilon(f)^6)$
* Theorem(2016): There exists a total Boolean functiion satisfying that $R_\epsilon(f)\geq\Omega(Q_\epsilon(f)^{2.5})$
  * Open Problam: gapp between $R_\epsilon(f)$ and $Q_\epsilon(f)$
* Collision Problem

## Adversary method for a pair of inputs

* Adversary matrix $\Gamma$
  * $\Gamma_{xy}=\Gamma_{yx}\geq0$
  * if $f(x)=f(y)$ then $\Gamma_{xy}=0$
* $W^j=\sum_{xy}\Gamma_{xy}a_x^**a_y\langle\psi_x^t|\psi_y^t\rangle$
  * $|W^0|=\|\Gamma\|$
    * $\|\Gamma\|$ is the largest eigenvalue in absolute value
    * $(a_x)$ is the priciple eigenvector of $T$
    * $(\Gamma_i)_{xy}=\Gamma_{xy}$ if $x_i\neq y_i$
  * $|W^T|\leq2\sqrt{\epsilon(1-\epsilon)}\|\Gamma\|$
  * $|W^{j+1}-W^j|\leq2\max_{1\leq i\leq n}\|\Gamma_i\|$
* Theorem: $Q_\epsilon(f)\geq\text{Adv}(f)=\max_{\Gamma}\frac{\|\Gamma\|}{\max_i\|\Gamma_i\|}$
* Other adversary methods
  * Weighted adversary method [Ambainis 03]
  * Strong weighted adversary method
  * Kolmogorov complexity
  * Minimax method
  * Theorem: All adversary methods are equivalent[SS'04]
* Limitation of adversary method
  * certificate complexity
    * $1$-certificate: $C_1(f)$
    * $0$-certificate: $C_0(f)$
  * $\text{Adv}(f)\leq O(\sqrt{C_0(f)C_1(f)})$
  * Element-Distinctness
  * 与 Polynomial method 不可比较
* General adversary matrix $\Gamma$
  * $\Gamma_{xy}=\Gamma_{yx}\in\mathbb{R}$
  * if $f(x)=f(y)$ then $\Gamma_{xy}=0$
  * $Q_\epsilon(f)=\Theta(\text{Adv}^{\pm}(f))$ [Reichardt 09,11]
  * Learning graph [Belios]

# Quantum Operations and Quantum Noise

* Classical noise

$$\begin{bmatrix}q_0\\q_1\end{bmatrix}=\begin{bmatrix}1-p & p'\\p& 1-p'\end{bmatrix}\begin{bmatrix}p_0\\p_1\end{bmatrix}$$

* Quantum operations: $\rho\rightarrow\mathcal{E}(\rho)$
  * Unitary: $\rho\rightarrow U\rho U^\dagger$
  * Partial trace: $\rho_{AB}\rightarrow \rho_A$
  * Attachment: $\rho\rightarrow\rho\otimes\sigma_0$
* $\mathcal{E}:M_{2^n}\rightarrow M_{2^m}$
  * Linearity
  * Trace-preserving
  * Positivity
  * Complete Positivity $\mathcal{E}(\rho)\otimes I_k$ positive for any integer $k>0$
* System coupled to environment
  * $\mathcal{E}(X)=Tr_B U(\rho\otimes|0\rangle\langle 0|_B)U^\dagger$
  * $\mathcal{E}(\rho)=\sum_kE_k\rho E_k^\dagger$, $\sum_kE_k^\dagger E_k=I$
* Theorem: Three conditions equivalent (合法量子操作)
* Quantum Noise
  * Bit flip channel
  * Phase flip channel
  * Bit-phase flip channel
  * Depolarizing channel: $\mathcal{E}(\rho)=p\cdot\frac{I}{2}+(1-p)\rho=(1-p)\rho+\frac{p}{3}(X\rho X+Y\rho Y+Z\rho Z)$
    * $XMX+YMY+ZMZ+M=2TrM\cdot I$
  * Amplitude damping channel
* Theorem: Let $\mathcal{E}:M_2\rightarrow M_2$ be a one-qubit quantum operation, then there exist real numbers $a,b,c,d$ such that $\mathcal{E}(\rho)=a\rho+bX\rho X+cY\rho Y+dZ\rho Z,a^2+b^2+c^2+d^2=1$