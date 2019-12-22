---
title: Graph Theory 
date: 2018-11-10
tags: [ps, notes]
---

## Introduction

* order: vertices in G
* trivial graph: order 1
* labeled graph
* word graph
* incident: u and v are neighbors, then u and v are incident with each other
* proper subgraph: E or V is different
* spanning graph: same vertex as G
* induced graph: if u and v are vertices of F and uv is an edge in G, then uv is in F
* edge-induced subgraph
* walk: W = (u=v0, v1, ..., vk = v)
* open walk: u!=v
* closed walk: u==v
* trail: u-v walk in which no edge is traversed more than once
* path: u-v walk in which no vertices are repeated
* circuit: a closed trial of length 3 or more
* cycle: a circuit that repeats no vertex, except for the first and last
* component
* geodesic: a u-v path of length d(u,v)
* complement
* $K_n$ : complete graph
* $P_n$ : path (graph)
* $C_n$: circle (graph)
* bipartite graph: **contains no odd cycle**
* $K_{s,t}$: complete bipartite graph
* star: $K_{1,t}$ or $K_{s,1}$
* k-partite graph
* complete k-partite graph (complete multipartite graphs)
* union: $G_1 \cup G_2$
* join: $G+H$ consists of $G\cup H$ and all edges joining a vertex of G and a vertex of H.
* Cartesian product $G * H$: V($G*H$) = V($G$) $*$ V($H$), two distinct vertices (u,v) and (x,y) are adjacent if u=x,vy$\in$E($H$) or v=y,ux$\in$E($G$)
* n-cubes (hypercubes): $Q_n = Q_{n-1} * K_2$, $Q_1 = K_2$
* multigraph
* parallel edges: join the same pair of vertices
* pseudograph: edge can join u and u
which is a loop
* digraph (directed graph): directed edges
* adjacent to: (u,v)
* adjacent from: (u,v)
* oriented graph: at most one of (u,v) and (v,u) is a directed edge
* oritentation of G

## Degrees

* degree: the number of edges incident with v
* $N(v)$: the neighborhood of v
* isolated vertex: $deg_G(v)=0$
* $\delta(G)$: minimum degree of G
* $\Delta(G)$: maximum degree of G
* *The First Theorem of Graph Theory*: $\sum_{v\in V(G)} deg(v) = 2|E|$
* r-regular graph: $\delta(G) = \Delta(G) = r$
* cubic graph: 3-regular graph ($K_4, K_{3,3}, Q_3$, Petersen graph)
* Petersen graph
* $H_{r,n}$: Harary graphs, r-regular graph of order n if at least one of r and n is even
* degree sequence
* graphical: a finite sequence is a degree sequence of some graph
* *Havel-Hakimi Theorem*: non-increaing sequence $s:d_1,d_2,...,d_n$ where $d_1\geq 1$ is graphical iff $s_1:d_2-1,d_3-1,...,d_{d_1+1}-1,d_{d_1+2},...,d_n$ is graphical.

## Isomorphic Graphs

* isomorphic: exists a one-to-one $\phi$ from V(G) to V(H) such that $uv\in E(G)$ and $\phi(u)\phi(v)\in E(H)$
* self-complementary: $G \equiv (\overline H)$

## Trees

* bridge: $G$ is connected, $G-e$ is disconnected
* acyclic graph: no cycles
* tree: acyclic connected graph
* rooted tree
* forests
* $w(H)$: $sum_{e\in E(H)}w(e)$
* spanning tree of G
  * cycle property
  * cut property
* Kruskal's Algorithm
* Prim's Algorithm
* *Carley's Theorem*: the spanning tree of complete graph of order n is $n^{n-2}$
* *Matrix Tree Theorem*: The spanning tree of an arbitrary graph is any cofactor of matrix C

$$\left[\begin{matrix}
    \deg v_1 & -a_{12} & ... & -a_{1n}\\
    -a_{21} & \deg v_2 & ... & -a_{2n}\\
    \vdots & \vdots & \ldots & \vdots\\
    -a_{n1} & -a_{n2} & ... & \deg v_n
\end{matrix}\right]$$

## Connectivity

