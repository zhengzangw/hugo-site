---
title: Quantum Error Correction
date: 2019-09-02
weight: 10
---

## Distance Measures over distribution

Given two distribution $\{p_x\},\{q_x\}$

* Trace distance (Total variance): $D(p_x,q_x) = \frac{1}{2}\sum_{x\in X}|p_x-q_x|$
* Fidelity: $F(p_x,q_x)=\sum_{x\in X}\sqrt{p_xq_x}$
* Properties (distribution)
  * $[0,1]$
  * $D(p_x,q_x)=0\iff F(p_x,q_x)=1\iff \forall x p_x=q_x$
  * $D(p_x,q_x)=1\iff F(p_x,q_x)=0\iff \forall x ,\text{supp}(p_x)\cap\text{supp}(q_x)=\emptyset,\text{supp}(p_x)=\{x|p_x>0\}$
  * $D(p_x,q_x)=\max_{S\subseteq X}|p_x-q_x|$

## Distance Measures over quantum states

Given two quantum states

* Trace distance: $D(\rho,\sigma)=\frac{1}{2}\|\rho-\sigma\|_2$
  * $D(\rho,\sigma)=D(U\rho U^\dagger,U\sigma U^\dagger),\forall$ unitary $U$
  * $D(\rho,\sigma)=\max_P Tr(P(\rho-\sigma))$
  * Total error $=\frac{1}{2}-\frac{1}{2}\|\rho-\sigma\|$
* Theorem: $D(\mathcal{E}(\rho),\mathcal{E}(\sigma))\leq D(\rho,\sigma)$
* Fidelity: $F(\rho,\sigma)=Tr\sqrt{\rho^{\frac{1}{2}}\sigma\rho^{\frac{1}{2}}}$
* purification: Given a density operator $\rho$ in system $A$, a bipartite pure state $|\psi\rangle^{AB}$ is a purification of $\rho$ if $Tr_A|\psi\rangle\langle\psi|=\rho$
  * existence
    * $\rho=\sum_i\lambda_i|u_i\rangle\langle u_i|^A$
    * $|\psi\rangle=\sum_i\sqrt{\lambda_i}|u_i u_i\rangle^{AB}$
* Uhlman's theorem: Suppose $\rho$ and $\sigma$ are states of a quantum system $Q$. Introduce a second quantum system $R$ which is a copy of $Q$, then $F(\rho,\sigma)=\max_{|\psi\rangle,|\phi\rangle}|\langle\psi|\phi\rangle|$
* Theorem: $1-F(\rho,\sigma)\leq D(\rho,\sigma)\leq\sqrt{1-F(\rho,\sigma)^2}$
* gate fidelity: $F(U,\mathcal{E})=\min_{|\psi\rangle}F(U|\psi\rangle\langle\psi|U^\dagger,\mathcal{E}|\psi\rangle\langle\psi\langle\mathcal{E}^\dagger)$
* minimum fidelity (for quantum channel $\mathcal{E}$): $F(\mathcal{E})=\min_{|\psi\rangle}F(|\psi\rangle,\mathcal{E}(|\psi\rangle\psi|))$

## QEC

* Bit flip code: 3 physical bits to encode 1 logical bit $|0\rangle\rightarrow |000\rangle$
  * Recovery: majority vote
  * Cannot correct phase error
* Phase flip code: 3 physical bits to encode 1 logical bit $|0\rangle\rightarrow |+++\rangle$
* Shor code: Syndrome diagnosis
  * $|0\rangle\rightarrow|0_L\rangle=\frac{(|000\rangle+|111\rangle)(|000\rangle+|111\rangle)(|000\rangle+|111\rangle)}{2\sqrt{2}}$
  * $|1\rangle\rightarrow|1_L\rangle=\frac{(|000\rangle-|111\rangle)(|000\rangle-|111\rangle)(|000\rangle-|111\rangle)}{2\sqrt{2}}$
  * Correct arbitrary one-qubit quantum error
* Other quantum error correcting code
  * Steane codes
  * Calderbank-Shor-Steane codes
  * Stabilizer codes
  * Toric codes
  * Surface codes
* NISQ(John Preskill): noisy intemidiate-scale quantum computing
* Quantum Supremacy(John Preskill)