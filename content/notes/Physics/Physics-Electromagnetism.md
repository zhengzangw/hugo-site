---
title: Electromagnetism
date: 2018-11-01
tags: [physics, notes]
---



# Electromagnetism

* Coulomb's Law: $\overrightarrow{F_{21}} = -\overrightarrow{F_{12}} = k\frac{q_1q_2}{r_{12}^3}\overrightarrow{r_{12}}$
* Electric Field: $\overrightarrow{E} \equiv lim_{q\rightarrow 0}\frac{\vec F}{q} = \frac{1}{4\pi\epsilon}*\frac{q}{r^3}\overrightarrow{r_{12}}$
* Dipole moment(dipole field): $p\equiv q*2a$

<!--more-->

* Dipole Field: $\vec E = \frac{1}{4\pi\epsilon}*\frac{1}{r^3}[3(\vec p\cdot \vec e_r)\vec e_r - \vec p]$
* Dipole(independent of origin of net charge): $\vec p=q\vec r$
* Potential Energy of Dipole: $U = -\vec p*\vec E + C$
* flux: $\phi_E\equiv \oint \vec E*d\vec S$
* Guass Law: $\phi_E = \frac{q}{\epsilon_0}$
* Conductor E: $E = \frac{\rho}{\epsilon_0}$ conductor is equipotential
* Electric Potential: $V=\frac{1}{4\pi\epsilon_0}*\frac{q}{r} = -\int \vec E$
* Electric Potential Energy: $\Delta U = \Delta W_{ext} = \Delta(\frac{1}{4\pi \epsilon}*\frac{q_1q_2}{r})$
* Self Energry: $W=\int_0^Q Udq$
* Electrostatic Energy: $W=\frac{1}{2}\int\rho UdV$
* Capacitance: $C\equiv \frac{q}{V}$
* $C_p = \sum_i C_i$ $\frac{1}{C_s}=\sum_i\frac{1}{C_i}$
* $W = \frac{1}{2}\frac{q^2}{C} = \frac{1}{2}C(\Delta V)^2 = \int udV$
* Current Density: $\vec J = \sigma_C \vec E$
* $Q = It$
* $\rho = \frac{1}{\sigma}$
* Current: $I = JA =\frac{V}{R}$
* Resistance: $R = \frac{dV}{dI} = \rho\frac{l}{A}$
* Polarization: $\vec P = n<\vec p>$
* polar dielectric: $P = \chi\epsilon_0E$
* susceptibility: $\chi$
* non-polor dielectric: $\vec p=2\alpha E_0$
* Dielectric constant: $\epsilon = \epsilon_0\epsilon_r$,  $C_d\equiv\frac{\epsilon A}{d}$
* Electric Displacement: $\vec D = \epsilon_r\epsilon_0\vec E = \epsilon \vec E$
* Constitutive relation: $\vec D = \epsilon_0 \vec E + \vec P = (1+\chi)\epsilon_0\vec E$,  $\epsilon_r = 1 + \chi$
* Magnetic Induction: $\vec F = q\vec v*\vec B$
* Ampere's Law: $\vec F_{21} = \frac{\mu_0}{4\pi}\oint\oint\frac{I_2dl_2\times(I_1d\vec l_1\times \vec r_{12})}{r_{12}^3} = \oint I_2d\vec l_2\times\vec B_2$
* Biot-Savart Law: $\vec B = \frac{\mu_0}{4\pi}\oint\frac{Id\vec l\times\vec r}{r^3}$
* Magnetic Force for wires: $\vec F = I\vec l\times \vec B$
* Magnetic Dipole: $\mu = I\vec S$
* Torque: $\vec M = \vec \mu\times\vec B$
* Electromagnetic Force: $\vec F=q(\vec E + \vec v\times\vec B)$
* Cyclotron frequency: $\vec\omega=-\frac{q}{m}\vec B$
* Cyclotron radius: $\rho = \frac{mv_\bot}{qB}$
* Faraday's Law: $\epsilon = -\frac{d}{dt}\Phi$
* Lenz's Law
* Motional Electronmotive Force(emf): moving $\epsilon = -BLv$, $F=ILB$    rotating $\epsilon = \frac{1}{2}BR^2\omega$
* Inductance: $LI=\Phi$
* $\epsilon = -L\frac{dI}{dt}$
* Magnetic Energy: $U_m = \frac{1}{2L}\Phi^2 = \frac{1}{2}LI^2$
* Self-inductance: $L = \frac{2\int u_md\tau}{I^2}$
* Mutual inductance: $L_{12}=L_{21}=M$
* Solenoid: $B=n\mu_0I$
* cross-winded solenoids: $M=\sqrt{L_1L_2}$
* coefficent of coupling: $M=k\sqrt{L_1L_2}$
* In series: $L_s=L_1+L_2(-2M)$
* In parallel: $L_p = \frac{L_1L_2}{L_1+L_2}$
* Transformation for v
  * $\vec E' = \gamma(\vec E+c\vec\beta\times\vec B)-(\gamma - 1)\vec e_\beta(\vec e_\beta\cdot \vec E)$
  * $\vec B' = \gamma(\vec B-\frac{1}{c}\vec\beta\times\vec E)-(\gamma-1)\vec e_\beta(\vec e_\beta\cdot\vec B)$
