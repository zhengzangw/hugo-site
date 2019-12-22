---
title: Fundamental Modern Physics
date: 2018-11-16
tags: [physics, notes]
---

> 《大学物理》卢德鑫
> NJU: University Physics II - 许望

# Energy Quantization

* $\nu\lambda=c$
* Blackbody radiation(infrared to visible spectrum): $u=u(\nu,T)$ or $u=u(\lambda,T)$
* Stefan-Boltzman Law: $J_B=\sigma T^4$
* relation between density of outgoing energy flow $J_u$ and density of energy u in the cavity: $J_u=\frac{1}{4}uc$, $u(T)=\int_0^\infty(\nu,T)d\nu$
* Radiation spectrun(or spectrum density): $u(\nu,T)$
* mean energy $\overline{\varepsilon}$: $u(\nu)d\nu=\frac{8\pi\nu^2}{c^3}\overline{\varepsilon}d\nu$

<!--more-->

* Wien formula: $u(v,T)d\nu\sim v^3e^{\frac{-\alpha\nu}{T}}d\nu$
  * $\overline{\varepsilon} = hve^{-\beta hv}$
* Wien displacement law: $\frac{h\nu_m}{k_BT}=2.822$
* Rayleigh-Jeans law: $u(\nu,T)d\nu = \frac{8\pi\nu^2}{c^3}k_BTd\nu$
  * $\overline{\varepsilon} = 2*\frac{1}{2}k_BT$
* definition: $\beta = \frac{1}{k_BT}$
* (1900)Planck's formula: $u(\nu,T)d\nu=\frac{8\pi\nu^2}{c^3}*\frac{h\nu}{e^{\beta h\nu}-1}d\nu$
  * $\overline{\varepsilon} = \frac{hv}{e^{\beta h\nu}-1}$
* Planck's relation: $E=h\nu$
* (1888) The photoelectric effect(visible to ultraviolet)
* stopping potential $V_0=\frac{hv}{e}-\frac{\phi}{e}$: $T_{max}=eV_0$
* cutoff frequency $\nu_c=\frac{\phi}{h}$
* Einstein's theory: $h\nu-\phi=T_{max}$
* Planck's formula: $u(\nu,T)d\nu$ = $h\nu dn(\nu)$
  * the distribution function of number density: $dn(\nu)=\frac{8\pi\nu^2}{c^3}\frac{1}{e^{\beta h\nu}-1}d\nu$
  * $n(T) = \frac{8\pi}{c^3(\beta h)^3}\Gamma(3)\zeta(3)$
* light intensity: $I=J*hv$
* (1923) Compton effect(from X ray to gamma ray)
* $|\vec p|=\frac{E}{c}$
* $\lambda'-\lambda=\frac{h}{m_0c}(1-cos\phi)$, Compton wavelength $\Lambda\equiv\frac{h}{m_0c}=2.426*10^{-12}$
* inverse Compton effect
* Spectroscopy
* Balmer series: $\frac{1}{\lambda}=R_{\infty}(\frac{1}{2^2}-\frac{1}{n^2})$
* Rydberg constant: $R_\infty = \frac{1}{91.13nm}$
* $\frac{1}{\lambda} = R_\infty(\frac{1}{m^2}-\frac{1}{n^2}),n=m+1,m+2,\cdots$, n=1 Lyman series
* Bohr Model
  * Stationary states: in states satisfying BBohr-Sommerfeld quantization condition($mv r=n\hbar$), eletron has fixed energy and does not radiate.
  * Microscopic energy conservation and quantum transition: Emission happend only when electron jumps from a state to another state of lower energy: $h\nu_{nm} = E_n - E_m$
  * Correspondence principle: Quantum theory must agree with classical theory in the limit in which classical theory is known to agree with experiment.
  * $r_n=\frac{4\pi\varepsilon_0\hbar^2}{m_ee^2}n^2\equiv a_0n^2$
  * $E_n=-\frac{1}{4\pi\epsilon_0}\frac{e^2}{2a_0}\frac{1}{n^2}=-\frac{e_s^2}{2a_0}\frac{1}{n^2}=-\frac{13.6}{n^2}eV$
  * $R_\infty=\frac{1}{4\pi\varepsilon}{\frac{e^2}{2a_0}}\frac{1}{hc}$
