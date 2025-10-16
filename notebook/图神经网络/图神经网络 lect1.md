图： $G=\{V,E\}$  ，每个点是个实体，有自己的属性。加入 $E$ 后，可以通过社交关系获得更多的信息。
传统机器学习认为data point是独立同分布的，加入边后，多了很多信息，如拓扑结构、周围的信息，都会影响这个data point的性质。传统机器学习是图机器学习的一个特例，没有 $E$ 的一个特例。
## Why hard?
size是任意的，复杂拓扑结构。边的权值、类型非常复杂多样。点非常的infomative
机器学习本质就是表征。要选择合适的表征维度，并把对象投射到这个表征空间里面
## 图神经网络的任务
+ Node importance
+ Community detection
+ Network distance
+ Link prediction
+ Node classification
+ Network evolution
**但是，带来了更大的复杂性**
计算复杂度非常大。每个节点都由邻居、邻居的邻居...决定，使得每个点计算需要在图里面及其大量的随机游走，导致及其难以并行计算。
$$G=(V,E) <=> G=(V)$$
embedding & generate
![[Pasted image 20250912114839.png]]
浅层模型擅长做拓扑结构的分析，而深层模型能力更强，可以充分利用每个节点的信息，但可能反而拓扑结构效果较差。

图表征学习：![[Pasted image 20250919102006.png]]
浅层模型要求要有保持，即$$sim(u,v)\approx z_v^T z_u$$
图上的任务：
- node level
- edge level
- community level
- graph level

任何图都可以被fold成一个二部图，这个fold实际上是一个user-item的转化
![[Pasted image 20250919112702.png]]
大部分图都是很稀疏的图。就是因为稀疏性，所以才存在社群。

顶点和边都是有属性的。

Key Properties of Network
1. Degree Distribution: 幂律分布
2. 两点距离
3. 网络直径：最长的两个节点的路径长度
4. 聚集系数： $C_i=\frac{2*e_i}{k_i(k_i - 1)}$ , $e_i$ 指 neighbor 里面的边的数量，自己的度数为 $k_i$
5. 连通性：