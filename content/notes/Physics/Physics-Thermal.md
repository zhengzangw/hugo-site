---
title: Thermal Physics
date: 2018-11-16
tags: [physics, notes]
---

> 《大学物理》卢德鑫
> NJU: University Physics I - 卢德鑫

# Temperature

## Basic Concept

* phase: homogeneous part of system
* equilibrium state: a state of a system in which macroscopic variables have definite values that remain constant as long as the external conditions are unchanged
* relaxation time: $\tau$, the time system needs to adjust itself to follow the change of the surrounding.

<!--more-->

* state avariables
  * mechanical: $p$
  * electromagenetic: $\vec E, \vec P, \vec B, \vec M$
  * geometric: $V, L$
  * chemical: $n, x_i$
* extensive: F(n)=nF(1)
* intensive: F(n)=F(1)
* quasistatic process: time the process takes is much longer than relaxation time
* isobaric, isochoric, isothermal, isentropic(or adiabatic)
* The zeroth law of thermodynamics:
  * Two systems, each in thermal equilibrium wirh a third (thermometer) are in thermal equilibrium with each other
* the triple point: 273.16K

## Empirical temperature scales

* Empirical temperature scales: $T(X) = 273.16K*\frac{R}{R_{tr}}$ (assuemd $T(X)=aX$) X温标
* the ideal gas scale: $T=273.16K*lim_{p_{tr}\rightarrow 0}(\frac{p}{p_{tr}})$
* Celsius scale: $T_C=T_{ideal\ gas}-273.15$
* Fahrenheit scale: $T_F=32^\circ+\frac{9}{5}T_C$
* thermodynamic scale (or Kelvin scale): In the range of temperature in which a gas thermometer may be used it is identical to ideal gas scale
* International Practical Scale IPTS-68, NMP(normal melting point)of tungsten is 3695K
* $5*10^{-8}K\sim 5*10^8K$
  
## equation of state

* equation of state of solid an d liquid
  * Coefficient of expansion
    * linear: $\alpha_l=\frac{1}{L}(\frac{\partial L}{\partial T})_p$
    * thermal(for isotropic material): $\alpha_V=\frac{1}{V}(\frac{\partial V}{\partial T})_p = 3\alpha_l$
    * $\frac{\Delta V}{V}\approx\alpha_V\Delta T\approx 10^{-5}\sim10^{-3}$
  * Isothermal compressibility: $\kappa_T=-\frac{1}{V}(\frac{\partial V}{\partial p})_T$
    * $|\frac{\Delta V}{V}|\approx\kappa_T\Delta p\approx 10^{-5}$
  * state of equation: $V=V_0(1+\alpha_V\Delta T-\kappa_T\Delta p)$

* equation of state for ideal gas: $PV=nRT$
  * gas constant: $R=8.31 J*K^{-1}*mol^{-1}$
  * Boyle-Mariotte Law: $pV=C(T)$
  * gas constant scale: $\frac{V}{T}=D(p)$
  * Avogadro's Law: under same temperature and pressure, gases of equal volume contain same number of molecules

* equation of state for real gas:
  * Virial expansion: $pV=nRT(1+B(T)p+C(T)p^2+\cdots)$, where $B(T),C(T)$ are called second, third Virial coefficient.
  * Van der Waal's equation: $[p+a(\frac{n}{V})^2](V-nb)=nRT$

# The First Law of Thermodynamics

* work done by external force: $dW=-pdV$
* Generalization: $dW=YdX$
  * generalized force Y: $-p, J, \sigma, \vec E,\vec H,\varepsilon, \mu$
  * generalized displacement X: $V, L, A, \vec P,\vec M,Q,n$
* Work is path-dependent: $W=-\int_{V_i}^{V_f}pdV$
* difference of the internal energy function U between two states A,B interms of adiabatic work done: $\Delta U=U_B-U_A=W_{BA}$
* The First Law of THermodynamics
  * $\Delta U = W+Q$
  * $dU=dQ+dW$
  * The perpetual motion machines of the first kind are impossible

## Heat Capacity

* heat capacity: $C=lim_{\Delta T\rightarrow0}\frac{\Delta Q}{\Delta T}$
* specific heat capacity: $C=\frac{C}{m}$
* $C<0$: gravitational system
* $C=\infty$: heat reservoir
* $C=0$: adiabatic
* $C_V=lim_{\Delta T\rightarrow0}(\frac{\Delta Q}{\Delta T})_V = (\frac{\partial U}{\partial T})_V$
* $C_p=lim_{\Delta T\rightarrow0}(\frac{\Delta Q}{\Delta T})_p = (\frac{\Delta U+p\Delta V}{\Delta T})_p = (\frac{\partial H}{\partial T})_p$
* ratio of specific heat: $\gamma=\frac{C_p}{C_V}$
* Heat capacity of ideal gases:  

| | $C_V$ |
|-|-|
|monatomic ideal gas|$\frac{3}{2}nR$|
|diatomic ideal gas|$\frac{5}{2}nR$|
|polyatomic ideal gas|$\frac{6}{2}nR$|
  