* Moving nucleus:
  * $R_m\equiv\frac{\mu}{m_e}R_\infty=\frac{1}{1+\frac{m_e}{m'}}R_\infty\equiv\frac{1}{\eta}R_\infty$
  * $E_n=-\frac{1}{4\pi\varepsilon_0}\frac{e^2}{2\eta a_0}\frac{1}{n^2}$
  * Rydberg equation: $\frac{c_{air}}{\lambda}=\frac{cR_\infty}{\eta}(\frac{1}{m^2}-\frac{1}{n^2})$

# Wave Nature of Matter

* wave-particle duality: $E=h\nu=\hbar\omega,p=\frac{hv}{c}=\frac{h}{\lambda}=\hbar k$
* mass-momentum relation
  * $p=\sqrt{2mE_k}$
  * $E^2=p^2c^2+m^2c^4$
* de Brogile wavelength: $\lambda=\frac{h}{p}=\frac{h}{\sqrt{2m_0E_k}\sqrt{1+\frac{E_k}{2m_0c^2}}}$
* Relativistic relation: $cp=\sqrt{(E_k+m_0c^2)^2-m_0^2c^4}$
* In extremely relativistic limit: $\lambda=\frac{1240eV\cdot nm}{E_k}$
* For non-relativistic electron: $\lambda=\sqrt\frac{1.504eV}{E_k}nm$
* Davisson-Germer experiment(1923)
* Electron two-slit experiment(1961)
* Uncertainty relation: $\Delta x\Delta p\geq\frac{1}{2}\hbar$, $\Delta E\Delta t\geq\frac{1}{2}\hbar$
* Uncertainty: $\Delta x\equiv\sqrt{\langle x^2\rangle -\langle x\rangle ^2}$

# $Schr\ddot{o}dinger Equation$

* wave function(Max Born, statistical interpretation or Copenhagen interpretation)$\Psi$:
  * $\Psi$ is probability amplitude
  * $|\Psi|$ is probability density
  * $|\Psi(x)|^2dx$ is the probability of finding the particle in an interval $dx$ near $x$
* basic properties:
  * Wave function is single-value, continuous, and finite
  * Normalization $\int|\Psi|^2=1$ is preferred
  * Superposition principle applies.
* wave function
  * 1D: $\Psi(x,t) = Ae^{i(kx-\omega t)}=Ae^{\frac{i}{\hbar}(px-Et)}$
  * 3D: $\Psi(x,t) = Ae^{\frac{i}{\hbar}(\vec p\cdot\vec x-Et)}$
* Schrodinger equation: $i\hbar\frac{\partial}{\partial t}\Psi=-\frac{\hbar^2}{2m}\nabla^2\Psi + U\Psi$
  * $\frac{\partial}{\partial t}\Psi = -\frac{i}{\hbar}E\Psi$
  * $\nabla\Psi =\frac{i}{\hbar}\vec p\Psi$
  * $E=\frac{p^2}{2m}$
  * (for relativistic case) Klein-Gorden equation and Dirac equation
  * $f(t)=Ce^{-\frac{i}{\hbar}Et}$
* flux density: $\vec J=\frac{\hbar}{2im}(\overline{\Psi}\nabla{\Psi}-\Psi\nabla\overline{\Psi})$
  * $\frac{\partial}{\partial t}|\Psi|^2 \equiv - \nabla\cdot\vec J$
* If potential is stationary: $\Psi(\vec r,t)=\psi(\vec r)f(t)$
  * Hamiltonian operator: $\hat{H}\equiv-\frac{\hbar^2}{2m}\nabla^2+U(\vec r)$
  * stationary Schrodinger equation: $\hat{H}\psi=E\psi$, which is eigenvalue equation of operator $\hat{H}$
  * eigenvalue: $E$, eigenfunction: $\psi$, $|\psi_n(x)|^2dx$ is the probability of finding the particle in the interval $x$ to $x+dx$
* expected value of an observable: $\langle O\rangle=\int\overline{\psi}\hat{O}\psi d\tau$
  * $\langle x\rangle=\int\overline{\psi}x\psi dx$
  * $\langle\vec p\rangle=\int\overline{\psi}\frac{\hbar}{i}\nabla\psi d\tau$
* One dimensional potential well
  * $\frac{d^2\psi}{dx^2}+k^2\psi=0$, ($k^2\equiv\frac{2mE}{\hbar^2}$)
  * $\psi_n(x)=\sqrt\frac{2}{a}sin(\frac{n\pi x}{a})$  ($0<x<a$)
  * $E_n=\frac{\hbar^2\pi^2}{2ma^2}n^2$
* Potential barrier
  * solution
    * $\psi=Ae^{ik_1x}+Be^{-ik_1x},(x<0)$
    * $\psi=Ce^{ik_2x}+De^{-ik_2x},(0<x<a)$
    * $\psi=Ee^{ik_1x}+Fe^{-ik_1x},(x>a)$
    * wave number
      * $k_1^2 = \frac{2mE}{\hbar^2}$
      * $k_2^2 = \frac{2m(E-U_0)}{\hbar^2}$
      * Standard procedure:
        * set F=0
        * using matching condition at x=0, a and normalization condition to fixed coefficient
    * reflection coefficients: $R\equiv\frac{|J_R|}{|J_I|}=\frac{|B|^2}{|A|^2}$
    * transmission coefficients: $T\equiv\frac{|J_T|}{|J_I|}=\frac{|E|^2}{|A|^2}$
    * tunneling: $E<U_0(k^2<0)$ but T>0
      * $T=\frac{|J_T|k_1}{|J_I|k_3}=T_0exp(-\frac{2}{\hbar}\int^{x_2}{x_1}\sqrt{2m(U(x)-E)}dx$
* Potential Step
  * $U(x)=U_0\theta(x)$
  * $E>U_0$
    * $\psi = Ae^{ikx} + Be^{-ikx} (x<0)$
    * $\psi = Ce^{ik_1x} (x>0)$
  * $E<U_0$
    * $\psi = Ae^{ikx} + Be^{-ikx} (x<0)$
    * $\psi = De^{-\kappa x} (x>0)$
* Simple harmonic oscillator
  * $U=\frac{1}{2}kx^2$
  * $E_0=\frac{1}{2}\hbar\omega_0$
  * $\psi_0=Ae^{-\frac{1}{2}\alpha^2x^2}$

# Atoms

* number of proton: Z
* number of neutron: N
* Hamiltonian for hydrogen-like atom: $\hat{H}=-\frac{\hbar^2}{2\mu}\nabla^2-\frac{Ze_s^2}{r}$, $e_s^2\equiv\frac{1}{4\pi\epsilon_0}e^2$
* In sperical coordinate system: $\nabla^2=\frac{1}{r^2}\frac{\partial}{\partial r}(r^2\frac{\partial}{\partial r})+\frac{1}{r^2}[\frac{1}{sin\theta}\frac{\partial}{\partial \theta}(sin\theta\frac{\partial}{\partial \theta})+\frac{1}{sin^2\theta}\frac{\partial^2}{\partial \varphi^2}]$
* angular momentum operator: $-\frac{\hat{L}}{\hbar^2}\equiv\frac{1}{sin\theta}\frac{\partial}{\partial \theta}(sin\theta\frac{\partial}{\partial \theta})+\frac{1}{sin^2\theta}\frac{\partial^2}{\partial \varphi^2}$
  * eigenvalue and eigenfunction: $\hat{L}^2Y_{lm}(\theta,\varphi)=l(l+1)\hbar^2Y_{lm}(\theta,\varphi)$, where l is integer and $Y_{lm}$ is spherical harmonics, subscript $|m|\leq l$
  * $L^2=l(l+1)\hbar^2$
  * $L_z=m\hbar$
* Schordinger equation: $-\frac{\hbar^2}{2\mu}[\frac{1}{r^2}\frac{\partial}{\partial r}(r^2\frac{\partial}{\partial r})-\frac{1}{r^2}\frac{\hat{L}}{\hbar^2}\psi-\frac{Ze_s^2}{r}\psi=E\psi$
  * $\phi(r,\theta,\varphi)=R(r)Y(\theta,\varphi)$
  * Radial
  * eigenfunction $R_{nl}(r)$
  * eigenvalues(Columbb potential well): $E_n=-\frac{\mu Z^2e_s^4}{2\hbar^2}\frac{1}{n^2}$
  * $\phi_{nlm}=R_{nl}(r)Y_{lm}(\theta,\phi)$, $n=1,2,...$, $l=0,1,\dots,n-1$, $m=-1, -l+1, \dots, l$
    * principal quantum number: n
    * angular number: l
    * magnetic number: m
* degenerate: same energy level may corresponds different quantum states of same n and different l and m
  * degeneracy: $n^2$
* spectroscopy:
  * $l=0$: sharp series
  * $l=1$: principal series
  * $l=2$: diffuse series
  * $l=3$: fundamental series
* Selection rules(in transition): $\Delta l=\pm1$
* Bohr raduis: $a_0=\frac{\hbar^2}{m_ee_s^2}$
* ratio: $\eta=1+\frac{m_e}{m_p}=\frac{m_e}{\mu}$
* reduced mass: $\frac{m_e+m_p}{m_pm_e}$
* $E_n=-\frac{Z^2e_s^2}{2\eta a_0}\frac{1}{n^2}$
* Radial probality density: $w_{nl}dr=r^2dr\int d\Omega|\phi_{nlm}|^2=R^2_{nl}(r)r^2dr$
* Laguerre polynomial: $R_{nl}\sim e^{-\frac{1}{2}\rho}\rho^lL^{2l+1}_{n-1-l}(\rho),\rho\equiv\frac{2Z}{na_0}r$
  * the most possible radius of largest angular quantum number: $r_{mp}=\frac{1}{Z}n^2a_0$
  * $\langle r\rangle=\frac{1}{2}(3n^2-l(l+1))$
* electron cloud
  * $J_r=J_\theta=0$, $J_\varphi=\not 0$
* Spin angular momentum: $(\frac{\vec S}{\hbar})=\pm\frac{1}{2}$
* Pauli exclusion principle: No two electrons in a single atom can have the same set of quantum numbers $(n,l,m,m_s)$
* exchange of two:
  * anti-symmetric: Fermions(Electron)
    * $$ \psi(\vec r_1,\vec r_2) = \frac{1}{\sqrt{2!}}\left|\begin{matrix} \psi_m(\vec r_1) & \psi_m(\vec r_2)\\ \psi_n(\vec r_1) & \psi_n(\vec r_2) \end{matrix}\right|$$
  * symmetric: Bosons
* shell: the set of orbits with a certain value of n K,L,M
* subshell:
  * The capacity of each subshell is $2(2l+1)$
  * The electrons will occupy the lowest energy states available
* Laser: Light Amplification by the Stimulated Emission of Radiation
* X rays: electromagentic radiation with wavelength smaller than nm
  * characteristic spectrum
  * $K_\alpha$: $L\rightarrow K$
  * $K_\beta$: $M\rightarrow K$
  * bremsstrahlung(breaking radiation): electrons encounter deceleration
  * cutoff-wavelength: $\lambda_{min}=\frac{hc}{E_k}$

# Molecules and Clusters

* AO(atomic orbital): the wave function
  * s orbital
    * $\psi_{100}=R_{10}Y_{00}$
    * 等概率面为同心圆，概率为10%时，$r=2.6a_0$
  * p orbital
    * $p_x=R_{21}(r)(\frac{3}{4\pi})^{\frac{1}{2}}\frac{x}{r}\leftarrow -\frac{1}{\sqrt{2}}(Y_{1,+1}-Y_{1,-1})$
    * $p_y=R_{21}(r)(\frac{3}{4\pi})^{\frac{1}{2}}\frac{y}{r}\leftarrow \frac{i}{\sqrt{2}}(Y_{1,+1}+Y_{1,-1})$
    * $p_z=R_{21}(r)(\frac{3}{4\pi})^{\frac{1}{2}}\frac{z}{r}\leftarrow Y_{1,0}$
  * sp hybridization
* Molecular Orbital
  * Hydrogen molecule ion $H_2^+$ and s-s covalent bond
  * The $H_2$ molecule and the covalent bond
  * p-p covalent bond
  * s-p molecular bond
  * s-p directed bond
  * carbon and s-p hybrid orbital
* Ionic bonding
  * ionization energy
  * electron affinity
  * Coulomb potential = ionizaiton energy - affinity
  * electronegativity: Pauling scale
* Vibration energy levels: $E_n=\hbar\omega(n+\frac{1}{2}),\ \omega^2=\frac{k}{\mu}$
  * $\Delta n = \pm1$
* Rotation energy levels: $E_L\frac{L^2}{2I}=\frac{L(L+1)\hbar^2}{2\mu R^2}$
  * $\Delta L=\pm1$

# Fermi and Bose Statistics

* Thermal (de Broglie) wavelength: $\lambda=\frac{h}{mv_{rms}}=\frac{h}{m}\sqrt\frac{m}{3k_BT}$
  * When the average spacing between particles $a>\lambda$, granular property dominant.
* Degeneracy temperature: $T_0\equiv \frac{m}{3k_B}(\frac{h}{ma})^2$
  * $T<T_0$: wave property is more important
* Fermions: particles with odd half integar spin
  * $(s=\frac{1}{2})$electrons, protons, neutrons, muons, neutrinos, quarks
  * Composed of odd number of Fermions are Fermions
* Bosons: particles with integer spin
  * $(s=\frac{1}{2})$photons, pions, mesons, gluons
  * Composite particles composed of any number of Bosons and an even number of Fermions behave as Bosons
* $\frac{d^2\psi(x)}{dx^2}+k^2\psi(x)=0$
  * $k^2\equiv\frac{2mE}{\hbar^2}$
  * $\psi(x)=Ae^{ikx}$
* one-dimensional: $E_n=\frac{\hbar^2}{2m}(\frac{\pi}{L})^2n^2\equiv E_1n^2$
  * $k_n=\frac{2n\pi}{L}$
  * 1 state $\leftrightarrow\frac{2\pi}{L}$ interval
  * $\frac{\Delta E_n}{E_n}=\frac{2n+1}{n^2}$
* energy level in 3D box: $E_{n_x,n_y,n_z}=\frac{\hbar^2}{2m}(\frac{\pi}{L})^2(n_x^2+n_y^2+n_z^2)$
  * $k_i=\frac{2n_i\pi}{L}$
  * 1 state $\leftrightarrow(\frac{2\pi}{L})^3$
  * quasi-continuity: $\sum_i\rightarrow gV\int\frac{d^3k}{(2\pi)^3}$ or $\int g(\varepsilon)d\varepsilon$
  * dengenaracy due to spin: $g=2s+1$
* Density of states(DOS): $g(\varepsilon)=\frac{Vm^\frac{3}{2}}{\sqrt{2}\pi^2\hbar^3}\sqrt{\varepsilon}d\varepsilon$
  * $g(\varepsilon)d\varepsilon=\frac{gV}{4\pi^2}(\frac{2m}{\hbar^2})^\frac{3}{2}\varepsilon^\frac{1}{2}d\varepsilon$ = $gV\frac{4\pi k^2}{(2\pi)^3}dk$
  * energy spectrum: $\frac{\hbar^2k^2}{2m}$
* Fermi-Dirac: $f_{FD}=\frac{1}{e^{\beta(E-\mu)}+1}$
* Fermi energy: $T\rightarrow0,E_F\equiv\mu=\frac{\hbar^2 k_F^2}{2m}=k_BT_F$
  * $E>>m$: $E_F=c\hbar k_F$
* Distribution at zero temperature: $f(E)=\theta(E_F-E)$
* Number of state: $N=\sum{<n_i>}$
* Fermi sphere(Fermi sea) in k space: $N=(2s+1)V\int\frac{d^3k}{(2\pi)^3}=\frac{V}{3\pi^2}k_F^3$
  * Fermi wave number: $k_F=(3\pi^2\frac{N}{V})^\frac{1}{3}$
* average energy under zero temperature: $\frac{\langle E\rangle}{N}=\frac{3}{5}E_F$
* Bose-Einstein distribution: $f_{BE}=\frac{1}{e^{\beta(E_j-\mu)}-1}$
* Stefan-Boltzmann Law: $\frac{U(T)}{V}=\frac{8\pi}{c^3}\frac{(k_BT)^4}{h^3}\int_0^\infty\frac{x^3dx}{e^x-1}\sim T^4$
* Bose-Einstein condensation

# Condensed Matter

* Orientation order
  * nematic phase
  * cholesteric phase
  * smectic phase
* quasi-crystal
* Penrose tilting($36^\circ,72^\circ$)
* Capacity dimension (Hausdorff dimension, fractal dimensinon) $d\equiv\lim_{\epsilon\rightarrow0}\frac{\ln N(\epsilon)}{ln\frac{1}{\epsilon}}$
* Kohn curve: $d=\frac{\ln 4^n}{\ln 3^n}$
* Cantor set: $d=\frac{2}{3}$
* Similarity dimension: When a shape is composed of n similar shape of size 1/m, then the similarity dimension is given by $\frac{\ln n}{\ln m}$
* Potential between ions: $V=-\alpha\frac{1}{4\pi\epsilon_0}{e^2}{r}+\frac{A}{r^n}$
* ionic cohesive energy $-V_0$: $V_0\equiv V(r_0)=-\alpha\frac{1}{4\pi\epsilon_0}\frac{e^2}{r_0}(1-\frac{1}{n})$, $r_0$ is equilibrium position.
* atomic cohesive energy: $V = V_0 - E(get\ e) + E(rid\ e)$

# Nuclear Physics

* nucleus: ${}^A_ZX_N$
* atomic number: $Z$
* neutron number: $N$
* mass number: $A$
* $R=R_0A^{\frac{1}{3}}$
* unified atomic mass: $u=m_{12_C}/12$
* mass excess: $\Delta\equiv\frac{m-A}{c^2}$
* Bohr magneton $\mu_N$: $\mu_p=2.793\mu_N,\mu_n=-1.912\mu_N$
* Binding Energy: $B=Nm_nc^2+Zm_pc^2-mc^2$
* Average binding energy: $\frac{B(Z,A)}{A}\sim 8.5MeV$
* Radioactivity: $-\frac{dN}{dt}=\lambda N$, $N = N_0e^{-\lambda t}$
* decay rate(activity): $R\equiv-\frac{dN}{dt}=R_0e^{-\lambda t}$, $1 Bq = 1s^{-1}$
* disintegration constant: $\lambda$
* Half-life: $t_{1/2}=\frac{ln2}{\lambda}$
* mean life: $\overline{t} = \frac{1}{\lambda}$
* short-lived: $t_{1/2}=\frac{ln2}{\ln (R_0/R(t))}t$
* long-lived: $\lambda = \frac{R}{N}$
* Dating: $t=\frac{\ln(R_0/R(t))}{\ln 2}t_{1/2}$
* alpha decay
* beta decay
* gamma decay
* Fission: $Q=(m-(m_1+m+2))c^2=A_1*\frac{B_1}{A_1}+A_2*\frac{B_2}{A_2}-A*\frac{B}{A}$

# Leptons and Quarks

* Classification of particles: photon, lepton, hadron(meson, nucleon, hyperon)
* Classification
  * leptons: $s=\frac{1}{2},S=0$
  * quarks: $s=\frac{1}{2}$
  * Field quanta
* weak interation: $n+v_e\rightarrow p+e^{-1}$
* Conservation
  * lepton number($L_e,L_\mu,L_\tau$)
    * $e^{-1},v_e$ is 1
  * baryon number($B$)
  * strangeness($S$): conserve in strong interation(collision between hadrons), do not conserve in weak interation
  * mass-energy: no meson acan decay into hyperon and others
  * angular
  * momentum
* Quark
  * $s=\frac{1}{2}$
  * $B=\frac{1}{3}$, and for antiquark, $B=-\frac{1}{3}$
  * baryon consists of $qqq$
  * meson consists of $q\bar{q}$
  * stange quark $S=-1$
* CPT theorem
  * charge conjugate invariance(not conserved in weak interaction)
  * space inveriance: parity conservation(not conserved in weak interaction)
    * handedness: $sgn(ps)$
      * $\mu$,neutrino: left-handed,  $-1$
        * $\bar{\mu}$: right-handed
      * axial vector in mirror changes direction(like $B$)
    * time reversal invariance