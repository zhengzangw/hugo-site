---
title: Graph Theory
date: 2018-11-10
weight: 5
---

## Introduction

- Graph $G=(V,E)$
  - order $|V|$
- incident $u\sim v$: u and v are neighbors
  - walk $W = (u=v_0, v_1, \dots, v_k = v)$
    - open walk: $u\neq v$
    - closed walk: $u=v$
  - trail: $u$-$v$ walk in which no edge is traversed more than once
  - circuit: a closed trial of length 3 or more
  - path: $u$-$v$ walk in which no vertices are repeated
  - cycle: a circuit that repeats no vertex, except for the first and last
- connected: $\exists$ $u$-$v$ path
  - distance $d(u,v)$: exists smallest $u$-$v$ path $P=(u=v_0,\dots,v_k=v)$
  - geodesic $u$-$v$ of length $d(u,v)$
  - diamemter $\text{diam}(G)=\max_{u,v}(d(u,v))$
- subgraph
  - proper $G'=(V',E'),V'\subsetneq V$ or $E'\subsetneq E$
  - spanning $G'=(V,E'),E'\subseteq E$
  - induced $G'=(V',E')$: $\forall u,v\in V',$ if $uv\in E$, then $uv\in E'$
  - edge-induced
  - component: 最大连通子图
- Common Graphs
  - trivial graph: $|V|=1$
  - $P_n$ : path (graph)
  - $C_n$: circle (graph)
  - $K_n$ : complete graph
  - bipartite graph: contains no odd cycle
    - $K_{s,t}$: complete bipartite graph
    - $K_{1,t}$ or $K_{s,1}$: star
  - k-partite graph
    - $K_{i_1,\dots,i_k}$: complete k-partite graph
  - n-cubes (hypercubes): $Q_n = Q_{n-1} \times K_2$, $Q_1 = K_2$