* cut-vertex: G is connected and G-v is disconnected
* nonseparable graph: a nontrivial connected graph with no cut-vertices
* block: a maximal nonseparable subgraph of G
* vertex-cut: a set U of vertices of G such that G-U is disconnected
* minimum vertex-cut
* $\kappa(G)$: vertex-connectivity, the cardinality of a minimum vertex-cut; also the maximum number of disjoint u-v path for which u and v are connected
* k-connected: $\kappa(G)\geq k$
* *Theorem*: 2-connected $\iff$ any 2 adjacent edges of G lie on a common cycle of G
* edge-cut
* minimum edge-cut
* $\lambda(G)$: edge-connectivity
* k-edge-connected
* *Theorem*: $\kappa(G)\leq\lambda(G)\leq\delta(G)$
* u-v separating set: the set separate G
* minimum u-v separating set
* internal vertex of u-v path P: a vertex of P different from u and v
* internally disjoint: A collection of u-v paths that every two of them have no vertices in common other than u and v
* *Menger's Theorem*: minimum cardinality of u-v separating set = maximum number of internally disjoint u-v paths in G
* *Whitney's Theorem*: k-connected iff for each pair u, v there are at least k internally disjoint u-v paths

## Traversability

* Eulerian circuit: a circuit contains every edge of G
* Eulerian graph: graph G contians an Eulerian circuit
* Eulerian trail: an open trail that contains every edge of G
* $K\ddot{o}nigsberg$ Bridge Problem
* *Theorem*: A nontrivial connected graph G is Eulerian iff every vertex of G has even degree
* *Theorem*: A connected graph G contains an Eulerian trail iff exactly two vertices of G have odd degree.
* Hamiltonian cycle: a cycle in a graph G that contains every vertex of G
* Hamiltonian graph
* Hamiltonian path: a path in G contains every vertex of G
* $k(G)$: number of components in G
* *Theorem*: For Hamiltonian Graph, $k(G-S)\leq|S|$
* *Theorem*: $n\geq3$, if $degu+degv\geq n$ for each pair u,v of nonadjacent vertices of G, then G is Hamiltonian
* closure C(G): the graph obtained from G(order n) by recursively joining pairs of nonadjacent vertices whose degree sum is at least n until no such pair remains 
* *Theorem*: A graph is Hamiltonian iff C(G) is Hamiltonian

## Matching

* independent: a set of edges in which no two edges are adjacent
* matching: an independent set of edges in G
* $N(X)$: neighborhood of X
* Hall's condition: $|N(X)|\geq|X|$ for every nonempty subset X of U 
* *Theorem*: Let G be a partite graph with partite sets U and W such that $r=|U|\leq|W|$. Then G contains a matching of cardinality r iff G satisfies Hall's condition.  
* a system of distinct representatives
* perfect matching: a graph of order 2k has a matching M of cardinality k
* *Theorem*: Every r-regular bipartite graph has a perfect matching
* maximum matching: $|M| = \alpha'(G)$
* edge independence number $\alpha'(G)$: the maximum cardinality of an independent set of edges
* cover: a vertex and an incident edge are said to cover each other
* edge cover: a set of edges of G that covers all vertices of G
* edge covering number $\beta'(G)$: cardinality of minimum edge cover
* vertice independence: no two vertices in the set are adjacent
* vertice independence number $\alpha(G)$: maximum cardinality of an independent set of vertices in G
* maximum independent set
* vertex cover
* vertex covering number $\beta(G)$
* minimum vertex cover
* *Theorem: Gallai Identity*: For every graph G of order n containing no isolated vertices, $\alpha'(G)+\beta'(G)=n, \alpha(G)+\beta(G)=n$
* *Konig Theorem*: If G is a bipartite graph then $\alpha'(G)=\beta(G)$

## Factorization