* solid capacity (at low temperature) $C_V=\alpha T^3+\gamma T$
* Change in specific heat c is an indication of phase transition

## Free expansion

* Joule's law(only for idea gas): $U=U(T)=C_VT+U_0$
* for idea gas and constant pressure: $C_p=C_V+nR$

## Adiabatic equation

* $pV^{\gamma}=TV^{\gamma-1}=C$
* adiabatic work: $W_S=C_V(T_2-T_1)$

## Carnot cycle

* consist of two isotherms and two adiabatics
* efficiency: $\eta = 1-\frac{T_2}{T_1}$

# The Second Law of Thermodynamics

* the second law of thermodynamics
  * Kelvin-Planck statement: No process is possible whose sole result is the absorption of heat from a reservoir and the conversion of this heat into work
  * Clausius statement: No process is possible whose sole result is the transfer of heat from a cooler to a hotter body
  * Perpetual motion machines of the second kind are impossible
* Carnot Theorem: $\eta_A(T_1,T_2)=1+\frac{Q_2}{Q_1}\leq\eta_R(T_1,T_2)=1-\frac{T_2}{T_1}$, R reversible
* Clausius inequality: $\oint\frac{dQ}{T}\leq0$
* Entropy: $\frac{dQ}{T}$, $S_A-S_B=\int_A^B(\frac{dQ}{T})_R$
* entropy principle: $dS\geq\frac{dQ}{T}$
  * Known the expression for entropy: $\Delta S=S_f-S_i$
  * Entropy change for a reservoir: $\Delta S=\frac{\Delta Q}{T}$
  * Entropy change for two state connected by a quasi-static process: $\Delta S=\int^f_idS$
  * Entropy change for states connected by an irreversible process: $\Delta S=\int dS$ in a resersible process
* Boltzmann Relation: $S=k_BlnW$
* Thermodynamic potentials:
  * $dU=TdS-pdV+\mu dn$
  * Enthalpy: $H=pV+U$, $dH=TdS+Vdp+\mu dn$
  * Helmholtz free energy: $F=U-TS$, $dF=-SdT-pdV+\mu dn$
  * Gibbs free energy: $G=\mu n$, $dG=-SdT+Vdp+\mu dn$
  * Gibbs-Duheim equation: $d\mu = -S_mdT+V_mdp$
  * Maxwell equation
    * $-(\frac{\partial S}{\partial p})_{T,n} = (\frac{\partial V}{\partial T})_{p,n}$
    * and more\

## Microscopic Model for Ideal Gas

* macroscopic description
  * $pV=nRT$
  * $C_V=\frac{3}{2}nR$ for monatomic gas
* pressure: $p=\frac{1}{3}\rho\overline{v^2}$
* mean square speed: $v_{rms} = \sqrt{\overline{v^2}}=\sqrt\frac{3p}{\rho}$
* $\frac{1}{2}m\overline{v^2}=\frac{3}{2}\frac{nR}{N}T$
* Boltzman constant: $k_B=\frac{nR}{N}=1.3805*10^{-23}J/K$
* Maxwell velocity distribution: $dn(v_x,v_y,v_z)=n_0(\frac{m}{2\pi}k_BT)^{\frac{3}{2}}exp(-\frac{1}{2}m(v_x^2+v_y^2+v_z^2)/k_BT)dv_xdv_ydv_z$
* the most probable speed: $v_m=\sqrt\frac{2k_BT}{m}$
* Boltzmann distribution: $\frac{e^{-\beta E(p,q)dpdq}}{\int\int e^{-\beta E(p,q)dpdq}}$ where p and q are generalized momentum and displacement
* Transport Phenomena
* $Q=JA$
  * Heat conduction
    * Fourier's Law: $J_Q=-\kappa\frac{dT}{dx}$
    * thermal conductivity: $\kappa$
  * convection
    * $Q=hA\Delta T$
  * thermal radiation
    * Stefan-Boltzman Law: $J_B=\sigma T^4$
    * Stefan Boltzman constant: $\sigma=5.6703*10^{-8} W/(m^2K^4)$
    * Kirchhoff's Law: $J_\alpha=\alpha J_B$
  * diffusion
    * Fick's Law: $J_m=-D\frac{\partial\rho}{\partial x}$
    * Diffusion coefficient: D
  * viscosity
    * Newton's Law: $J_p = -\eta\frac{\partial v_y}{\partial x}$
* continuity equation

## Phase Transition

* Van der Waals equation
  * b: finite size
  * a: force
* phase: solid, liquid, vapor, fluid
* Clapeyron's equation: $(\frac{dp}{dT})_{co}=\frac{\Delta H_m}{T\Delta V_m}=\frac{l}{T\Delta V_m}$
  * latent heat: l
  * Trouton's rule: $\frac{l_v}{RT_b}=9
* a phase transition is nth order if nth order derivative of chemnical potential is the first discontinuous one