---
title: Concepts
date: 2019-02-12
weight: 1
---

## Concepts

### Geometry Optics

- 光的直线传播定律
- 光的反射定律
  - 法向量：$N$
  - 入射光：$L$ （归一化）
  - 反射光：$R=2(N\cdot L)N-L$
- 光的折射定律
  - Snell's law: $\eta_L\sin\theta_L=\eta_T\sin\theta_T$
  - $T=-N\sqrt{1-\frac{\eta^2_L}{\eta^2_T\sin^2\theta_L}\sin^2\theta_L}-\frac{\eta_L}{\eta_T}[L-(N\cdot L)N]=(\frac{\eta_L}{\eta_T}N\cdot L-\sqrt{1-\frac{\eta_L^2}{\eta_T^2}[1-(N\cdot L)^2]})N-\frac{\eta_L}{\eta_T}L$
  - Total Internal Reflection
- 基本假设
  - Linearity
  - Energy conservation
  - Steady state
  - No polarization
  - No fluorescence or phosphorescence

### Radiometry and Color

- Radiometry: the science of measuring radiant energy transfer
- Radiometric Quantities
  - Energy
  - Radiant power (total flux) $\Phi,P$ 功率 (J/s, W)
  - Irradiance (flux density) $E$: total radiant power per unit area incident onto a surface
    - Inverse square law: $E=\frac{\Phi}{4\pi r^2}$
    - Lambert's law: $E=\frac{\Phi\cos\theta}{A}$
  - Radiosity (flux density) $B$: total radiant power per unit area leaving a surface
  - Intensity $I$: flux density per solid angle $I=\frac{d\Phi}{d\omega}$
    - isotropic point source: $\Phi=4\pi I$
  - Radiance $L$: total flux traveling at some point $x$ in a specified direction $\omega$, per unit area perpendicular to the direction of travel
    - $L(x,\omega)=\frac{d^2\Phi}{dA\cos\theta d\omega}$
    - 沿光线传输方向，radiance 不变（真空），sensors response is proportional to radiance
- Solid Angles $\omega$: the solid angle subtended by an object is the surface area of its projection on to the unit spher
  - $d\omega=\frac{dA\cos\theta}{r^2}$
  - 球坐标系：$\sin\theta d\theta d\phi$
- Spectrum: 370nm - 730nm
  - SPD: Spectral Power Distribution
  - photometry: 物理量转换为视觉感知量

### BRDF and The Rendering Equation

- Bidirectional Reflectance Distribution Function: $f_r(\omega_i\rightarrow\omega_r)\equiv\frac{L_r(\omega_r)}{L_i(\omega_i)\cos\theta_i d\omega_i}$ (辐射率 $L$ 和辐照度 $E$ 的比值，对入射光改变的能力，材质，六维函数)
- The Reflection Equation(local direct illumination model): $L_r(\omega_r)=\int_{\Omega_i}f_r(\omega_i\rightarrow\omega_r)L_i(\omega_i)\cos\theta_id\omega_i$
- The Rendering Equation: $L_o(x,\omega_o)=L_e(x,\omega_o)+\int_{\omega_i\in\Omega_+}f_r(\omega_i,x,\omega_o)L_i(x,\omega_i)\cos\theta_id\omega_i$
  - 迭代计算：$L_o(x,\omega_o)=L_e(x,\omega_o)+\int_{y\in S}f_r(\omega_i,x,\omega_o)L_o(y(x,\omega_i),-\omega_i)V(x,y)G(x,y)dA_y$
  - Ligiting Simulation = Solving the Rendering Equation
    - Monte Carlo Methods (Ray tracing, path tracing...)
    - Finite element methods (Classic radiosity)