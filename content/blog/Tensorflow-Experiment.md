---
title: Tensorflow Experiment
date: 2018-08-28
tags: [ml, tensorflow]
---

# 前言

《深度学习》终于获得了“过半警告”，不过CNN,RNN都还没学。前面的很多算法都没有实践看过效果，决定在Tensorflow上实现一下。

参考的资料有：《Tensorflow 实现Goolge深度学习框架》 莫烦的网络教程、

这个系列尽可能做的好一点，加深对参数的理解和使用

<!--more-->

# 实验一：简单MLP搭建

## 实验目标

### Easy

* 完成单隐层神经网络的程序
* 观察是否有bias在异或数据集上的效果
* 观察输出层激活函数在异或数据集上的效果
* 观察隐层激活函数在异或数据集上的效果
* 观察小批量梯度下降的效果
* 观察MSE和cross_entropy损失函数在异或数据集上的效果
* 设置单隐层宽度
* 设置多隐层
* 设置学习率

### Hard

* 理解滑动平均模型
* 调节Adam算法参数，比较其与Gradient Descent的优劣

## 实验结果

数据随机生成，数据量 100
对照实验为：SGD(batch = 8),GD(alpha=0.5),输出层激活函数sigmoid,损失函数cross_entropy
共500轮，每50轮输出一次

### 对照实验性能

>Turn 400, loss is 0.0004411380796227604, MSE is 0.529999315738678  
>Turn 450, loss is 0.00038424794911406934, MSE is 0.5299994349479675  
>Turn 500, loss is 0.00033973221434280276, MSE is 0.5299995541572571

### 无激活函数

无法完成该任务

### 隐层使用激活函数

效果竟然没有一开始好了

>Turn 400, loss is 0.003771318821236491, MSE is 0.5296160578727722  
>Turn 450, loss is 0.0033036477398127317, MSE is 0.5296692848205566  
>Turn 500, loss is 0.002936921315267682, MSE is 0.5297102332115173

### 使用MSE作为优化目标

>Turn 400, loss is 0.1910565048456192, MSE is 0.032664474099874496  
>Turn 450, loss is 0.180148646235466, MSE is 0.030407795682549477  
>Turn 500, loss is 0.17121551930904388, MSE is 0.028623349964618683

### 使用批量梯度下降

$8*500 = 4000 = 40 * 100$。 同样的时间内，批量梯度下降第50轮的损失远高于小批量梯度下降。可见下批量梯度下降优。

>Turn 400, loss is 0.00047387450467795134  
>Turn 450, loss is 0.00041323609184473753  
>Turn 500, loss is 0.0003657971683423966

在拟合二次函数时，batch过小将导致欠拟合

### 隐层宽度由3变4

一开始快一点

> Turn 400, loss is 0.0004357126308605075  
> Turn 450, loss is 0.0003805999003816396  
> Turn 500, loss is 0.000337266712449491

### 两隐层&设置学习率

第一隐层宽3，第二隐层宽2，效果显著

> Turn 400, loss is 9.72636480582878e-05  
> Turn 450, loss is 8.47108312882483e-05  
> Turn 500, loss is 7.491506403312087e-05

第一隐层宽2，第二隐层宽2，500达到上方350轮效果

> Turn 400, loss is 0.00016509427223354578  
> Turn 450, loss is 0.00014309250400401652  
> Turn 500, loss is 0.00012597450404427946

alpha = 1

> Turn 400, loss is 4.294736936572008e-05  
> Turn 450, loss is 3.740956890396774e-05  
> Turn 500, loss is 3.316783477202989e-05

alpha = 10/100
直接到0

alpha = 1000
无法收敛，8.289306640625

### Adam优化

同样适用alpha = 0.5,其它参数默认值情况下轮前就达到了0.0  
> Turn 0, loss is 0.5095147490501404  
> Turn 50, loss is -0.0

# 实验1.5：优化方法实验

## 实验目标