* $k_o(G)$: the number of odd components of a graph G.
* factor-factorization-factorable
* 1-factorization: there exists 1-factors $F_1, F_2, \cdots, F_r$ of G such that ${E(F_1),E(F_2),\cdots,E(F_r)}$ is a partition of $E(G)$ (e.g. $K_{2k}$,r-regular bipartite graph)
* *Petersen's Theorem*: Every 3-regular bridgeless graph contains a 1-factor
* cyclic factorization
* *Theorem*: G is 2-factorable iff G is r-regular for some positive even integer r
* Hamiltonian factorization
* *Theorem*: For every integer $k\geq1$, $K_{2K+1}$ is Hamiltonian-factorable
* *Theorem*: For every integer $k\geq1$, $K_{2K}$ can be factored into k-1 Hamiltonian-cycles and a 1-factor
* F-factorable: G is factorable into factors $F_1, F_2,\dots, F_k$ if ${E(F_1),E(F_2),\dots,E(F_k)}$ is a partition of $E(G)$. Each factor $F_i$ is isomorphic to some graph $F$.
* *Kirkman's Schoolgirl Problem*
* Kirkman triple system: exists iff $n\equiv3(mod\ 6)$
* decomposable: A graph is decomposable into the subgraphs $H_1,H_2,\dots,H_k$ if ${E(H_1),E(H_2),\dots,E(H_k)}$ is a partition of E(G).
* decompsition-decomposable
* H-decomposable and H-decomposition: $H_i$ is isomorphic to some graph H
* graceful labeling: a one-to-one function $f:V(G)\rightarrow{0,1,2,\dots,m}$ is a graceful labeling if the induced edge labeling $f'(e)=|f(u)-f(v)|$ is one-to-one.
* graceful graph: G possessing a graceful labeling
* *Conjecture*: Every tree is graceful
* *Instant Insanity*
* girth: the length of a smallest cycle in a graph
* g-cage: a 3-regular graph of minimum order that has girth $g\geq3$ (for $g\leq8$, the g-cages are all sole, $K_4,K_{3,3}$,Petersen,Heawood,McGee,Tutte-Coxeter)
* Petersen Graph
  * counter-example to 'Every 3-regular bridgeless graph is 1-factorable'
  * The only 5-cage

## Distance

* distance: positive; reflexivity; symmetric; triangle inequatity
* metric space: (V(G), d)
* $e(v)$: eccentricity, the distance between v and a vertex farthest from v in G
* $rad(G)$: radius, $min_{v\in V(G)}e(v)$  
* $diam(G)$: diameter, $max_{v\in V(G)}e(v)$
* $Cen(G)$: central vertex, e(v)=rad(G)
* self-centered: Cen(G) = G
* *Theorem*: $rad(G)\leq diam(G) \leq 2rad(G)$
* $Per(G)$: peripheral vertex, e(v)=diam(G)
* eccentric vertex of u: d(u,v)=e(u)
* boundary vertex of a vertex u: d(u,w)$\leq$d(u,v) for each neighbor w of v
* complete vertex (extrem or simplicial vertex): the subgraph of G induced by the neighbors of v is complete
* $Int(G)$: interior vertex of G if for *every* vertex u distinct from v, there exists a vertex w such that v lies between u and w
* *Theorem*: $G = Bound(G) \cup Int(G)$

## Planar Graph

* planar graph: G can be drawed on a plane without edge crossing
* plane graph: G is drawed on a plane with no edge crossing
* regions: connected area divied by plane graph
* exterior regions: a region without bounding
* boundary: subgraph corresponding to a region
* *Euler Identity*: a planar graph of order n, number of edge m and r regions, n-m+r=2
* *Theorem*: a planar graph of order $n\geq3$ then $m\leq3n-6$
* maximal planar
* subdivision: one or more vertex of degree 2 are inserted into edge of graph G
* *Kuratowski Theorem*: G is planar $\iff$ it does not contain a subgraph of $K_5,K_{3,3}$ or subdivision of $K_5, K_{3,3}$
* embedding
* G can be embedded into a plane $\iff$ it can be embedded into a sphere
* $S_K$ surface of genus k: a surface with k handle
  * $S_0$: sphere
  * $S_1$: torus
* $\gamma(G)$: minimal integer k that G can be embedded into $S_k$
* $A$ and $A'$ are in the same region if there is a line connecting there without crossing edges or vertices of G
* 2-cell: a region in which any closed curves can shrink into a node continuously
* 2-cell embedding: every region is 2-cell embedding
* *Theorem*: If G is 2-cell embedded into $S_k$ then $n-m+r=2-2k$
* For $n\geq3$, $\gamma(G)\geq\frac{m}{6}-\frac{n}{2}+1$
* $\gamma(K_n)=\lceil\frac{(n-3)(n-4)}{12}\rceil$
* $G'$ is got from $G$ by contracting edge e (or identifying the vertices u,v)
* minor: $H$ can be got be a series of edge contraction from $G$
* *Theorem*: If $G$ is a subdivision of $H$, then $H$ is a minor of $G$
* *Theorem*: If $H$ is a minor of $G$, $\gamma(H)\leq\gamma(G)$
* *Wagner Theorem*: $G$ is planar $\iff$ $K_5,K_{3,3}$ is not a minor of $G$
* *minor of graph theorem*: For any set of graph $S$, there are two graph in S that one is a minor of the other

