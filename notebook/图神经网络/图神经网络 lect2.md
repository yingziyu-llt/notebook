传统机器学习的pipeline：手工抽取特征，把特征输入进入机器学习模型，进行分类等。
## node level task
目的是跟据部分有标签的点和图信息，推断无标签的点的属性。
用Node Centrality衡量这个节点对于图的重要性。可以衡量：Eigenvector centrality; Betweenness centrality; Closeness centrality;...

Eigenvector centrality: $c_v = 1/\lambda \sum_{u\in N(v)} c_u$，实际上和PageRank的思想是一样的
Betweenness Centrality:所有两两最短路径中，经过某个点的比例。经典： bridge
Closeness centrality：某个顶点到所有节点最短路径长度和的倒数

还有其他特征，如clustering coefficient: $C_i=\frac{2*e_i}{k_i(k_i - 1)}$
grpahlets:一个节点周围子图分布的情况。

## link level task
目标是预测两个点之间是否有link。使用的feature可以是点对中两个点的feature。也可以是对边的属性进行预测。图可以是静态的，也可以是不断演化的。
local neighborhood overlap:一跳邻居的重合度
global neighborhood overlap: Katz index 计算给定顶点之间，所有长度路径的个数。$S_{v_1 v_2}=\sum_i \beta^i A^i_{v_1 v_2}$，效果很好，但计算复杂度太高了

## Graph level
需要对图做一个特征。最核心的是要做一个核算子。要设计一个可操作的算子$K:G+G->R$，既$K(G,G')\in R$。最简单的方法是$K(G,G')=\phi(G) \phi^T(G')$，$\phi$是一个 feature extraction 算子。
比较简单的方法：使用BoW方法。
可以装什么？graphlet，node信息

## 社群检测
实际上就是聚类，要求社群内部的连边密度高于社群之间。是个np-hard的问题，所以一般都是近似算法。给定一个graph，将其分割为多个社群，满足上述的条件。
一个顶点和他直接相连组成的节点，叫做ego-network。
社群的定义是主观的，有各种resolution。