在单隐层（宽3）、异或数据集上理解、实践以下优化算法：

* Gradient Descent
* AdamDelta
* AdaGrad
* Momentum
* Adam
* RMSprop

<!--more-->

## 实验结果

### 《深度学习》8.3基本算法

#### SGD

$g = gradient$  
$theta = theta - alpha * g$

#### Momentum

$g = gradient$  
$v = rou * v - alpha * g$  
$theta = theta + v$  
最大速度倍数为$\frac{1-rou}{1}$  
常用取值0.5,0.9,0.99

2倍时

> Turn 400, loss is 0.00015466260083485395
> Turn 450, loss is 0.00013605377171188593
> Turn 500, loss is 0.00012112771946704015

10倍时，50轮之内达到0

#### Nesterov 动量

v = rou * v - alpha * g(theta+rou*v)
theta = theta + v

### 参数自适应学习率算法

#### AdaGrad

g = gradient  
r = $r + g^2$  
theta = theta - $\frac{alpha}{10^{-7}+\sqrt{r}}*g$  
缩放每个参数反比与其所有梯度历史平方总和的平方根，净效果是在参数空间中更为平缓的倾斜方向会取得更大的进步

> Turn 400, loss is 0.00014595562242902815  
> Turn 450, loss is 0.00012745874118991196  
> Turn 500, loss is 0.00011293470743112266

#### RMSProp

加入了指数衰减  
g = gradient  
r = rou\*r + (1-rou)\* g^2  
theta = theta - $\frac{alpha}{10^{-7}+\sqrt{r}}$*g  
rou = 0.5 100轮0

#### AdaDelta

g = gradient  
r = rho\*r + (1-rho)\*g^2  
RMS = $\sqrt{r}+alpha$  
theta = theta - $\frac{RMS_{t-1}}{RMS_{t}}$*g

#### Adam

建议默认值： 0.001,0.9,0.999  
g = gradient  
s = $\frac{rou1*s+(1-rou1)*g}{1-rou1^2}$  
r = $\frac{rou2*r+(1-rou2)*g*g}{1-rou2^2}$  
theta = theta - alpha*$\frac{s}{\sqrt{r}+10^{-8}}$

# 实验二：MNIST数据集实战

## 实验目标

### EASY

* 完成带滑动平均、指数衰减、正则化的单隐层神经网络
* 完成tensorflow代码规范化
* 设置学习率相关参数
* 设置正则化相关参数
* 设置滑动平均参数
* 比较以上优化性能

### HARD

* 探索网络宽度和深度的影响

<!--more-->

## 实验结果

### 第一项性能

batch = 100  
> After 30000 training step(s), test accuracy using average model is 0.9837999939918518  

### 规范化后

规范化后，train和eval两个过程分开进行。网络与上一个相同。在30000轮后：
> After 30001 training step(s), loss on training batch is 0.03692609444260597.  
> After 30001 training step(s), validation accuracy = 0.9846000075340271  
> After 30001 training step(s), test accuracy = 0.9843000173568726

### 正则化讨论

我们发现，如果不使用任何正则化，cross entropy下降的飞快：
> After 5001 training step(s), loss on training batch is 0.0019425891805440187.  
> After 30001 training step(s), loss on training batch is 0.0003114454448223114.

但是正确率缺不及0.0001L2正则化，并且很快就收敛了

> After 4001 training step(s), validation accuracy = 0.9832000136375427  
> After 30001 training step(s), validation accuracy = 0.9837999939918518  
> After 30001 training step(s), test accuracy = 0.9830999970436096

我们尝试调节正则化参数。默认的参数是1e-4。我们首先估计一下数量级：  

* 不使用正则化时：MSE -- 1e-3 to 1e-4
* 使用正则化系数1e-4时：Loss -- 1e-2
* 参数 -- 1e-1 to 1e-2
* 参数个数 -- 1e5
* L2范数 -- 1e3 to 1e4

