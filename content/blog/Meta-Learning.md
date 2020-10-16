---
title: Meta Learning
date: 2019-10-07
tags: [ml, notes]
---

# Problem Statement

- Mechanistic view
  - DNN model that can read in an entire dataset and make predictions for new data point
  - Training this network uses a meta-dataset, which itself consists of many datasets, each for a different task
- Probabilistic view
  - Extract prior information from a set of tasks taht allows effcient learning of new tasks
  - Learning a new task this prior and training set to infer most likely posterior parameters
- supervised learnings
  - $\arg\max\limits_{\phi}p(\phi|\mathcal{D})=\arg\max\limits_{\phi} \log p(\mathcal{D}|\phi)+\log p(\phi)$
  - require large amounts of labeled data

<!--more-->

## Description

- meta-parameters: $\theta$: $p(\theta|\mathcal{D}_{\text{meta-train}})$
  - $\phi$&#10987;$\mathcal{D}_{\text{meta-train}}|\theta$
  - $\theta^*=\arg\max\limits_\theta\log p(\theta|D_{\text{meta-train}})=\arg\max\limits_\theta\sum_{i=1}^n\log p(\phi_i|\mathcal{D}_i^{\text{ts}}),\phi_i=f_\theta(D_i^\text{tr})$
- $\arg\max\limits_\phi\log p(\phi|\mathcal{D},\mathcal{D}_{\text{meta-train}})$
  - $\log p(\phi|D,D_{\text{meta-train}})=\log \int_\Theta p(\phi|\mathcal{D},\theta)p(\theta|D_{\text{meta-train}})d\theta\approx \log p(\phi|\mathcal{D},\theta^*)+\log p(\theta^*|\mathcal{D}_{\text{meta-train}})$
  - $\arg\max\limits_\phi\log p(\phi|\mathcal{D},\mathcal{D}_{\text{meta-train}})\approx \arg\max\limits_\phi\log p(\phi|\mathcal{D},\theta^*)$
- Dataset
  - $\mathcal{D}_{\text{meta-train}}=\{(D_1^{\text{tr}},D_1^{\text{ts}}),\cdots,(D_n^{\text{tr}},D_n^{\text{ts}})\}=$ support set
    - $\mathcal{D}_i^{\text{tr}}=\{(x_1^i,y_1^i),\cdots,(x_k^i,y_k^i)\}$
      - $k$-shot: $k$ instances per class
      - $t$-way: $t$ classes
    - $\mathcal{D}_i^{\text{ts}}=\{(x_1^i,y_1^i),\cdots,(x_l^i,y_l^i)\}$
    - $\mathcal{D}_i=\mathcal{D}_i^{\text{tr}}+\mathcal{D}_i^{\text{ts}}$
    - episode/task: $\mathcal{T}_i=D_i^{\text{tr}}+D_i^{\text{ts}}$
  - $\mathcal{D}_{\text{meta-validation}}$
  - $\mathcal{D}_{\text{meta-test}}=$ query

## Related Problem

- multi-task learning
  - special case of meta-learning where $\phi_i=\theta$
- hyperparameter optimization
  - $\theta$ = hyperparameters, $\phi$ = network weights
- auto-ML
  - $\theta$ = architecture, $\phi$ = network weights

## Dataset (few-shot image recognition)

- [Omniglot dataset](https://github.com/brendenlake/omniglot)
  - 1623 characters from 50 different alphabets
  - 20 instances of each character
- Minilmagenet
- CIFAR
- [CUB](http://www.vision.caltech.edu/visipedia/CUB-200-2011.html)
- CelebA

# Meta-learning algrithms

## Black-box adaptation

Train a neural network to represent $p(\phi_i|\mathcal{D}_i^{\text{tr}},\theta)$

- For now: use deterministic $\phi=f_\theta(D_i^\text{tr})$
  - $y^\text{ts}=f_\theta(\mathcal{D}_i^{\text{tr}}, x^\text{ts})$
- Form of $f_\theta$
  - RNN
  - LSTM
  - NTM (Neural turing machine)
  - Self-attention
  - 1D convolutions
  - feedforward + average
- Loss Function: $\mathcal{L}(\phi_i,\mathcal{D}_i^\text{ts})=\sum_{(x,y)\sim D_i^{\text{ts}}}\log g_{\phi_i}(y|x)$
  - supervised learning: $\min\limits_\theta\sum_{\mathcal{T}_i}\mathcal{L}(f_\theta(\mathcal{D}_i^\text{tr}),\mathcal{D}_i^\text{ts})$
- Algorithm: for each iteration

> Sample task $\mathcal{T}_i$  
> Sample disjoint datasets $\mathcal{D}_i^\text{tr},\mathcal{D}_i^\text{ts}$ from $\mathcal{D}_i$  
> Compute $\phi_i\leftarrow f_\theta(\mathcal{D}_i^\text{tr})$  
> Update $\theta$ using $\nabla_\theta\mathcal{L}(\phi_i,\mathcal{D}_i^{\text{ts}})$

- Challenges & Solution
  - Outputting all neural net parameters does not seem scalable & only sufficient statistics
- Essays
  - Optimization as a model for few-shot learning

## Optimization-based inference (Model-agnostic meta-learning)

Acquire $\phi_i$ through optimization

- $y^\text{ts}=f_\text{MAML}(\mathcal{D}_i^\text{tr},x^\text{ts})=f_{\phi_i}(x^\text{ts})$
  - $\phi_i=\theta-\alpha\nabla_\theta\mathcal{L}(\theta,\mathcal{D}_i^\text{tr})$
  - $\max\limits_{\phi_i}\log p(\mathcal{D}_i^\text{tr}|\phi_i)+\log p(\phi_i|\theta)$
- Meta-parameters $\theta$ serve as a prior
  - Initialization
  - Fine-tuning
- Loss Function: $\min\limits_\theta\sum_{i}\mathcal{L}(\theta-\alpha\nabla_\theta\mathcal{L}(\theta,\mathcal{D}_i^\text{tr}), \mathcal{D}_i^\text{ts})$

> Sample task $\mathcal{T}_i$  
> Sample disjoint datasets $\mathcal{D}_i^\text{tr},\mathcal{D}_i^\text{ts}$ from $\mathcal{D}_i$  
> Optimize $\phi_i\leftarrow\theta-\alpha\nabla_\theta\mathcal{L}(\theta,\mathcal{D}_i^\text{tr})$  
> Update $\theta$ using $\nabla_\theta\mathcal{L}(\phi_i,\mathcal{D}_i^{\text{ts}})$

- Essays
  - Model-agnostic meta-learning

## Non-parametric methods

use parametric meta-learners that produce effective non-parametric learners

- Key idea: use non-parametric learner
  - Siamese network: 两个网络共享权值，衡量输入相似程度
    - Contrastive Loss
    - Cosine Loss
  - pseudo siamese network
- $y^{\text{ts}}=f_{PN}(\mathcal{D}_i^{\text{tr}},x^{\text{ts}})=\text{softmax}(-d(f_\theta(x),c_k))$
  - Prototype: $c_k=\frac{1}{|D_i^{\text{tr}}}|\sum_{(x,y)\in D_i^{tr}}f_\theta(x)$
- Loss function: $J(\phi)=-\log p_{\phi}(y=k|x)$
  - learn embedding $f_\phi:\mathbb{R}^D\rightarrow\mathbb{R}^M$
- Essays
  - Prototypical Networks for Few-shot Learning

## Comparison

![comparison](/images/general/meta-learning.png)