## Coloring

* reducible configuration
* unavoidable set of reducible configurations
* dual: a graph corresponding to a map
* coloring (proper coloring): give every vertex a color and the neighboring ones with different colors (The minimal number of independent set G can be divided into; $c:V(G)\rightarrow\mathbb{N}$, when $uv\in E(G)$, $c(u)=\not c(v)$)
* $\chi(G)$: chromatic number, the minimal number of color to color G
* $k$-colorable: $\chi(G)\leq k$
* *Four Color Theorem*: For every planar graph G, $\chi(G)\leq4$
* color class: the independet set division corresponding to a coloring
* $\chi(G)=1\iff G$ has no edges
* $\chi(G)=2\iff G$ is a nonempty partite graph
* $\chi(C_{2n+1})=3$
* clique: a complete subgraph of graph
* $\omega(G)$: clique number, the largest order of clique in G, $\beta(G)=\omega(\overline G)$
* $\chi(G)\geq\omega(G),\chi(G)\geq\frac{n}{\beta(G)}$
* $\chi(G)\leq 1+\Delta(G)$ (*Brook Theorem* equal only when G is odd circle or complete graph)
* $\chi(G)\leq 1+\max(\delta(H))$, H is all possible induced subgraph
* Grotzsch graph: triangle-free, $\chi(G)=4$
* edge coloring
* $\chi_1(G)$: edge chromatic number(chromatic index; Divide $G$ into minimum number of 1-regulation graph)
* *Vizing Theorem*: $\chi_1(G)=\Delta G$ or $=\Delta G+1$
* If $m>\frac{(n-1)\Delta G}{2}$ then $\chi_1(G)=1+\Delta(G)$
* *Konig Theorem*: For nonempty partite graph, $\chi_1(X)=\Delta(G)$

# Decomposition

* depth-first forest: predecessor subgraph of DFS
* Classification of Edges
  * Tree edge: edge in $G_\pi$
  * Back edge: ancestor
  * Forward edge: descendant
  * Cross edge
* *Theorem*: There is no Forward edges and Cross edge in undirected graphs.
* *Parenthesis Theorem*
* *Nesting of descendant's intervals*
* *White-path Theorem*
* DAG: directed acyclic graph $\iff$ no back edge $\iff$ has topo. ordering
* Toposort: sort vertices in descending order of their finish times
* Connected Component
* Strong Connected Component
* *Theorem*: Every digraph is a dag of its SCCs
* **Kasaraju's Algorithm**
* **Tarjan's Algorithm**
* *Semiconnected Digraph*
  * Toposort+Check edges($v_i,v_{i+1}$)
* Biconnected Graph: contains no cut-nodes
* bicomponenct: a maximal biconnected subgraph

# SSSP & APSP

* Properties of shortest path and relaxation
  * Triangle inequality
  * Upper-bound property
  * No-path property
  * Convergence property
  * Path-relaxation property
  * Predecessor-subgraph property
* **Bellman-Ford Algorithm**
* **Dijkstra Algorithm**
  * Array: $O(V^2)$
  * Min-heap: $O(ElogV)$
  * Fib-heap: $O(VlogV+E)$
* **DAG-SSSP**
* Shortest Simple Path problem: NP
* Difference constraints
  * Constraint graph
* **Floyed-Warshall Algorithm**
* Transitive closure of a directed graph

# Flow

* Flow network: $G=(V,E)$
* Capacity constraint: For all $u,v\in V$, we require $0\leq f(u,v)\leq c(u,v)$
* Flow conservation: For all $u\in V-\{s,t\}$, $\sum_{v\in V}f(v,u)=\sum_{v\in V}f(u,v)$
* **Ford-Fulkerson Method**
* net flow: $f(S,T)=\sum_{u\in S}\sum_{v\in T}f(u,v)-\sum_{u\in S}\sum_{v\in T}f(v,u)$
* capacity of cut: $c(S,T)=\sum_{u\in S}\sum_{v\in T}c(u,v)$
* *Max-flow min-cut theorem*: The maximum flow is equal to the minimum cut capacity
* **Basic Ford-Fulkerson Algorithm**: $O(|f^*|E)$
* **Edmonds-Karp Algorithm**: $O(VE^2)$