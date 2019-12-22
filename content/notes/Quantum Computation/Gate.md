---
title: Gates
date: 2019-09-05
tags: [cs, physics, notes]
---

matrix = operator = gate

## Single qubit operator

* Pauli operators
  * $I=(1,0;0,1)$
  * $X=(0,1;1,0)$ (非门)
    * $X|0\rangle=|1\rangle,X|1\rangle=|0\rangle$
  * $Y=(0,-i;i,0)$
    * $Y=iXZ,XY=-YX,XZ=-ZX,YZ=-ZY$
  * $Z=(1,0;0,-1)$
    * $Z|0\rangle=|0\rangle,X|1\rangle=-|1\rangle$
* Hadamard gate: $H=\frac{1}{\sqrt{2}}(1,1;1,-1)$
  * $H|0\rangle=|+\rangle=\frac{|0\rangle+|1\rangle}{\sqrt{2}},H|+\rangle=|0\rangle$
  * $H|1\rangle=|-\rangle=\frac{|0\rangle-|1\rangle}{\sqrt{2}},H|-\rangle=|0\rangle$
  * $H^{\otimes n}|0^n\rangle=\frac{1}{\sqrt{2^n}}\sum_{x\in\{0,1\}^n}|x\rangle$
  * $H|x\rangle=\sum_z\frac{(-1)^{xz}}{\sqrt{2}}|z\rangle$
  * $H^{\oplus n}|x\rangle=\frac{\sum_z(-1)^{x\cdot z}|z\rangle}{\sqrt{2^n}}$
    * $x\cdot z$: binary product mod 2
  * $HXH=Z,HZH=X,HYH=-Y$
* Phase Gate: $S=(1,0;0,i)$
* T gate($\frac{\pi}{8}$ gate): $T=(1,0;0,e^{i\frac{\pi}{4}})=e^{i\frac{\pi}{8}}(e^{-i\frac{\pi}{8}}, 0;0,e^{i\frac{\pi}{8}})$
* Rotation
  * $R|0\rangle=\cos\theta|0\rangle-\sin\theta|1\rangle$
  * $R|1\rangle=\sin\theta|0\rangle+\cos\theta|1\rangle$

### Approximating unitary operators

* Bloch sphere and rotation operators
  * 二维复平面球同构与三维实平面球同构 $SU(2)\cong SO(3)$
  * $|\varphi\rangle = \cos\frac{\theta}{2}|0\rangle+e^{i\varphi}\sin\frac{\theta}{2}|1\rangle$
  * $A^2=I,e^{i\theta A}=\cos(\theta)I+i\sin(\theta)A$
  * $R_{x}(\theta)=e^{\frac{-i\theta X/Y/Z}{2}}=\cos\frac{\theta}{2}I-i\sin\frac{\theta}{2}X$
  * $R_{y}(\theta)=e^{\frac{-i\theta X/Y/Z}{2}}=\cos\frac{\theta}{2}I-i\sin\frac{\theta}{2}Y$
  * $R_{z}(\theta)=e^{\frac{-i\theta X/Y/Z}{2}}=\cos\frac{\theta}{2}I-i\sin\frac{\theta}{2}Z$
  * $R_{\hat n}=e^{-i\hat n\cdot\frac{\vec\sigma}{2}}=\cos\frac{\theta}{2}I-i\sin\frac{\theta}{2}(n_xX+n_yY+n_zZ)$
    * $\hat n=(n_x,n_y,n_z)$ real unit vector
* Z-Y decomposition: $U=e^{i\alpha}R_z(\beta)R_y(\gamma)R_z(\delta)$
  * $U=e^{i\alpha}(\beta)R_{\hat n}R_{\hat m}(\gamma)R_{\hat n}(\delta)$
* $\lVert U-V\rVert=\max\limits_{|\psi\rangle}\lVert(U-V)|\psi\rangle\rVert$
  * $|\langle\psi|U^\dagger M_iU|\psi\rangle-\langle\psi|V^\dagger M_iV|\psi\rangle|\leq 2\lVert U-V\rVert$
  * $\lVert U_tU_{t-1}\cdots U_1-V_tV_{t-1}\cdots V_1\rVert\leq\sum_i\lVert U_i-V_i\rVert$
