---
title: Lamda-2 组会
date: 2019-09-11
tags: [ml]
---

# Summary

## 审稿过程

* Initial Check: 1~14 days
  * Editor Assistant 检查文章格式
* With Editor：14~30 days
  * Associate Editor: 对文章进行初步审查
* Under Review(Peer Review)：7~180 days
  * PC 3-5: Give Scores and Review/Comments
* Required Review Completed：1~5 days
  * Senior PC(SPC): judge reviews
  * Rebuttal
* Editor Decision
  * Area Chairs(AC): decide
* 数学
  * 数字信号处理
  * 随机过程
  * 矩阵论

<!--more-->

## Essay 构成

* Problem: What is the problem?
  * Related-work/Existing methods
  * 问题是否存在？
* Challenge
  * Future Challenge
* Contribution
  * 非 trick
  * 需要 insight
* Method/Main idea
  * 需要 make senses
* Experiment
  * Prove Method
  * benchmark + baseline
* *Review*
  * 对于不认可的地方，要求 show
* *Rebuttal*

# Share, 2019.9.16

IJCAI-19

## Meta-Learning for Low-resource Natural Language Generation in Task-oriented Dialogue Systems

* Problem: Meta-Learning(Learn to Learn)
  * 训练场景与训练场景不同
  * f,L,D
  * Tranditional: find $f^*\rightarrow \hat y$
  * Meta: find $F(T)\rightarrow f^*$
  * 与 Transfer Learning 区别：不要求是相关任务
  * 与 AutoML 区别
* Challenge: Task 需要有分布
* Method: 固定模型，只调参数
  * 初始值
  * 更新方式
* *有些方向可以出一大把paper，但是没法应用（会被骂，没有工业价值）*
  * *没有insight，没有application，使用特殊trick*
* $f_1(\theta^0)\rightarrow(D_{\text{train}}) f_1^*()\rightarrow(D_{\text{test}}) l_1$
  * Loss Function: $\sum_{n=1}^Nl_n$, 梯度下降

## Correct-and-Memorize: Learning to Translate from Interactive Revisions

* Existing method: 单向解码器
* Contribution：双向解码器

## Advances in Few-shot Learning

Tutorial

* One-shot learning: aim to learn information about object categories from one, or only a few, training images
* Three kinds Set
* delta-coder

## Mechanism Design in Social Networks

* Second Price Auction
  * Input: each buyer reports a price/bid to the seller
  * Output:
    * allocation: highest price
    * payment: second price
* The information Diffusion Mechanism

## Semi-supervised Learning

* Contribution: 输出滑动平均
* Method
  * Mean Teacher：参数滑动平均
  * Mixup：有标记样本做插值
  * Virtual Adversarial Training
    * 要求模型对一个样本在施加对抗噪声前后给出尽可能相同的预测值，从而对模型施加各向异性的平滑
* Review
  * 类似加冲量
    * 训练速度不要太快
    * 较慢陷入局部极小值
    * *新瓶装老酒*
  * *绝大部分 unlabel data 的使用方式都被认知了*
    * *IJCAI: 看传统 AI 和 Learning 的结合（的苗头）*
    * *不要栽进 trick 流中*
  * *“三到五年将反过来（vision 过多）”*

## Interpolation Consistency Training for semi-supervised learning 

* Contribution 对无监督样本进行插值
* Method
  * 一个网络逼近另一个模型帮助训练
  * 各种各样的假设平滑
  * 数据变化/增广口预测标记一致（几乎只能用于图像数据）
* Review: 但是无监督假设无监督样本很多
* *重在工作，不在文章数量*
  * 问题是什么，难点在哪
  * 未来可能有什么问题
  * 基本还是要保证

## Hybrid Item-Item Recommendation via Semi-Parametric Embedding

* $v=\delta z+(1-\delta)e$
  * $\delta=\sigma(w\cdot b)$
  * $e=g(c)$
  * $b$: the behavior info
  * $c$ the content info

## Invited Talks

* 融入传统机器学习的有点
  * 逻辑推理能力
  * 较好的解释性
  * 邻域专家知识
  * For better performance and robustness
  * 利用概率模型融合 deep learning 和 logic learning
* 新的挑战：适应环境变化的能力
* 对非神经网络深度学习的讨论

# Share, 2019.9.25

## Deep Learning With Customized Abstract Syntax Tree for Bug Localization

IEEE ACCESS 2019

* Problem: Bug Localization
* Related-work
  * Information Retrieval
  * Deep Learning: structure information
* Contribution: 区分 System 和 User 函数：System 函数错误更小
* *软件文章需要吹，一个芝麻可以写成西瓜*

## Cross-language clone detection by learning over abstract syntax trees

* Contribution
  * Present a cross-language clone detection method
  * Create a cross-language code clones dataset containing around 45000 files written in Java an Python
* Tree-based skip-gram

# Review, Oct 9, 2019

## Enhanced code presentation