* Dipole moment: $\vec \mu_L = I\vec S=-\frac{e}{2m}\vec L=-\mu_B\frac{\vec L}{\hbar} = \gamma\vec L$
* Bohr magneton: $\mu_B=\frac{e\hbar}{2m_e}$
* Spin angular moment: $\vec S$,  $(\frac{\vec S}{\hbar})_Z = \pm\frac{1}{2}$
* Spin magnetic moment: $\vec\mu_S = -2\mu_B\frac{\vec S}{\hbar}$
* Total magnetic moment: $\vec \mu=\vec\mu_L+\vec\mu_S=-\frac{e}{2m}(\vec L+2\vec S)$
* Magnetization: $\vec M = \frac{\vec mu}{V}$
* Precession: $\Omega_p = \frac{\mu B}{S} = |\gamma|B$
* Magnetic Field: $\vec H = \frac{\vec{B}-\mu_0\vec M}{\mu_0}$
* linear media and Magnetic Susceptibility: $\vec M = \chi \vec H$
* Permeability: $\vec B=\mu_0(1+\chi)\vec H\equiv\mu_0\mu_r\vec H\equiv\mu\vec H$
* Boundary Condition in Tangent direction: $(\vec H_1-\vec H_2)\vec e_t = J_\sigma$
* Potential energy: $u = -\vec M\cdot\vec B + C$
* Force: $\vec F = (\chi\vec H\cdot\nabla)(\mu\vec H)$
* Susceptibility: $\chi=\frac{1}{3}\frac{n\mu_1^2\mu_0}{k_BT}$
* Curie's Law: $M=C\frac{B_{eff}}{T}$
* Curie temperature: $T_C$, before is ferromagnetic phase
* Curie-Weiss's Law: $M=\frac{C}{T-T_C}H$
* permeability(ferromagnetic): $\vec B=\mu\vec H$
* Magnetic circuit: $\phi = B_1A_1$
* reluctance-magnetomotive force: $\phi(\sum\frac{l}{\mu A})=NI$
* Monopole: $\mu_0g=\oint\vec B\cdot d\vec S$
* Displacement current: $\frac{\partial D}{\partial T}$
* $\vec D=\epsilon_0\vec E + \vec P$
* $\vec H=\frac{1}{\mu_0}\vec B-\vec M$
* Maxwell's Equation
  * $\oint\vec D\cdot d\vec S=q$
  * $\oint\vec B\cdot d\vec S=0$
  * $\oint\vec E\cdot d\vec l=0-\frac{d}{dt}\oint\vec B\cdot d\vec S$
  * $\oint\vec H\cdot d\vec l=I+\frac{d}{dt}\phi\vec D\cdot\vec dS$
* Maxwell's Equation
  * $\nabla\cdot\vec D=\rho_f$
  * $\nabla\cdot\vec B=0$
  * $\nabla\times\vec E=-\frac{\partial\vec B}{\partial\vec t}$
  * $\nabla\times\vec H=\vec J_f + \frac{\partial\vec D}{\partial t}$
* Energy density: $u=\frac{1}{2}\vec E\cdot\vec D + \frac{1}{2}\vec B\cdot\vec H$
* Change rate of energy: $-\frac{dU}{dt} = \int\vec J\cdot\vec EdV$(Joule dissipation)$+\oint(\vec E\times\vec H)\cdot d\vec S$
* Poynting vector(radiation energy current density): $\vec S=\vec E\times\vec H$
* $\overline{S}=\frac{1}{2\mu_0}\vec E_mB_m$
* Power flow: $P=\int\vec S\cdot d\vec A$
* Wave equation(non-conduting media)
  * $\nabla^2\vec E-\mu\epsilon\frac{\partial^2}{\partial t^2}\vec E = 0$
  * $\nabla^2\vec B-\mu\epsilon\frac{\partial^2}{\partial t^2}\vec B = 0$
* Vaccum permeability: $\frac{\mu_0}{4\pi}\equiv 10^{-7}\frac{N}{A^2}$
* Field Vectors
  * $\vec E=\vec E(\vec k\cdot\vec r-ct)$
  * $\vec B=\vec B(\vec k\cdot\vec r-ct)$
* $\vec k\times\vec E=c\vec B$, $E=cB$
* $\vec E = \vec E(\vec r)e^{-i\omega t}$
* $\epsilon_0\mu_0c^2=1$