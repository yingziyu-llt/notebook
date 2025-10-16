# 社群检测的定义
## Node-Centric
全连接的：cliques；可达性：k-clique, k-clan, k-club；基于度的：k-plex, k-core
找最大团是NP-hard的，有一个启发式的算法：![[Pasted image 20251010105921.png]]
k-clique, k-club：k跳内要能互相到达，k-clique要求两两之间小于k跳，k-club要求直径小于k跳
k-core, k-plex：两两之间度数要大于k
![[Pasted image 20251010111330.png]]
## Group-Centric Community Detection
要求子图边的密度要大于$\gamma$，这就是一个γ-dense quasi-clique。
## Network-Centric Community Detection
Goal: partition the network into disjoint sets
- Groups based on Node Similarity
- Groups based on Latent Space Model
- Groups based on Cut Minimization
- Groups based on Modularity Maximization
Node similarity实际上是来计算两个点连结性的similarity，既看看两个node共享节点的情况。最简单的想法是把连结性表示为0/1向量，算两个向量的similarity。
latent space model是先做node embedding，然后做k-means。
Cut：反复做最小割。但这样会切出来很多outlier。引入Ratio Cut & Normalized Cut。计算这个东西也是一个组合优化问题。![[Pasted image 20251010114757.png]]
Spectral Clustering：最小割和谱聚类在数学上极度相似。
基本步骤：
​构建相似度图​：将数据点看成图的顶点，根据某种相似度度量（如高斯核函数）构建边权重，形成一个加权无向图。
​构造图拉普拉斯矩阵​：常用的有：
未归一化的拉普拉斯矩阵：L=D−W
归一化的拉普拉斯矩阵：如 Lsym​=D−1/2LD−1/2或 Lrw​=D−1L
其中 W是相似度（邻接）矩阵，D是度矩阵（对角阵，Dii​=∑j​Wij​）。
​计算拉普拉斯矩阵的前 k 个最小特征值对应的特征向量。
​将这些特征向量按行排列构成一个新的矩阵，然后对这个新矩阵的行进行聚类（如 K-means）​，从而得到原始数据的聚类结果。
二、谱方法提供了松弛与近似解法​
研究者发现，这些正则化最小割问题可以通过图拉普拉斯矩阵的特征向量来近似求解。
具体来说，求解 RatioCut 或 NCut 的最优分割问题，可以转化为求解拉普拉斯矩阵的前几个最小特征值对应的特征向量，然后利用这些特征向量进行数据划分（如通过 K-means）。
这样，谱聚类就提供了一种连续的、可优化的、且计算上可行的方法来近似求解原本离散且 NP 难的最小割问题。
