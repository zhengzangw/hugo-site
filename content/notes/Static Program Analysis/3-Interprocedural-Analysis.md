---
title: Interprocedural Analysis
date: 2020-04-26
weight: 3
---

## Call Graph (CHA)

- Call Graph Construction for OOPLs
  - Classic hierarchy analysis (CHA)
  - Pointer analysis (k-CFA)
- Dispatch(c, m) = m' if c contains non-abstract method m' that has the same name and descriptor as m
  - else = Dispatch(c', m), c' is superclass of c
- Resolve(a.foo())
  - virtual call: Dispatch self and subclass

## Interprocedural Control-Flow Graph

- ICFG: represents structure of the whole program
  - ICFG = CFGs + call & return edges
  - node transfer + edge transfer
