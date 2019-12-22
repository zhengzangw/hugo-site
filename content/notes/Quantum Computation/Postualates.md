---
title: Postulates of Quantum Mechanics
date: 2019-09-05
tags: [cs, physics, notes]
weight: 2
---

## Postulates

1. Associated to any isolated physical system is a complex vector space with inner product known as **state space** of the system. The system is completely describled by its **state vector**/**density operator**, which is a unit vector in the systems state
   * state vector: $|\psi_i\rangle$
   * density operator: $\rho=\sum_ip_i|\psi_i\rangle\langle\psi_i|$
2. The evolution of a **closed** quantum system is described by a **unitary transformation**
   * $|\psi'\rangle=U|\psi\rangle$
   * $\rho'=U\rho U^\dagger$
3. Quantum measuerments are described by a collection $\{M_m\}$ of **measurement operator** ($m$ is number of possible outcome).
   * measurement operator: $\sum_mM_m^\dagger M_m=I$
     * $M_0=|0\rangle\langle 0|,M_1=|1\rangle\langle 1|$
     * not unitary
   * Original
     * $P(m)=\langle\psi|M_m^\dagger M_m|\psi\rangle$
     * state after the measurement: $\frac{M_m|\psi\rangle}{\sqrt{\langle\psi|M_m^\dagger M|\psi\rangle}}$
   * Reformed
     * $P(m)=\text{Tr}(M_m^+M_m\rho)$
     * state after the measurement: $\frac{M_m\rho M_m^\dagger}{\text{Tr}(M_m^\dagger M_m\rho)}$
4. The state space of a composite physical system is the tensor prorduct of the state spaces of the component physical systems.
   * $|\psi_1\rangle\otimes\cdots\otimes |\psi_n\rangle$
   * $\rho_1\otimes\cdots\otimes\rho_n$
   * 前提：两个系统独立

## Ensembles of quantum states

* Use a set of quantum states $\{|\psi_1\rangle,\cdots,|\psi_m\rangle\}$ and probability distribution $\{p_1,\cdots,p_m\}$
  * Ensemble of pure state: $\{p_i,|\psi_i\rangle\}$ 
  * Density operator (mixed state): $\rho=\sum_ip_i|\psi_i\rangle\langle\psi_i|$
    * $\text{Tr}(\rho)=1$
    * positive semidefinite
    * $|0\rangle\rightarrow |0\rangle\langle0|,|1\rangle\rightarrow |1\rangle\langle1|$
  * Ensemble of mixed state: $\{p_i,\rho_i\}$: $\rho=\sum_ip_i\rho_i$
* POVM(Positive operator-valued measure): $E_m=M_m^\dagger M_m$
  * positive semidefinite and $\sum_mE_m=I$
  * $P(m)=\text{Tr}(E_m\rho)$
* Projective measurement: $p(m)=\text{Tr} (P_m\rho)$
  * post-measurement state: $\rho_m=\frac{P_m\rho P_m}{\text{Tr} (P_m\rho)}$
  * 所有测量可以转化为投影测量
* Partial trace: $tr_B\rho^{AB}=\sum_{i=0}^{d_B-1}(I\otimes\langle i|)\rho^{AB}(I\otimes|i\rangle)$
  * $tr_B(|a_1\rangle\langle a_2|\otimes|b_1\rangle\langle b_2|)=tr(|b_1\rangle\langle b_2|)|a_1\rangle\langle a_2|$
* reduced density operator: $\rho^A=tr_B\rho^{AB}$
  * state of system $A$: $\rho^A$

## Others

* Bell States(EPR States): $|\beta_{xy}\rangle=\frac{|0y\rangle+(-1)^x|1,1-y\rangle}{\sqrt{2}}$
* $|\psi\rangle=\alpha|0\rangle+\beta|1\rangle=\frac{\alpha+\beta}{\sqrt{2}}|+\rangle+\frac{\alpha-\beta}{\sqrt{2}}|-\rangle$
* state vector coefficient $e^{i\theta}|\psi\rangle$: global phase, nonsense in physics
  * relative phase: meaningful
* Theroem(Distinguishing Quantum States): there is measurement distinguishing two states perfectly iif $|\psi_1\rangle$ and $|\psi_2\rangle$ are orthogonal
* Principle of deferred measurement: Measurement can always be moved from an intermediate state of a quantum circuit to the end of the circuit
* Principle of implicit measurement: Without loss of generality, any unterminated quantum wires (qubits which are not measured) at the end of a quantum circuit may be assumed to be measured

## CHSH game

* $V(s,t,a,b)=1$ if $s\cdot t=a\oplus b$
* Classic: $P=\frac{3}{4}$
* Quantum: $P\geq 0.8$
  * share an EPR state
  * if $x=1$, Alice rotate $\frac{\pi}{8}$
  * if $y=1$, Bob rotate $-\frac{\pi}{8}$
  * both measure qubits and output $a,b$