* Reveiw: Rejected
  * Motivation: 必要性
    * 问题存在吗？
    * *问题值不值得解，小不小*
  * Contribution 技术
    * *无病呻吟？*
    * 依赖的条件过强
  * Experiment
    * 要求在另一个 benchmark 上汇报结果
    * 实验怎么做的
      * 数据如何划分？
  * 大量重复他人工作

## Comments Aided Code Completion with Coupling Gated Attention Neural Network

* Problem: Code Completion
* Contribution: utilize comments infomation
* Review
  * 程序员写完程序再写代码
  * **comment quality**
  * 数据划分有问题
  * where to predict and how to measure the performance
* Rebuttal (10.25)
  * Assumptions (but Javadoc)
    * which comes first?
      * 回复：人写的会更加 free，模拟实验和真实不同，*请展示 empirical evidence*
  * Similar continuous words may appear
    * 请展示 empirical evidence/ 请做 experiment 来 verify
    * 设计实验 (journal)
      * design 实验时就要想好（博弈过程）
      * 找 3 个数据集，找十人投票质量，按分数算上中下，在三个数据集都好，show 极端情况
  * fair comparison
    * 可能只在这种下有好效果，但在其它 fair comparison 下有可能不行
* 对于想要 Reject 的文章
  * *不信，但是要找为什么实验还能做好*
  * *看是否 make sense，而不是在 special setting 下 work*

## PU classification

* 半监督中标记都是正样本
* AUL: Area Under Lift Chart

# Tutorial, 2019.10.15

Domain Adaptation

* Source data $x\sim D_S,y\sim f_S$
  * $\epsilon_s(h,f)=\mathbb{E}_{x\sim D_S}(|h(x)-f(x)|)$
  * $\hat\epsilon_S(h,f) = \epsilon_S(h)$
* Target data $x\sim D_T,y\sim f_T$
* 假设：$f_S=f_T$
* $d_1(D_S,D_T)=2\sup_{B\in\mathbb{B}}|Pr_{D_S}(B)-Pr_{D_T}(B)|$
* T1: $\epsilon_{T}(h,f_T)=\epsilon_S(h,f_S)+\mathbb{E}_{x\sim D_S}(|f_S(x)-f_T(x)|)+d_1(D_S,D_T)$
  * source error + labeling difference + $d_1(D_S,D_T)$