我们估计正则化参数应在1e-3至1e-4间。若太大，其主导太强；若太小，影响太弱。

当lamda = 0.001时，模型前期下降速度明显减缓，2000轮后就出现损失率振荡现象
> After 2001 training step(s), loss on training batch is 0.21251729130744934.  
> After 30001 training step(s), loss on training batch is 0.17756156623363495.

8000轮后正确率不再提升
> After 8001 training step(s), validation accuracy = 0.9811999797821045  
> After 30001 training step(s), validation accuracy = 0.9807999730110168  
> After 30001 training step(s), test accuracy = 0.98089998960495
这时，性能反而下降。种种现象说明1e-3太大，使得模型欠拟合了

当lamda = 0.00005时，  
First Test

> After 30001 training step(s), loss on training batch is 0.03040509857237339.  
> After 30001 training step(s), validation accuracy = 0.9850000143051147  
> After 30001 training step(s), test accuracy = 0.9829999804496765

Second Test

> After 30001 training step(s), loss on training batch is 0.029661739245057106.  
> After 30001 training step(s), validation accuracy = 0.984000027179718  
> After 30001 training step(s), test accuracy = 0.9832000136375427
这个参数气起到了防止过拟合的效果，但不够彻底，不比0.0001优。

当lamda = 0.0005时，也出现了振荡。这个数字可能还是稍大。
> After 30001 training step(s), loss on training batch is 0.11202621459960938.  
> After 30001 training step(s), validation accuracy = 0.9847999811172485  
> After 30001 training step(s), test accuracy = 0.9830999970436096

如此lambda的大致范围已经确定了。我们尝试微调lambda，看看有什么好的效果。  
lambda = 0.0003，第9000轮Validation上的性能达到了0.985。
> After 30001 training step(s), loss on training batch is 0.06975933909416199.  
> After 30001 training step(s), validation accuracy = 0.9861999750137329  
> After 30001 training step(s), test accuracy = 0.9848999977111816
我们发现这次性能有小幅提升。为了确定不是欧气影响，我再试了一次，发现脱欧入非了。

我们发现，在有效防止过拟合和避免欠拟合之间参数还有一定的选择范围。我们首先要确定这个可行域，再在可行域内微调到一个最好的值。
可行域内loss从1e-4退到1e-2，提高1e-3的精度，参数更改可以影响1e-4的精度。

我们尝试使用L1范数，果然出现了很多0值，并且参数范围约1e-1 to 1e-6。
我们先使用lambda = 0.0001，发现了振荡现象。效果并不理想
> After 30001 training step(s), loss on training batch is 0.14731723070144653.  
> After 30001 training step(s), validation accuracy = 0.9807999730110168  
> After 30001 training step(s), test accuracy = 0.9811000227928162

我们再用lambda = 0.00001, 验证集上拟合不错，但是泛化较差。
> After 30001 training step(s), loss on training batch is 0.03477011248469353.  
> After 30001 training step(s), validation accuracy = 0.9846000075340271  
> After 30001 training step(s), test accuracy = 0.9819999933242798

我们再用lambda = 0.000001,依然不够理想
> After 30001 training step(s), loss on training batch is 0.025545725598931313  
> After 30001 training step(s), validation accuracy = 0.9847999811172485  
> After 30001 training step(s), test accuracy = 0.9817000031471252

当使用1e-7时，开始有效果
> After 30001 training step(s), loss on training batch is 0.0033931396901607513.  
> After 30001 training step(s), validation accuracy = 0.9829999804496765  
> After 30001 training step(s), test accuracy = 0.9833999872207642

1e-8时几乎和没有使用正则化相同。1e-9完全没有效果了。故1e-7可能是一个号选择。

最后，我们尝试一下Elastic net regularization。我们分别用之前获得1e-4和1e-7作为参数：
我们开心的发现，效果很棒！
> After 30001 training step(s), loss on training batch is 0.03605485334992409.  
> After 30001 training step(s), validation accuracy = 0.9846000075340271  
> After 30001 training step(s), test accuracy = 0.9850999712944031

