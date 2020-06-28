---
title: Association
date: 2020-06-14
weight: 3
---

## Quantitative Discriminant Rule

- general form: $\forall X,$target_class$(X)\Leftrightarrow$ contition$_1(X)[t:w_1,d:\omega_1]\vee\cdots\vee$ condition$_n(X)[t: w_n, d:\omega_n]$
- Discriminant rule: sufficient condition of the target class
  - d-weight = $\frac{\text{count}(q_a\in C_{\text{target}})}{\sum_{i=1}^N\text{count}(q_a\in C_i)}$
  - d-weight: discriminability of each disjunct in the rule
  - important
- Characteristic rule: necessary condition
  - $\sum t_i=100\%$

## Association

- Association rules: $A\Rightarrow B$[support, condifence]

  - Support

    $$\text{support}(A\Rightarrow B)=P(A,B)=\frac{\text{\# of tuples includes }A,B}{\text{\# of total tuples}}$$

  - Confidence (t-weight)

    $$\text{confidence}(A\Rightarrow B)=P(B|A)=\frac{\text{\# of tuples includes }A,B}{\text{\# of tuples includes }A}$$

- strong: support > min_sup, confidence > min_conf
- k-itemset: contains k items
- frequency: support count
- frequent itemset: support > min_sup

### Apriori

- Two-step process
  - find all frequent itemsets
  - generate strong association rules (easy)
- INSIGHT: All non-empty subsets of a frequent itemset must also be frequent
- frequent $k$-itemset: $L_k$
- Join: $C_{k+1} = L_k\Join L_k=\{A\Join B|A,B\in L_k,|A\cap B|=k-1\}$
- Prune: determine candidates in $C_{k+1}$ to get $L_{k+1}$
- ordering $L_k$

### Apriori variant

- AIS: for each tuple, expand $L_k$ by adding other items contained in the tuple to generate $C_{k+1}$
- AprioriTid: calculate support in $\overline{C_k}$
- DHP (Direct Hashing and Pruning)

  - INSIGHT: the processes in the initial iterations of Apriori dominates the total execution cost
  - Knowledge 1: Any member of a candidate frequent itemset must be hashed into a bucket whose count $\geq$ min_sup
  - Knowledge 2: Any tuple useful in determining $L_{k+1}$ must contain at least $k+1$ sets in $C_k$
  - Knowledge 3: For any items contained in a tuple, if it is useful in determining $L_{k+1}$, it must appear in at least $k$ sets in $C_k$
  - Knowledge 4: For any items contained in a tuple, if it is useful in determining $L_{k+1}$ it must appear in at least one (k+1)-itemset whose k-itemsets are all candidate frequent k-itemsets

- Improvement
  - partitioning
  - sampling
  - transaction reduction

### FP-growth

- Mining from FP-tree
- FP-tree construction
  - scan DB once, find frequent 1-itemset
  - sort frequent items in frequency descending order to get F-list
  - scan DB again construct FP-tree
  - for each frequent item in reverse frequency, construct its conditional pattern-base and conditional FP-tree
  - repeat on newly created conditional FP-tree until empty

## Others

- closed frequent itemset
  - closed: no proper super-itemset $Y$ such that $Y$ has the same support count as $X$ in $S$
- Maximal frequent itemset: if $X$ is frequent, and there exists no proper super-itemset $Y$ such that $Y$ is frequent in $S$
- Multilevel association rules: Rules generated from association rule mining with concept hierarchies
  - same min_sup for all levels
  - level-by-level independent
  - level-cross filtering by $k$-itemsets
  - Level-crossfilteringbysingleitem
  - Controlled level-cross filtering by single item
- Cross-level association rules
- Quantitative Association rules
  - Step 1. Binning
  - Step 2. Finding frequent predicatesets
  - Step 3. Clustering association rules
- Distance-based association rules
- Criticism: Strong association rules may not be interesting
- Correlation analysis
  - Lift: $\frac{P(AB)}{P(A)P(B)}$
