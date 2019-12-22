---
title: Mechanics
date: 2018-11-24
tags: [physics, notes]
---

> 《大学物理》卢德鑫
> NJU: University Physics I - 卢德鑫

# Kinematics

* diplacement: $\Delta\vec r=\vec r(t+\Delta t)-(\vec t)$
* velocity: $\overline{\vec v}=\frac{\Delta\vec r}{\Delta t}$
* speed: $\overline{v}=\frac{\Delta s}{\Delta t}$
* acceleration: $\vec a=\frac{d\vec v}{dt}$
* angular velocity vector: $\vec \omega =\frac{d\vec\theta}{dt} = \dot{\varphi}\vec k$
* velocity in circular motion: $\dot{\vec \rho}=\vec \omega\times\vec\rho$
* Oscillation: temporal periodicity and spatial repetitiveness

<!--more-->

* SHM: simple harmonic oscillation:
  * $x = A\sin\omega t+B\cos\omega t$
  * $x = A\cos(\omega t+\varphi)$
  * $x = Ae^{i\omega t}+Be^{-i\omega t}$
  * amplitude: A
  * phase: $\omega t+\varphi =\Phi$
  * initial phase: $\varphi$
* sum up waves of same frequency: $A^2=A_1^2+A_2^2+2A_1A_2cos(\varphi_2-\varphi_1)$
  * constructive : $0,A=A_1+A_2$
  * destructive: $\pi,A=|A_1-A_2|$
  * quadrature: $\frac{\pi}{2},A=\sqrt{A_1^2+A_2^2}$
* sum up waves of no initial phase
  * $A^2=A_1^2+A_2^2+2A_1A_2\cos(\omega_1-\omega_2)t$
  * waves of same amplitude: $2A\cos(\frac{\omega_1-\omega_2}{2}t)\cos(\frac{\omega_1+\omega_2}{2}t)$
    * modulating factor: $cos(\frac{\omega_1-\omega_2}{2}t)$
    * beat
* phase diagram: trajectories of phase space(or in state space)
  * center, node, asddle, spiral