- Operation
  - Complement: $\overline{G}=(V,K_n-E)$
  - Union: $G_1 \cup G_2=(V_1\cup V_2,E_1\cup E_2)$
  - Join: $G+H=(V_1\cup V_2, E_1\cup E_2\cup (V_1\times V_2))$
  - Cartesian product $G\times H=(V(G)\times V(H),E'),((u,v),(x,y))\in E'$ if $u=x,vy\in E(H)$ or $v=y,ux\in E$
- multigraph: $E$ is a multiset
  - parallel edges: join the same pair of vertices
- pseudograph: $(u,u)\in E$
- digraph (directed graph): $(v,u)\neq (u,v)$
  - $(u,v)$: $u$ adjacent to $v$, $v$ adjacent from $u$
  - symmetric: $(u,v)\in E\iff(v,u)\in E$
  - underlying graph: replace direction and parallel edges
  - tournament: orientation of complete graph
    - transitive: $(u,v),(v,w)\in T,(u,w)\in T$
    - every tournament contains a Hamiltonian path
    - Hamiltonian iff strong
  - weakly connected: underlying graph is connected
  - strongly connected: $\forall u,v,\exists P$ from $u$ to $v$ and vice versa
- oriented graph: if $(u,v)\in E$, $(v,u)\notin E$
  - oritentation of G
- 图的储存
  - 邻接矩阵
  - 边集（可以链式前向星实现）

## Isomorphism

- isomorphic $G\cong H$: $\exists$ 1-1 $\phi:V(G)\rightarrow V(H)$ such that $uv\in E(G)\Rightarrow\phi(u)\phi(v)\in E(H)$
  - self-complementary: $G \cong \overline G$
  - isomorphism is an equivalence relation of the set of all graphs
- automorphism: isomorphism from $G$ to $G$
- $\text{Aut}(H)$: automorphism group of $G$ (under composition)
  - $u$ and $v$ are similar: they are in same orbit
  - vertex-transitive: $G$ contains a single orbit
- **_Frucht's Theorem_**: For every finite group $A$, there exists a graph $G$ such that $\text{Aut}(G)$ is isomorphic to $A$
- recognizable: a parameter of $G$ can be determined from $G-v,v\in V(G)$
  - $|V|$
  - $|E|$ for $|V|\geq3$
  - degree sequence for $|V|\geq 3$
- reconstructible: $G$ can be uniquely determined (up to isomorphism) from subgraphs $G-v_i$
  - Reconstruction Conjecture: $G$ is reconstructible for $|V|\geq 3$

## Trees

- bridge $e$: $G$ is connected, $G-\{e\}$ is disconnected
  - bridge $\iff$ $!\exists n, C_n\subseteq G, e\in C_n$
  - nontrivial connected graph has a strong orientation $\iff$ no bridges in $G$
- acyclic graph(forests): $!\exists n,C_n\subseteq G$
- tree: acyclic graph + connected
- spanning tree of G
  - cycle property
  - cut property
  - weight: $w(H)=sum_{e\in E(H)}w(e)$
- Kruskal's Algorithm
- Prim's Algorithm
- **_Carley's Theorem_**: the spanning tree of $K_n$ of order n is $n^{n-2}$
- **_Matrix Tree Theorem_**: The spanning tree of an arbitrary graph is any cofactor of matrix

$$
C=\left[\begin{matrix}
    \deg v_1 & -a_{12} & ... & -a_{1n}\\
    -a_{21} & \deg v_2 & ... & -a_{2n}\\
    \vdots & \vdots & \ldots & \vdots\\
    -a_{n1} & -a_{n2} & ... & \deg v_n
\end{matrix}\right]
$$

## Degrees

- $\deg v=|\{u:u\sim v\}|=N(v)$
  - isolated vertex: $\deg v=0$
  - end-vertex(leaf): $\deg v=1$
- $\delta(G)=\min_{v\in G}(\deg v)$
- $\Delta(G)=\max_{v\in G}(\deg v)$
- **_The First Theorem of Graph Theory_**: $\sum_{v\in V(G)} deg(v) = 2|E|$
- $r$-regular graph: $\delta(G) = \Delta(G) = r$
  - $r$-regular graph of order $n$ exists iff at least one of $r$ and $n$ is even ($H_{r,n}$: Harary graphs)
  - cubic graph(3-regular graph): $K_4, K_{3,3}, Q_3$, Petersen graph
- degree sequence: non-increasing
- graphical: finite and can be a degree sequence
- **_Havel-Hakimi Theorem_**: non-increaing sequence $s:d_1,d_2,...,d_n$ where $d_1\geq 1$ is graphical iff $s_1:d_2-1,d_3-1,...,d_{d_1+1}-1,d_{d_1+2},...,d_n$ is graphical.
- irregular graph: $\forall u,v\in V,\deg u\neq \deg v$
  - **_The Party Theorem_**: At any party, there is a pair of people who have the same number of friends present
  - No nontrivial graph is irregular
- $F$-degree of $v$: number of copies of $F$ in $G$ contain $v$
  - $G$ contain $m$ copies of $F$, then $\sum_{u\in V(G)}\deg_F v =km$
  - $F$-(ir)regular
- adjacency matrix $A$: $V\times V$
- incidence matrix $B$: $V\times B$

## Connectivity

### Vertex

- cut-vertex: $G$ is connected and $G-\{v\}$ is disconnected
- nonseparable graph: a nontrivial connected graph with no cut-vertices
- block
  - maximal nonseparable subgraph of $G$
  - equivalence class defined by $R, e R f$ if $e,f$ lie on a common cycle
- vertex-cut: a set $U$ of vertices of $G$ such that $G-U$ is disconnected
  - minimum vertex-cut
- vertex-connectivity: $\kappa(G)=\min|U|,G-U$ disconnected
  - equals $\max_{u\sim v}|\{\text{disjoint u-v path}\}|$
  - $k$-connected: $\kappa(G)\geq k$
  - $2$-connected: no vertex-cut

### Edge

- edge-cut: $G$ is connected and $G-\{e\}$ is disconnected
  - minimum edge-cut
- edge-connectivity: $\lambda(G)$
  - $k$-edge-connected
- $\kappa(G)\leq\lambda(G)\leq\delta(G)$
  - cubic graph: $\kappa(G)=\lambda(G)$

### Menger's Theorem

- $u$-$v$ separating set $S$: $u\not\sim v$ and belong to seperate components of $G-S$
  - minimum $u$-$v$ separating set
- internal vertex of $u$-$v$ path $P$: $w\in P,w\neq v,w\neq u$
- internally disjoint paths: A collection of u-v paths that every two of them have no vertices in common other than u and v
- **_Menger's Theorem_**: minimum cardinality of u-v separating set = maximum number of internally disjoint u-v paths in G
  - induction on the size of graph, discussion on the property of separating set
- **_Whitney's Theorem_**: $k$-connected $\iff\forall u,v$ there are at least $k$ internally disjoint $u$-$v$ paths

## Traversability

- Eulerian circuit: a circuit contains every edge of G
  - Eulerian graph: graph G contians an Eulerian circuit
  - A nontrivial connected graph G is Eulerian iff every vertex of G has even degree
  - (directed) $\text{od} v=\text{id} u$
- Eulerian trail: an open trail that contains every edge of G
  - $K\ddot{o}nigsberg$ Bridge Problem
  - A connected graph G contains an Eulerian trail iff exactly two vertices of G have odd degree.
- Hamiltonian cycle: a cycle in a graph $G$ that contains every vertex of $G$
  - Hamiltonian graph
- Hamiltonian path: a path in $G$ contains every vertex of $G$
- $k(G)$: number of components in G
  - (neccessary) Hamiltonian Graph: $\forall S,k(G-S)\leq|S|$
  - (sufficient) $n\geq3,\forall u\not\sim v,\deg u+\deg v\geq n$, then $G$ is Hamiltonian
- closure $C(G)$: the graph obtained from $G$(order $n$) by recursively joining pairs of nonadjacent vertices whose degree sum $\geq n$ until no such pair remains
  - (neccessary) Hamiltonian Graph: $C(G)$ is Hamiltonian

## Distance

- distance
  - positive
  - reflexivity
  - symmetric
  - triangle inequatity
- metric space: $(V(G), d)$
- eccentricity: $e(v)=\max_{u\in V(G)}d(u,v)$
- radius: $\text{rad}(G)=min_{v\in V(G)}e(v)$
  - center: $Cen(G)=\{v:e(v)=\text{rad}(G)\}$
    - self-centered: $Cen(G) = G$
    - center is subgraph of block
- diameter: $\text{diam}(G)=max_{v\in V(G)}e(v)$
  - periphery: $Per(G)=\{v:e(v)=\text{diam}(G)\}$
- $\text{rad}(G)\leq \text{diam}(G) \leq 2\text{rad}(G)$
- eccentric vertex of $u=\{v:d(u,v)=e(u)\}$
  - $Ecc(G)=\{v:\exists u,d(u,v)=e(u)\}$
- boundary vertex of a vertex $u=\{v:\forall w\sim v,d(u,w)\leq d(u,v)\}$
  - peripheral $\Rightarrow$ eccentric $\Rightarrow$ boundary
- complete vertex (extrem or simplicial vertex): the subgraph of G induced by the neighbors of v is complete
  - complete $\Rightarrow$ boundary
- interior vertex: $\forall u, \exists w, d(u,w)=d(u,v)+d(v,w)$
  - $Int(G)$: subgraph induced by interior vertices
  - boundary $\Rightarrow$ not interior (connected graph)

## Matching

- independent set(matching) $F$: $\forall e_1,e_2\in F,e_1\cap e_2=\emptyset$
- **_Theorem_**: partite graph $G$ has partite sets $U$ and $W$ such that $r=|U|\leq|W|$. Then $G$ contains a matching of cardinality $r$ iff $G$ satisfies Hall's condition.
  - $N(X)=\{v:\exists u\in X,u\sim v\}$
  - Hall's condition: $\forall X\neq \emptyset, X\subseteq U,|N(X)|\geq|X|$
  - equivalent
    - a system of distinct representatives
    - marriage theory
- perfect matching: a graph of order $2k$ has a matching $M$ of cardinality $k$
  - Every $r$-regular bipartite graph has a perfect matching
- edge independence number(maximum matching): $\alpha'(G)=\max |M|$
- edge covering number $\beta'(G)=$ cardinality of minimum edge cover
  - cover: a vertex and an incident edge are said to cover each other
  - edge cover: a set of edges of G that covers all vertices of G
- vertice independence number $\alpha(G)$: maximum cardinality of an independent set of vertices in G
  - vertice independence: no two vertices in the set are adjacent
  - maximum independent set
- vertex covering number $\beta(G)$
- **_Gallai Identity_**: $\forall G,|G|=n$, containing no isolated vertices, $\alpha'(G)+\beta'(G)=n, \alpha(G)+\beta(G)=n$
- **_Konig Theorem_**: bipartite graph $G$ has $\alpha'(G)=\beta(G),\alpha(G)=\beta'(G)$

## Factorization

- $k_o(G)$: number of odd components of $G$
- factor $F$: spanning subgraph of $G$
- factorable: $E(G)=\bigsqcup_{i=1}^{k}E(F_i)$
- $F$-factorable: factorable and $F_i\cong F$
- $r$-factorable: factorable and $F_i$ is $r$-regular graph
- $1$-factorable: perfect matching
  - **_Tutte's Theorem_**: $\forall S\in V(G),k_0(G-S)\leq|S|$, then $G$ contains a $1$-factor
  - **_Petersen's Theorem_**: Every 3-regular bridgeless graph contains a 1-factor
  - Every $r$-regular bipartite graph is $1$-factorable
- $2$-factorable: cyclic factorization
  - $G$ is 2-factorable iff $G$ is $r$-regular, $r$ is positive even integer
- Hamiltonian-factorization
  - $\forall k\geq1$, $K_{2k+1}$ is Hamiltonian-factorable
  - $\forall k\geq1$, $K_{2k}$ can be factored into $k-1$ Hamiltonian-cycles and a $1$-factor
- Kirkman's Schoolgirl Problem: Is there a $5K_3$-factorization of $K_{15}$

## Decomposition

- decomposable: $E(G)=\bigsqcup_{i=1}^{k}E(H_i)$
  - if $H$ is spanning subgraph, then it is factorization
- $H$-decomposable: $H_i\cong H$
- graceful labeling $f:V(G)\rightarrow\mathbb{Z}_m$:
  - one-to-one
  - $f'(e)=|f(u)-f(v)|$ is one-to-one.
- graceful graph: $G$ possessing a graceful labeling
- **_Conjecture_**: Every tree is graceful
- girth: $\min_{C_n\subseteq G} n$
- $g$-cage: minimal 3-regular graph that has girth $g\geq3$
  - $g=3,K_4$
  - $g=4,K_{3,3}$
  - $g=5$ Petersen
  - $g=6$ Heawoo
  - $g=7$ McGee
  - $g=8$ Tutte-Coxeter
  - $g\leq8$, the g-cages are all sole

## Embedding

### Plane

- plane graph: $G$ is drawed on(embeded into) a plane with no edge crossing
  - regions $R$: connected area divied by plane graph
  - exterior regions: a region without bounding
  - boundary of $R$: subgraph corresponding to a region
- planar graph: $\exists P$ is a plane graph, $G\cong P$
- **_Euler Identity_**: a connected plane graph of order n, number of edge m and r regions, $n-m+r=2$
  - a planar graph of order $n\geq3$ then $m\leq3n-6$ ($2m\geq3r$)
  - every planar graph contains a vertex of degree $5$ or less
- maximal planar: planar but any addition of an edge results in nonplanar graph
- **_Kuratowski Theorem_**: G is planar $\iff$ it does not contain a subgraph of $K_5,K_{3,3}$ or subdivision of $K_5, K_{3,3}$
  - subdivision: inserting vertex of degree 2 into $G$

### Surface

- $S_k$ surface of genus $k$: a surface with $k$ handle
  - $S_0$: sphere
    - planar graph can be embedded into a sphere
  - $S_1$: torus
- $\gamma(G)$: minimal integer $k$ that $G$ can be embedded into $S_k$
- $A$ and $A'$ are in the same region if there is a line connecting there without crossing edges or vertices of $G$
- 2-cell embedding: every region is 2-cell embedding
  - 2-cell: a region in which any closed curves can shrink into a node continuously
- **_Theorem_**: If $G$ is 2-cell embedded into $S_k$ then $n-m+r=2-2k$
  - $n\geq3,\gamma(G)\geq\frac{m}{6}-\frac{n}{2}+1$
- $\gamma(K_n)=\lceil\frac{(n-3)(n-4)}{12}\rceil$

### Minor

- $G'$ is got from $G$ by contracting edge $e$ (or identifying the vertices u,v)
- minor: $H$ can be got be a series of edge contraction from $G$
- $G$ is a subdivision of $H\Rightarrow H$ is a minor of $G$
- $H$ is a minor of $G\Rightarrow\gamma(H)\leq\gamma(G)$
- **_Wagner Theorem_**: $G$ is planar $\iff$ $K_5,K_{3,3}$ is not a minor of $G$
- **_The Graph Minor Theorem_**: For any infinite set $S$ of graphs, there are two distinct graph in $S$ that one is a minor of the other

## Coloring

- clique: a complete subgraph of graph
- clique number $\omega(G)$: the largest order of clique in $G$
  - $\beta(G)=\omega(\overline G)$
- coloring (proper coloring) $c:V(G)\rightarrow\mathbb{N},\forall u\sim v,c(u)\neq c(v)$
  - color class: the independet set division corresponding to a coloring
- $\chi(G)$: chromatic number, the minimal number of color to color G
  - $k$-colorable: $\chi(G)\leq k$
  - $\chi(G)=1\iff G$ has no edges
  - $\chi(G)=2\iff G$ is a nonempty partite graph
  - $\chi(C_{2n+1})=3$
  - $\chi(G)=4$ for triangle-free graph (Grotzsch graph)
  - **_Four Color Theorem_**: For every planar graph G, $\chi(G)\leq4$
- $\chi(G)$ inequality
  - $\chi(G)\geq\omega(G)$
  - $\chi(G)\geq\frac{n}{\beta(G)}$
  - $\chi(G)\leq 1+\Delta(G)$
  - ***Brook Theorem***: $G$ is odd circle or complete graph, then $\chi(G)\leq \Delta(G)$
  - $\chi(G)\leq 1+\max(\delta(H))$, $H$ is all possible induced subgraph
- perfect: $\forall H\subseteq G,\chi(H)=\omega(H)$
  - perfect iff complement is perfect
- edge coloring $c:E(G)\rightarrow\mathbb{N},\forall e_1\cap e_2\neq\empty,c(e_1)\neq c(e_2)$
- $\chi'(G)$: edge chromatic number(chromatic index)
  - Divide $G$ into minimum number of 1-regulation graph
- **_Vizing Theorem_**: $\chi'(G)=\Delta G$ or $=\Delta G+1$
  - If $m>\frac{(n-1)\Delta G}{2}$ then $\chi'(G)=1+\Delta(G)$
  - **_Konig Theorem_**: For nonempty partite graph, $\chi'(X)=\Delta(G)$

## Ramsey Numbers

- Ramsey's Theorem: $\forall k+1\geq 3$ positive integers $t,n_1,n_2,\cdots,n_k,\exists n>0,\forall S\subseteq \mathbb{Z}_{n},|S|=t$ is colored with one of $k$ colors, then $\exists S$ containing $n_i$ elements such that every $t$-element subset of $S$ is colored $i$
  - ($t=2$) $\forall k\geq 2,n_1,n_2,\cdots,n_k,\exists n>0,E(K_n)$ is colored by $k$ colors that $\exists i$, complete subgraph $K_{n_i}$ is colored $i$
- Ramsey's number $r(F_1,F_2)$: the smallest positive integer n such that if every edge of Kn is colored red or blue in any manner whatsoever, then either a red F1 or a blue F2 is produced

## Domination

## SSSP & APSP

- Properties of shortest path and relaxation
  - Triangle inequality
  - Upper-bound property
  - No-path property
  - Convergence property
  - Path-relaxation property
  - Predecessor-subgraph property
- **Bellman-Ford Algorithm**
- **Dijkstra Algorithm**
  - Array: $O(V^2)$
  - Min-heap: $O(ElogV)$
  - Fib-heap: $O(VlogV+E)$
- **DAG-SSSP**
- Shortest Simple Path problem: NP
- Difference constraints
  - Constraint graph
- **Floyed-Warshall Algorithm**
- Transitive closure of a directed graph

## Flow

- Flow network: $G=(V,E)$
- Capacity constraint: For all $u,v\in V$, we require $0\leq f(u,v)\leq c(u,v)$
- Flow conservation: For all $u\in V-\{s,t\}$, $\sum_{v\in V}f(v,u)=\sum_{v\in V}f(u,v)$
- **Ford-Fulkerson Method**
- net flow: $f(S,T)=\sum_{u\in S}\sum_{v\in T}f(u,v)-\sum_{u\in S}\sum_{v\in T}f(v,u)$
- capacity of cut: $c(S,T)=\sum_{u\in S}\sum_{v\in T}c(u,v)$
- _Max-flow min-cut theorem_: The maximum flow is equal to the minimum cut capacity
- **Basic Ford-Fulkerson Algorithm**: $O(|f^*|E)$
- **Edmonds-Karp Algorithm**: $O(VE^2)$

## Search

- depth-first forest: predecessor subgraph of DFS
- Classification of Edges
  - Tree edge: edge in $G_\pi$
  - Back edge: ancestor
  - Forward edge: descendant
  - Cross edge
- _Theorem_: There is no Forward edges and Cross edge in undirected graphs.
- _Parenthesis Theorem_
- _Nesting of descendant's intervals_
- _White-path Theorem_
- DAG: directed acyclic graph $\iff$ no back edge $\iff$ has topo. ordering
- Toposort: sort vertices in descending order of their finish times
- Connected Component
- Strong Connected Component
- _Theorem_: Every digraph is a dag of its SCCs
- **Kasaraju's Algorithm**
- **Tarjan's Algorithm**
- _Semiconnected Digraph_
  - Toposort+Check edges($v_i,v_{i+1}$)
- Biconnected Graph: contains no cut-nodes
- bicomponenct: a maximal biconnected subgraph
