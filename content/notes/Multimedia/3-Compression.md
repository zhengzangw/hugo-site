---
title: 数据压缩
date: 2019-02-27
---

## 无损数据压缩

- 压缩率 = 未压缩/压缩后
- Huffman 编码
- 算术编码
  - 任意消息用 0 到 1 之间的实数进行编码
  - 根据出现概率确定区间
- 词典编码
- RLE（行程）编码

## 音频数据压缩标准

- 话音信号特点
  - 幅度的非均匀分布
  - 样本相关
  - 周期相关
  - 基音相关
  - 静止稀疏
  - 长时间自相关
- 话音编码器
  - 波形编译码器
    - PCM (G.711 64kb/s)
    - 增量调制 $\Delta M$: CFDM, CVSD
    - APCM
    - DPCM
    - ADPCM (G.721 32kb/s)
    - SB-ADPCM (G.722 48kb/s + 16kb/s)
  - 音源编译码器
    - LPC 线性预测编码
  - 混合编译码
    - MPE, RPE, CELP
- 人类听觉特点
  - 听觉掩蔽效应：一种频率的声音阻碍听觉系统感受另一种频率的声音
    - 频域掩蔽：同时，高纯掩低纯
    - 时域
  - 临界频带
- MPEG1 Audio
  - Layer1: 频带相等子带（6bit 量化），频域掩蔽特性
  - Layer2：+时间掩蔽特性，低频度 4 比特，中频带 3 比特，高度 2 比特
  - Layer3：非等宽 + Huffman + MDCT
- MPEG2 Audio
  - MPEG-2 BC
  - MPEG-2 AAC
- MPEG4

![Audio](/content/multimeida-audio.png)

## 图像数据压缩标准

## 视频数据压缩标准