* $THTH=R_{\hat n}(\theta),\theta=2\arccos(\cos^2\frac{\pi}{8}),\hat n=(\cos\frac{\pi}{8},\sin\frac{\pi}{8},\sin\frac{\pi}{8})$ up to a normalization
  * $T=R_z(\frac{\pi}{4})$
  * $HTH=R_x(\frac{\pi}{4})$
  * $THTH=\cos^{\pi}{8}I-i(\cos\frac{\pi}{8}(X+Z)+\sin\frac{\pi}{8}Y)\sin\frac{\pi}{8}$
  * Densely filled: $\forall\delta>0,N=\lceil\frac{2\pi}{\delta}\rceil+1,\exists k!=j\in\{1,\cdots,N\}$ s.t. $\theta_{|k-j|}<\delta$, then $\{t\theta_{|k-j||t=1,2,3,\cdots}\}$ fills up $[0,2\pi)$ with $\delta$ precision
    * $\theta_k=(k\theta)\bmod 2\pi$
    * Implement $\forall \alpha,R_{\hat n}(\alpha)$ to an arbitrary small precisoin
  * $HR_{\hat n}H=R_{\hat m}(\alpha),\hat m=(\cos\frac{\pi}{8},-\sin\frac{\pi}{8},\cos\frac{\pi}{8})$ up to a normalization
* $U=R_{\hat n}(\beta)R_{\hat m}(\lambda)R_{\hat n}(\delta)$ up to a global phase

## Quantum Fourier Transform $F_N$

![Quantum Fourier Tansform](/images/general/quantumFT.png)

* $R_s=(1,0;0,e^{2\pi i/2^s})$
* gates: $O(n^2)$
* omit gates $R_k$ with $k=\Omega(\log n)$ and obtain a circuit with $O(n\log n)$ gates implementing QFT with precision $\frac{1}{\text{poly}(n)}$

## Controlled gates

* Controlled-U
  * $C^1(U)|b\rangle\otimes|\psi\rangle=|b\rangle\otimes U^b|\psi\rangle$
  * $C^n(U)$
* Controlled-NOT (generalization of XOR): $\text{C-N}$
* Theorem: $U=e^{i\alpha}AXBXC,ABC=I$
* $C^1(U)|ab\rangle=(I\oplus C)\text{C-N}(I\oplus B)\text{C-N}(I\oplus A)([1,0;0,e^{i\alpha}]\oplus I)$
* $C^n(U)$ = multi C-N + C-U
* Toffoli gate ($C^2(U)$): $|abc\rangle\rightarrow|ab(c\oplus a\cdot b)\rangle$
  * generalization of NAND: classic universal gate
  * Classic: $0\rightarrow|0\rangle,1\rightarrow|1\rangle$
  * Decomposition to $H,S,T,\text{C-N}$

## Decomposition of Arbitrary unitary gates

* Two-level unitary gates are universal
  * $U$ acts on $d$-dimensial space, then $U=V_1\cdots V_k,k\leq \frac{d(d-1)}{2}$ two-level unitary matrices $V_1,\cdots,V_k$ （类似高斯消元）
    * $O(4^n)$
* Single qubit gates & CNOT gates are universal
  * $\tilde{U}$ is the non-trival $2\times 2$ unitary submatrix of $U$
  * $U$ acts on the space spanned by the computational basis states $|s\rangle,|t\rangle$
  * Gray code: $|g_1\rangle\rightarrow|g_{m}|$
  * $|g_1\rangle\rightarrow|g_{m-1}|, C^1(U), |g_{m-1}\rangle\rightarrow |g_1\rangle$
    * Controlled-U on different bit, controlled by other qubits are same
  * $O(n^2)$
* Hadamard+T+Phase+CNOT are universal
  * $U\rightarrow R_{\hat n},R_{\hat m},S \rightarrow H,T,S$
  * Convergent rate $\Theta(\frac{1}{\epsilon})$
  * Solovay-Kitaev Theorem: Fix two universal gate sets that are closed under inverses. Then any $t$-gate circuit using one gate set can be implemented to precision $\epsilon$ using a circuit of $t\cdot\text{poly}(\log\frac{t}{\epsilon})$($\Theta(\log^c\frac{1}{\epsilon})$M <>?    ) gates from other set
