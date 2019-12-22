---
title: icarus-verilog 
date: 2018-11-18
tags: [mac, config]
---

# Verilog

## Mac

* brew install icarus-verilog
* download software Scansion

<!--more-->

## Compile

* iverilog -s \<top module\> -o \<output file\> \<.v\>

## Simulation

* vvp -n \<output file\>

### Test bench

* $dumpfile("name.file");
* $dumpvars;
* $dumpvars(0,topmodule.submodule);
* $dumpall;