---
title: 数据压缩
date: 2019-02-27
weight: 3
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
  - MPEG-2 BC：支持 Linear PCM 和 Dolby AC-3 编码
  - MPEG-2 AAC：利用掩蔽特性减少数据量，并把量化噪声分散到各个子带中，用全局信号把噪声掩蔽掉
- MPEG4

![Audio](/images/content/multimeida-audio.png)

## 图像数据压缩标准

- gif, png：词典编码
- bmp: RLE
- JPEG(.jpg)：以 DCT 为基础的有损压缩算法
  - 正向离散余弦变换 FDCT
  - 量化 quantization
  - Z字形编码
  - 使用 DPCM 对直流系数编码
  - 使用 RLE 对交流系数编码
  - 熵编码
- JPEG2000(.jp2)

## 视频数据压缩标准

- 视频压缩标准
  - ITU-T: H.261(1990) - H.262(1994) - H.263 - H.264
  - ISO: MPEG1(1992) - MPEG2 - MPEG4 - MPEG7 - HEVC(H.265, 2013)
  - Google: VP9, VP8
  - Microsoft Inc.: VC-1
  - 我国研发：AVS
- MPEG
  - 空间方向用 JPEG 去掉冗余
  - 时间方向用移动补偿算法
    - 帧内图像 $I$
    - 预测图像 $P$
    - 插补图像 $B$
  - 块匹配法