* Galilean transformation: $\dot{\vec r}'=\dot{\vec r} - \vec u$
* Coriolis acceleration: $2\vec\omega\times\frac{d\vec r}{dt'}$
  * $\frac{d}{dt}=\frac{d}{dt'}+\vec\omega\times$
  * $\frac{d\dot{\vec r}}{dt} = \frac{\dot{d\vec r}}{dt'} + \omega\times\dot{r}=\frac{d^2\vec r}{dt'^2} + 2\vec\omega\times\frac{d\vec r}{dt'}+\vec\omega\times(\vec\omega\times\vec r)$

# Particle Dynamics

* Newtow's second law: $\vec F=m\vec a=\frac{d\vec p}{dt}$
* $\vec F_{AB}=\vec F_{BA}$
* Gravitation: $\vec F_{21}=-G\frac{m_1m_2}{r_{12}^3}\vec r_{12}$
* Elastic (restoring) force: $\vec F=-k\vec x$
* Intermolecular force: $\vec F\sim 2(\frac{\sigma}{r})^{13}-(\frac{\sigma}{r})^7$
* static friction: $F_f\leq\mu_s F_N$
* sliding friction: $F_f=\mu_k F_N$ (Amonton-Coulomb law)
* Frictional drag: $F_d=\frac{1}{2}C_dA\rho v^2$
* viscosity force: $F_\eta=6\pi\eta rv$ (Stoke's law)
* Reynolds number: $Re=\frac{\rho vd}{\eta}$, Stoke's law holds when Re=0~10
* noninertial frame:
  * inertial force: $\vec F_{in}=-m\ddot{\vec r}$
  * $(\vec F+\vec F_{in})=m\vec{a}'$
* inertial centrifugal force:
  * $\vec F=-mr\dot{\varphi}\vec e_\rho$
* Linear momentum: $\vec p=m\vec v$
* angular momentum: $\vec L=\vec r\times\vec p$
* torque: $\vec M=\vec r\times\vec F=\frac{d\vec L}{dt}$
* Work: $dW=d\vec F\cdot d\vec r$
* power: $P=\frac{dW}{dt}=\vec F\cdot\vec v$
* kinetic energy: $T=\frac{1}{2}mv^2$
* work-energy relation: $W=T_f-T_i$
* Conservation of mechanical energy
* equilibrium: stable, unstable, neutral

# Gravitation

* Kepler's Law:
  * The orbit of each planet is an ellipse with the Sun at one focus
  * The line joining any planet and the Sun sweeps out areas in equal ties
  * The square of the period of revolution of a planet is proportional to the cube of the planet's mean distance of the Sun
* Gravitation: $\vec F_{21}=-G\frac{m_1m_2}{r_{12}^3}\vec r_{12}$
* potential energy: $U=-G\frac{mm'}{r}+U_0$
* accretion: $\Delta E=G\frac{m'm}{R}$

# Dynamics of Many-Partical System

* COM(center of mass): $\vec r_C=\frac{1}{m_C}\sum_{i}m_ir_i$
* C-frame:
  * $\vec p'=0$
  * $\frac{d}{dt}\vec L=\vec M_{ext}$
* system of variable mass: $m\frac{d\vec v}{dt}=\vec F_{ext}+(\vec u+\vec v)\frac{dm}{dt}$
* collisions
  * head-on
* equation of continuity: $\rho Av=Constant$
* Bernoulli's equation: $p+\frac{1}{2}\rho v^2+\rho gz=Constant$

# Dynamics of a Rigid Body

* principal axis of inertia: $\vec L=\vec I\omega$
* rotational inertial: $I=\int\rho^2dm$
* parrallel axis theorem: $I=I_C+md^2$
* perpendicular axis theorem: $I_z=I_x+I_y$
* kinetics: $T=\frac{1}{2}I\omega^2$
* power: $P=\vec M\cdot \vec \omega$
* precession: $\Omega=\lim_{\Delta t\rightarrow0}\frac{\Delta\phi}{\Delta t}=\frac{mgr}{I\omega}$

# Oscillation

* Hooke's law: $F=-kx$
* Equation of motion: $\ddot{x}+\omega_0^2x=0$, $\omega_0=\frac{k}{m}$
* Energy: $E=\frac{1}{2}m\dot{x}_0^2+\frac{1}m\omega_0^2x_0^2$
* Damped oscillation
  * $\ddot{x}+\frac{\eta}{m}\dot{x}+\omega_0^2x=0$
  * $x=Ae^{-\gamma t}cos(\omega t+\varphi)$
  * $\gamma=\frac{\eta}{2m},\omega^2=\omega_0^2-\gamma^2$
  * critical damping: $\eta=2m\omega_0$
  * $\langle E\rangle=\frac{1}{2}mA^2\omega_0^2e^{-2\gamma t}$
  * quality factor: $Q=\frac{m\omega}{\eta}$
* Nonlinear oscillation:
  * hard-spring
    * $F=-(1+Bx^2)kx$
    * $\ddot{x}+\alpha x+\beta x^3=0$
  * soft-spring
    * $F=-(1+Bx)kx$
  * attractor
    * equilibrium point
    * periodic otionor a limit cycle $\Gamma$
    * quasi-periodic motion
* Forced osillation friction
  * $\ddot{x}+2\gamma\dot{x}+\omega_0^2x=\frac{F_0}{m}cos\omega t$

# Waves

* Wave function: $\frac{\partial^2u}{\partial x^2}-\frac{1}{v^2}\frac{\partial^2u}{\partial t^2}=0$
* solution form:
  * $u(x,t)=Acos(kx\mp\omega t-\varphi)$
  * $u(x,t)=Re(Ae^{i(kx-\omega t)})$
  * $\frac{\omega}{k}=v$
  * Amplitude: $A$
  * frequency: $f=\frac{\omega}{2\pi}$
  * phase: $\Phi=kx-\omega t-\varphi$
  * wave vector: $\vec k$
  * wave vector: $k$
  * phase speed: $v_p=\frac{\omega}{k}$
  * wavelength: $\lambda=\frac{2\pi}{k}=Tv_p$
  * wavefront: a surface with constant phase
* AM wave(amplitude-modulated wave)
  * $u_1=Acos((k+\Delta k)x-(\omega+\Delta\omega)t)$
  * $u_2=Acos((k-\Delta k)x-(\omega -\Delta\omega)t)$
  * $u_1+u_2=2Acos(\Delta kx-\Delta\omega t)cos(kx-\omega t)$
  * group velocity: $v_g=\frac{d\omega}{dk}$
* standing wave
  * $u_1=Acos(kx-\omega t-\phi)$
  * $u_2=Acos(kx+\omegat)$
  * $u_1+u_2=2Acos(kx-\frac{\phi}{2})cos(\omega t+\frac{\phi}{2})$
  * half-wavelength loss
  * fundamental: $f_1=frac{v}{2L}$
  * harmonics:$f_n=nf_1$
* interference
  * $u_1=cos(kx-\omega t-\phi)$
  * $u_2=cos(kx-\omega t)$
  * $u_1+u_2=2Acos\frac{\phi}{2}cos(kx-\omega t-\frac{\phi}{2})$
  * $cos^2\frac{\phi}{2} = 1,\phi=m\pi,\Delta m\lambda$
  * $cos^2\frac{\phi}{2} = 0,\phi=(2m+1)\pi,\Delta (m+\frac{1}{2})\lambda$
* Huygen's principle
* diffraction
* Doppler effect

# Relativistic Mechanics

* Sepcial theory of relativity
  * The principle of relativity
  * The principle of the constancy of the speed of light
* Lorentz transformation:

$$\left[\begin{matrix} x'\\y'\\z'\\ict'
    \end{matrix}\right] = \left[\begin{matrix}
    \lambda & 0 & 0 &i\beta\gamma\\ 0 & 1 & 0 & 0\\ 0 & 0 & 1 & 0\\ -i\beta\gamma & 0 & 0 & \gamma
    \end{matrix}\right]\left[\begin{matrix}
    x\\y\\z\\ict\end {matrix}\right]$$

* $\gamma=\frac{1}{\sqrt{1-\beta^2}},\beta=\frac{u}{c}$
* spacetime interval of event pair: $(\Delta s)^2=(c\Delta t)^2-(\Delta x)^2-(\Delta y)^2-(\Delta z)^2$
  * timelike: $(c\Delta)^2>(\Delta x)^2$, $\Delta\tau=\sqrt{(\Delta t)^2-(\frac{\Delta x}{c})^2}$
  * spacelike: $\Delta\sigma=\sqrt{(\Delta x)^2-(c\Delta t)^2}$
  * lightlike: $(c\Delta)^2=(\Delta x)^2$
* time dilation: $\Delta t=\gamma\Delta t'$
* Lorentz contraction
* velocity transformation
* $E^2=c^2p^2+m_0^2c^4$
* $E=mc^2$