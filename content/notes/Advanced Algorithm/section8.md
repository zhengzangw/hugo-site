---
title: 8. Rounding Linear Programs
date: 2019-09-04
tags: [algorithm, math, notes]
weight: 8
---

* LP Relaxation & Rounding
  * Represent problem as ILP
  * Relaxation: relax ILP to LP
  * solve LP
  * Rounding: round fractional optimal solution
  * Integrality Gap = $\sup_I\frac{\text{OPT}(I)}{\text{OPT}_{\text{LP}}(I)}$
* Vertex Cover
  * Integer Linear Program (ILP)
    * $\min \sum_{v\in V}x_v$
    * s.t. 
      * $\sum_{v\in e}x_v\geq 1,e\in E$
      * $x_v\in {0,1},v\in V$
  * Linear Program (LP) relaxation
    * $x_v\in [0,1]$
  * Integrality Gap: $2$
* MAX-SAT