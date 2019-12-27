---
title: Compressing
date: 2019-09-02
weight: 6
---

* 压缩率 $C=\frac{b}{b'}$
* 相对冗余 $R=1-\frac{1}{C}$

## 冗余
  
### 编码冗余

* $r_k$: $M\times N$ 大小图像的灰度数值
  * $p(r_k)=\frac{n_k}{MN}$
  * 变长比特数：$L_{\text{avg}}=\sum_{k=0}^{L-1}l(r_k)p_r(r_k)$
  * 固定比特数：$l(r_k)=m,L_{\text{avg}}=m$

### 空间和时间冗余

* 行程对（run-length pairs）
  * 灰度值：某灰度连续出现的次数
* 相邻像素的灰度差
* 映射
  * 可逆映射
  * 不可逆映射

### 不相关的冗余

* 有损压缩
  * 被视觉系统忽略的信息
  * 与图像用途无关的信息
* 量化

## 度量

* 信息：$I(E)=\log\frac{1}{P(E)}=-\log P(E)$
  * $m$ 为底：$m$元单位
  * $2$：比特
* 熵：$H=-\sum_{j=1}^JP(a_j)\log P(a_j)$
  * 信源符号：$a_j$
  * 零记忆信源：独立
* 灰度信源的熵：$H=-\sum_{k=0}^{L-1}p_r(r_k)\log_2p_r(r_k)$ (bits/pixel)
* 香农第一定理：$\lim_{n\rightarrow\infty}\frac{L_{avg,n}}{n}=H$
  * 图像像素有相关性：马尔科夫信源，有限记忆信源
* 保真度
  * $e(x,y)=\hat f(x,y)-f(x,y)$
  * 总误差：$\sum\sum |e(x,y)|$
  * 均方根误差：$e=(\frac{1}{MN}\sum\sum e(x,y)^2)^{\frac{1}{2}}$
  * $\text{SNR}_{\text{ms}}=\frac{\sum\sum \hat f(x,y)^2}{\sum\sum e(x,y)^2}$
  * 主观误差

| 二值图像压缩方法 | 组织          | 描述             |
| ---------------- | ------------- | ---------------- |
| CCITT 3          | ITU-T         | 行程，霍夫曼编码 |
| CCITT 4          | ITU-T         | 二维行程         |
| JBIG(JBIGI)      | ISO/IEC/ITU-T | 算术编码         |
| JBIG2            | ISO/IEC/ITU-T |                  |
| TIFF             |               |                  |

| 连续色调图像 | 组织          | 描述                     |
| ------------ | ------------- | ------------------------ |
| JPEG         | ISO/IEC/ITU-T | DCT,霍夫曼编码，行程编码 |
| JPEG-LS      | ISO/IEC/ITU-T |                          |
| JPEG-2000    | ISO/IEC/ITU-T | DWT                      |
| BMP          | Microsoft     | 未压缩                   |
| GIF          | CompuServe    | LZW编码                  |
| PDF          | Adobe Systems |                          |
| PNG          | W3C           |                          |
| TIFF         | Aldus         |                          |

| 视频       | 组织      | 描述                 |
| ---------- | --------- | -------------------- |
| DV         | IEC       | DCT                  |
| H.261      | ITU-T     | DCT,预测差分         |
| H.262      | ITU-T     | MPEG-2               |
| H.263      | ITU-T     |                      |
| H.264      | ITU-T     |                      |
| MPEG-1     | ISO/IEC   |                      |
| MPEG-2     | ISO/IEC   |                      |
| MPEG-4     | ISO/IET   |                      |
| AVS        | MII       | Golomb编码，中国标准 |
| HDV        | 公司联盟  |                      |
| M-JPEG     | 多家公司  |                      |
| Quick-Time | Apple     | 媒体容器             |
| VC-1       | SMPTE     |                      |
| WMV9       | Microsoft |                      |

## 图像压缩

* (Mapper -> Quantizer -> Symbol coder)[encoder] -> (Symbol decoder -> Inverse mapper)[decoder]
  * Mapper: 转换为便于去掉空间和时间冗余，可逆
  * Quantizer: 根据保真度准则降低精度，不可逆
  * Symbol decoder: 生成定长/变长编码
* 霍夫曼编码：对符号概率排序，合并低概率符号
* 行程编码(run-length pairs)
* 符号编码：将图像表示为符号的集合
  * 符号：图像中频繁出现的子图像
  * 三元组集合：$\{(x_1,y_1,t_1),\cdots\}$

## 水印

* 特点
  * 增加信息
    * 可见水印
    * 不可见水印
  * 不能分离
* 用途
  * 版权，用户识别
  * 证明真实性
  * 自动监控
  * 复制保护
* 简单的可见水印：$f_w=(1-\alpha)f+\alpha w$
* 简单的不可见水印：$f_w=4(\frac{f}{4})+\frac{w}{64}$
* 基于 DCT(离散余弦变换) 的不可见水印