* $\epsilon_T(h,f_S)\leq\epsilon_S(h,f_S)+\frac{1}{2}d_{H\Delta H}(D_S, D_T)$
* $d_H(D,D')=2\sup_{h\in H}|P_{r_D}[I(h)]-P_{r_{D'}}[I(h)]$
* T2: $\epsilon_T(h,f_T)\leq\epsilon(h^*,f_T)+\epsilon_T(h,h^*)\leq\epsilon_T(h^*,f_T)+\epsilon_S(h,h^*)+\frac{1}{2}d_{H\Delta H}(D_S,D_T)\leq (\epsilon_T(h^*,f_T)+\epsilon_S(h^*,f_s))+\epsilon_s(h,f_s)+\frac{1}{2}d_{H\Delta H}$
* $d_{H\Delta H}=2\sup_{h,h'\in H}|\epsilon_s(h,h')-\epsilon_T(h,h')|$
* $\epsilon_\alpha(h)=\alpha\epsilon_T(h)+(1-\alpha)\epsilon_S(h)$
* Conclusion: $\epsilon_T(\hat h)\leq e_T(h_T^*)+a\sqrt{ }\sqrt{}+2(1-\alpha)(\cdots)$

$$\alpha^*=\begin{cases}
1 & m_T\geq D^2\\
\min\{1,v\} & m_T\leq D^2
\end{cases}$$

* $D=\frac{\sqrt{d}}{A}$

# Review 2019.10.25

## Class Prior Estimation with Biased Positives and Unlabeld Examples

* Problem: PU Class Prior Estimation
* Related-work
  * 有假设: $D_u=\alpha D_p+(1-\alpha) D_N$
    * $f(x)=\alpha f_1(x)+(1-\alpha)f_0(x),f,f_1$ are known
      * $f_+,f_-,f_u,f_p$
  * 无假设：找到代表样本，有偏
* Challenge: 文章认为假设过于理想化
  * 有标记的正样本无法代表正样本的分布
  * *是否是 Problem*
* Contribution: $P$ 中的部分与原始成比例
* Review:
  * *需要一针见血:能否 prove*

## Deep Cost-sensitive Kernel Machine for Binary Software Vulnerbility Detection

* Problem: vulnerability (more likely a PU problem)
* Contribution
  * View as cost-sensitive
* Method
  * Data Processing and Embedding (code to vector)
  * Feature Representation
  * Cost-sensitive Kernel Machine
* Review: 如何 Reject
  1. *Why kernel machine, RNN, Fourier Transform?* 总体框架上的问题
     * *不要看实验来理解方法。应该先看原理，实验只是用来证明*
     * ne class SVM
     * 文章没有把道理讲清楚，*意见中没讲清楚的可以装糊涂*
  2. baseline 没比全

# Sharing, 2019.10.31

## graph emedding

* flow chart naturally shows the program logic
* Embed the flow chart with graph embedding technologies to generate a structure information representation
* 利用 graph embedding 技术提取结构信息

## A survey on graph embedding

A Comprehensive Survey of Graph Embedding: Prolems, Techniques, and Applications

* 了解解决问题的工具，每一个种类的工具的特点
* 做 Survey 的方法
* 先看为什么，再看怎么做的
* Problem Settings
  * Input
    * Homogeneous Graph
    * Heterogeneous Graph
    * Graph with Auxiliary Information
    * Graph Constructed from Non-relational Data
  * Output
    * Node embedding
    * Edge embedding
    * Hybrid Embedding
    * Whole-Graph Embedding
* Techniques
  * Matrix Factorization
    * 图以邻接矩阵表示，补全邻接矩阵
  * Deep Learning
    * With random walk
      * DeepWalk
    * Without random walk
      * Whole-graph embedding
  * Edge Reconstruction
  * Graph Kernel
    * Graphlet
    * Subtree patterns
    * Random walks
  * Generative Model

GRU cell

## Graph Convolutional Gaussian Process

# Share 11.8

## Graph Convolutional Gaussian Processes

Ian Walker and Ben Glocker

* Mimic the convolution layer with Gaussian Processes
  * Expressibility
* This paper extend to general graphs
  * Suppose: the number of vertices are same
  * want to learn: $\mathbb{R}^{|V|\times d}\rightarrow\mathbb{R}$
* $g(x)\sim\text{GP}(0,k())$
  * dimension curse
  * no structure
* $\Omega$: a set of subsets
  * $f(x)=\sum_{\omega\in\Omega}g_\omega(\omega),g_\omega\sim\text{GP}(0,k())$
* 一个工作看的角度不同，做出的效果不同
* 出生在神经网络时代的人一直在刷 Performance
* 培养出 taste/view，用 taste 选择问题

## RobustFill: Neural Program Learning under Noisy I/O (ICML 2017)

* given a set of input-output strings $(I_1,O_1)...(I_n,O_n)$ and a set of unpaired input strings $I_i^Y$ and output strings $O_1^Y$
* Learn P: $O_i=P(I_i)$
* Challenges
  * Real world data is small (205 instances, each with 10 I/O examples, 4 as observed, 6 as assessment)
  * Input is a variable-length set of paired I/O examples
* Domain Specific Language(DSL)
* Deep Learning: 科学问题工程化近似实现

# Share 11.14

## Pythia: AI-assisted Code Completion System (KDD'19)

Microsoft, Industrial Track

* Code Completion: List out all possible attributes or methods when a user types a "."
* Previous Method
  * alphabetically
  * Frequency based code completion
  * Association rule
  * KNN
  * Bayesian Network
  * n-grams
  * RNN based: NLP
* main contribution
  * python in IDE
  * end-to-end LSTM

## Selecting Representative Examples for Program Synthesis (ICML'18)

## Open Vocaulary Learning on Source Code (ICML'19)

* main contribution

# Share 11.29

## Literature Review on Automatic Program Repair(APR)

综述

* 定义：automatic process that
  * localize whter a fix could bbe applied
  * fix the fault
  * verify
* Generate-and-Validate
  * GneProg(ICSE'12)
    * Slecet a location randomly
    * Apply atomic operators
    * Apply single-point crossover
    * Preserve that candidates with high fitness
  * CapGen(ICSE'18)
  * SimGen(ISSTA'18)
* Semantics-driven
  * SemFix(ICSE'13)
    * Constraints Generation
* End-to-End Program Repair
  * SequenceR(TSE'19)
    * Challenge
      * Noisy data
      * Out of Vocabulary
      * Long dependency
    * Methods
      * Foucus on one-line fixes
      * Copy mechanism
      * Abbstract buggy context

## Gotcha - Sly Malware!: Scorpion A Metagraph2vec Based Malware Detection System (KDD'18)

* malware detection
  * signature-based(be easily evaded)
  * monitoring behaviors from OS(expensive)
* intelligent malware detection systems
  * content-bbased(lack of relations)
    * API used
  * relation-based(contains a few relations)
* content- & relation- based
  * HIN (structures)
    * PE file, API, DLL, Machine, Archive
  * meta-graphs(sementics)
  * vectors(low-dimensional representations)
* KDD 近15年内，每年都有 Graph
* 难以干掉

# Share 12.13

## Neural Guided Constraint Logic Programming for Program Synthesis

## Neural Synthesis from Diverse Demonstration Videos

* program induction
  * lack of interprtability
* program synthesis
  * lack of expressibility
* imitation learning
  * acquire skills from expert demonstrations
* demonstartions: $D=\{\tau_1,\cdots,\tau_K\}$
  * $((s_1,a_1),\cdots,(s_T,a_T))$

# Share 12.20

## A convolutional attention network for extreme summarization of source code (ICML'16)

* code summarization: 生成注释
* extreme code summarization: 生成函数名

## Automatic Program Synthesis of Long Programs with a Learned Garbage Collector (18)

* Domain Specific Language
* 搜索做不大