为了确认是不是欧气作祟，我再一次启动。发现跟之前的又变的差不多了。那么姑且认为选好的参数的Elastic net 不差于L2 吧。

我们再尝试把两个参数减半，发现效果并不好。后面的测试都在L2正则化下进行。

### 学习率

接下来我们探讨学习率。目前的学习率为：base=0.8,decay=0.99,1000轮约更新两次。到30000轮时，learning rate 约为0.4
若decay = 0.9, 最后只有0.0008。  
decay = 0.96, 约为0.086。经测试，此时下降过慢  
我们尝试不适用指数衰减学习：0.9838  

我们尝试使用Adam学习：
> After 30001 training step(s), loss on training batch is 0.04590621590614319  
> After 30001 training step(s), validation accuracy = 0.98580002784729  
> After 30001 training step(s), test accuracy = 0.9854999780654907

这个结果出乎我的意料。我一开始以为Adam只会是搜索更快进行。但其保留的历史记录似乎使其loss下降不如Gradient Descent快，但是泛化效果却更好。我再尝试一次，发现虽然没有这么高的数值，但是仍然比原先好。
**Why?**

当alpha从0.001变至0.01时发生振荡，学习效果不好。
当alpha为0.0001时，下降太慢，loss还处在0.05左右

我们再尝试使用带指数衰减的Adam学习,发现梯度下降到和之前一样的水平。由此之前Adam的步幅太大了。
> After 30001 training step(s), loss on training batch is 0.030896920710802078.  
> After 30001 training step(s), validation accuracy = 0.9872000217437744  
> After 30001 training step(s), test accuracy = 0.9850000143051147

看了Adam的效果很好，但是还有两个参数不熟悉。我们暂时只能其推荐值0.9和0.999
注意：Adam和L1,L2一起的组合拳效果并不理想，有待探究

### 滑动平均

我们去除滑动平均，0.9839
使用后有小幅提升

### 宽度

我们加宽一倍隐层（500->1000）, 性能显然增加了。
> After 30001 training step(s), loss on training batch is 0.03701362386345863.  
> After 30001 training step(s), validation accuracy = 0.9851999878883362  
> After 30001 training step(s), test accuracy = 0.9848999977111816

### 深度

2隐层整流线性，训练速度下降  
**Why?** 当LEARNING_BASE = 0.5并使用指数衰减时，loss变为inf。但0.5可以收敛  
利用Adam,alpha = 0.01，收敛速度太慢  
alpha = 0.1, 指数衰减，Elastic Net 正则化， 无法收敛  
多层难以训练，效果难以体现。暂时无法很好的使用。

# 实验2.5

## 实验目标

* 尝试各类激活函数
* 实现dropout
* 了解径向基网络结构

<!--more-->

## 实验结果

### 激活函数

#### 线性整流 ReLU

$g(z) = max(0,z)$  
Flaw: $x<0$ 硬饱和

> After 30001 training step(s), loss on training batch is 0.03692609444260597.  
> After 30001 training step(s), validation accuracy = 0.9846000075340271  
> After 30001 training step(s), test accuracy = 0.9843000173568726

#### 线性整流变种

$g(z,a) = max(0,z)+alpha*min(0,z)$

$leaky_relu(x) = \max(z,z*alpha)$ 即 alpha为小值  
Flaw: 均值没有保证 *Why?*  
一样的学习率下loss 0.04，accuarcy = 0.982  

relu6(x) = min(max(z,0),6) one kind of hard tanh  
crelu(x) = [ReLU(x),ReLU(-x)]  
ELU(x) = x : x>0 = alpha*(e^x-1) : x<0  
SELU(x)= lambda * ELU(x), lambda>1  

以上loss下降普遍偏慢

#### softplus

Relu 的平滑版本，下降更慢  
$g(z) = log(1+z^x)$

