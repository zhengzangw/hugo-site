---
title: Math Foundation
date: 2019-09-05
tags: [cs, physics, notes]
weight: 1
---

## Linear Algebra

* Vector: $|\psi\rangle$
* Row vector: $\langle\psi|=(\overline{|\psi\rangle})^T$
* Inner product: $\langle\psi|\varphi\rangle=\sum_i\overline{u}_iv_i$
  * $\langle\varphi|A|\psi\rangle$: Inner product between $|\varphi\rangle$ and $A|\psi\rangle$
  * $\lVert\psi\rVert=\sqrt{\langle\psi|\psi\rangle}$
* Tensor product: $A=(a_{ij}),B=(b_{ij}),A\otimes B=(c_{(i_1,i_2),(j_1,j_2)})$
  * $H^{\otimes n}=H\otimes H\otimes \cdots \otimes H$
* $|\psi\rangle|\varphi\rangle=|\psi\rangle\otimes|\varphi\rangle=|\psi\varphi\rangle=|\psi,\varphi\rangle$
  * $|0^n\rangle=|00\cdots0\rangle$
  * $(A\otimes B)(C \otimes D)=(AC)\otimes(BD)$
* $M^\dagger=\overline{M}^T$
* Unitary matrix $U$: $U^\dagger U=I$
* Hermitian matrix: $H=U^\dagger DU$, $U$ is unitary and $D$ is a real diagonal matrix(eigenvalues of $H$)
* Positive semidefinite: $H$ is Hermitina and its eigenvalues are nonnegative
* orthonormal basis $\{|v_1\rangle,\cdots,|v_d\rangle\}$
  * Completeness relation: $\sum_i|v_i\rangle\langle v_i|=I$
  * Computational basis in $\mathbb{C}^d$: $|i\rangle=(0,\cdots,1,0,\cdots,0)^T$
* noraml operator: $MM^\dagger=M^\dagger M$
  * Spectral/Eigenvalue decomposition: $M=\sum_{i=1}^d\lambda_i|v_i\rangle\langle v_i|=U\Lambda U^*$
    * $M$ is Hermitian iff $\lambda_i$ are reals
    * $M$ is a projector if $M$ is Hermitian and $M^2=M$/$\lambda_i\in\{0,1\}$
  * $f:\mathbb{C}^d\rightarrow\mathbb{C},f(M)=\sum_{i=1}^df(\lambda_i)|v_i\rangle\langle v_i|$
  * $Tr(A)=\sum_i A_{ii}=\sum_i \langle i|A|i\rangle$
    * $Tr(AB)=Tr(BA)$
    * $Tr(M)=\sum_{i}\lambda_i$

<!--more-->

## Fourier Transform

* $\forall v\in\mathbb{C}^N$ view it as $v:\{0,1,\cdots,N-1\}\rightarrow\mathbb{C},v(i)=v_i$
* Inner product: $\langle u,v\rangle=\sum_i\overline{u(i)}v(i)$
* orthonormal basis $(\chi_j)_{0\leq j\leq N-1},\chi_j(k)=\frac{1}{\sqrt{N}}\omega_N^{jk},\omega_N=e^{\frac{2\pi i}{N}}$
  * $\forall v\in\mathbb{C}^N,v=\sum_{j=0}^N\hat v(j)\chi_j$
* $F_N=\frac{1}{\sqrt{N}}(\chi_j(k))_{N\times N}=\frac{1}{\sqrt{N}}(\chi_1,\cdots,\chi_N)$
  * Unitary and Symmetric
* Fourier Transform
  * naïve way $O(N^2)$ steps
  * $\hat v=F_N v$
  * $v = F_N^\dagger, v(j)=\sum_k\hat v(N-k)\chi_j(k)$
  * $F_2=H$
* Convolution: $c_l=(a*b)_l=\frac{1}{\sqrt{N}}\sum_{j=0}^{N-1}a_jb_{(l-j)\bmod N}$
  * $(\widehat{a*b})_l=\hat a_l\cdot \hat b_l$
* Fast Fourier Transform: $T(N)=2T(\frac{N}{2})+O(N)\Rightarrow T(N)=O(N\log N)$
  * $\hat v_j=\frac{1}{\sqrt{2}}(\hat v_{\text{even } j}+\omega_N^j\hat v_{\text{odd } j})$
* Multiplying two polynomials: $p(x)=\sum_{j=0}^d a_jx^j,q(x)=\sum_{k=0}^d b_kx^k$
  * Naïve Alg: $O(d^2)$
  * FFT: $O(d\log d)$
    * $O(d\log d)$: $\hat a,\hat b$
    * $O(d)$: $\widehat{a*b}$
    * $O(d\log d)$: $a*b$
* Quantum Fourier transform $N=2^n$
  * $F_N|k\rangle=\frac{1}{\sqrt{N}}\sum_{j=0}^{N-1}e^{2\pi ijk/N}|j\rangle$
  * $F_N|k_1k_2\cdots k_n\rangle=\bigotimes_{l=1}^n\frac{1}{\sqrt{2}}(|0\rangle+e^{2\pi ik/2^l}|1\rangle)=\bigotimes_{l=1}^n\frac{1}{\sqrt{2}}(|0\rangle+e^{2\pi i0.k_{n-l+1}\cdots k_n}|1\rangle)$
  * $F_N|0^n\rangle=H^{\otimes n}|0^n\rangle$
* 经典与量子的区别
  * $\hat v=F_N v$
  * $|\hat v\rangle=F_N|v\rangle$
    * 不考虑量子态的制作时间
    * 无法全部读出 $|\hat v\rangle$

## Number Theory and Group Theory

* $Z_n=\{0,\cdots,n-1\},Z_n^*=\{x\in Z_n:\gcd(x,n)=1\}$
* $Z_{p^\alpha}$ is cyclic if $p$ is an odd prime and $\alpha$ is a positive integer
* Continued fractions: $x=[a_0,a_1,\cdots],[a_0,\cdots,a_n]=\frac{p_n}{q_n}$, then $|x-\frac{p_n}{q_n}|\leq\frac{1}{q_n^2}$
  * $p_0=a_0,p_1=a_1a_0+1,p_n=a_np_{n-1}+p_{n-2}$
  * $q_0=1,q_1=a_1,q_n=a_nq_{n-1}+q_{n-2}$
* homomorphism: $\rho:G\rightarrow H$ is a homomorphism if $\rho(g\cdot h)=\rho(g)\cdot\rho(h),\forall g,h\in G$
* $\omega_N=e^{\frac{2\pi i}{N}}$
* representation: homomorphism $\rho: G\rightarrow GL(n,\mathbb{C})$, the character $\chi_\rho(g)=\text{Tr}(\rho(g))$
* Basi theorem: find Abelian group is isomorphic to $\mathbb{Z}_{N_1}\times\cdots\times\mathbb{Z_{N_t}}$
* Represention of $\mathbb{Z}_{N}$: $\{\chi_k\}_{0\leq k\leq N-1},\chi_k(j)=\omega_N^{jk}$
* Represention of $\mathbb{Z}_{N_1}\times\cdots\times\mathbb{Z_{N_t}}$: $\{\chi_{k1}\cdots\chi_{k_t}\}_{0\leq k_i\leq N_i-1}$
* dual group: $\hat G=\{\text{all characters of } G\}$
* $|\chi\rangle =\frac{1}{\sqrt{N}}\sum_{j=0}^{N-1}\chi(j)|j\rangle$
* $F_N|k\rangle=|\chi_k\rangle$