#### sigmoid and tanh

sigmoid(x) = $\frac{1}{1+e^{-1}}$  
tanh(x) = $\frac{1-e^{-2x}}{1+e^{-2x}}$

### dropout

隐层抽样概率为0.5，输入层为0.8  
tensorflow 中: With probability keep_prob, outputs the input element scaled up by 1 / keep_prob, otherwise outputs 0. The scaling is so that the expected sum is unchanged.  
我们发现，dropout有效防止了过拟合，和L1,L2正则化一起，最后的loss很高。  
> After 30001 training step(s), loss on training batch is 0.11102759093046188.  
> After 30001 training step(s), validation accuracy = 0.9854000210762024  
> After 30001 training step(s), test accuracy = 0.9839000105857849

我们去掉所有正则化后,loss呈现震荡，但accuracy增加，最后效果很好！
> After 30001 training step(s), loss on training batch is 0.0919218510389328.  
> After 30001 training step(s), validation accuracy = 0.9837999939918518  
> After 30001 training step(s), test accuracy = 0.9851999878883362

加上L2正则化后，性能与单有L2正则化相近。

### 径向基网络

径向基函数神经网络的优点：逼近能力，分类能力和学习速度等方面都优于BP神经网络，结构简单、训练简洁、学习收敛速度快、能够逼近任意非线性函数，克服局部极小值问题。？原因在于其参数初始化具有一定的方法，并非随机初始化。

#### 径向基函数

1. 高斯函数 $\phi(r) = e^{-\frac{r^2}{2\sigma^2}}$
2. 反演S型函数 $\phi(r) = \frac{1}{1+e^{\frac{r^2}{\sigma^2}}}$
3. 拟多二次函数 $\phi(r) = \frac{1}{(r^2+****\sigma^2)^{1/2}}$

其中，$\sigma$为基函数的扩展常数（宽度），越小则基函数的宽度越小，基函数就越具有选择性

* 全局逼近网络： 可调参数对任何一个输出都有影响
* 局部逼近网络： 某个局部区域只有少数几个连接权重影响网络输出

数学原理： 一般函数都可以表示为一组基函数的线性组合

#### 学习基函数中心

* 随机选取
* 自组织选取
* 有监督选取
* 正交最小二乘

#### 学习

学习 中心、宽度和线性权值。将输入通过基函数映射到高维空间后用线性层划分

# 实验三

## 实验目标

### Easy

* 实现基本的卷积神经网络--LeNet-5模型
* 实现LSTM的简单结构
* 实现LSTM的语言预测，在数据集PTB上

### Hard

* 实现Inception-v3框架的迁移学习 （计算资源不足，暂时不做）
* 实现机器翻译模型

<!--more-->

### 实验结果

#### LeNet-5模型

训练又慢又耗电。1000轮要耗掉10%的点，半小时才不到100000轮
学习率设置过大很容易无法收敛，0.01都过大。0.001下降速度不够快，而且可能也是大。

改用Adam,用0.001的学习率，发现效果非常好。这说明Adam的鲁棒性不是盖的：  
>After 501 training step(s), loss on training batch is 0.46121683716773987.  
>After 501 training step(s), validation accuracy = 0.9872000217437744  
>After 1001 training step(s), loss on training batch is 0.2894487977027893.

2000轮后，就可以达到：  
>After 2001 training step(s), loss on training batch is 0.20919263362884521.
>After 2001 training step(s), validation accuracy = 0.9927999973297119

#### LSTM

tensorflow 对LSTN的封装很好，代码简单

>train step: 9000, loss: 4.668378e-06  
>Mean Square Error is: 0.002043843502178788

#### PTB

> After 6500 steps, perplexity is 73.22564944927569  
> After 6600 steps, perplexity is 72.36911348195412  
> Epoch: 5 Train Perplexity: 72.57878706561621  
> Epoch: 5 Eval Perplexity: 107.28163012316921