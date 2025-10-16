# Core
实际上是一种高效微调的方法，可以高效、小数据量的把图基础模型迁移到某个特定的任务中
通过的方法：**可训练的、基于“语义低秩分解”设计的轻量级提示（Prompt）** 。
三种prompt：SeLo-Graph Prompt，SeLo-Node Prompt，SeLo-Edge Prompt
Graph Prompt ->  建立一个low rank的新节点，建立对应的点和边
Node Prompt -> 对于每个节点进行一种类似低通滤波的操作，让节点信息包含更多语义信息
Edge Prompt -> 对图卷积做了一个修正，加入一套在low rank下的卷积微调项
![[Pasted image 20251014184011.png]]
# Graph Prompt
原始图:$G=\{V,E\},V\in R^{N\times d}$
在原始图之外，加入一组low rank的点：$\{n_1,...n_M\} \in R^{M\times r}$。满足$r<<d$
使用一个可学习的投影矩阵$P_g$，将这个低维向量投射到原始embedding空间 $p_i=n_i * P_g$
这些$\{p_1,...,p_n\}$就是我们新加入的点的坐标。对这些点加入对应的knn边，合并后就是我们的新图。

# Edge Prompt
实际上是一个修正的图卷积。对于一个节点$x_c$的邻居节点集合$N(x_c)$,做：$s_n = MLP_s(x_n),x_n\in N(x_c)$，$s_n\in R^r$，即做一个他邻居节点的low rank representation.加入一组新的修正：
![[Pasted image 20251014185330.png]]

# Node Prompt
对于每个节点，利用low rank信息重新导航这个节点的位置。
$$x_c = \alpha s_c * P_n + (1-\alpha) x_c$$

# 综合
综合起来来看，他微调后的函数变成了：![[Pasted image 20251014190114.png]]
![[Pasted image 20251014190129.png]]

# 整体效果
1. 在图像上做的很好 Table 1，超过了全量微调
2. Table 2：在生物化学显著超越了其他prompt方法和全量微调
3. **参数效率**：相比于全量微调，VGP 平均减少了 **94.6%** 的可训练参数 。这意味着极低的显存消耗和存储成本。
4. **计算效率**：VGP 只引入了极少的额外计算开销，平均只增加了 **3.1%** 的浮点运算数（FLOPs）。
# 局限
1. 他后面生物/化学的那个基础模型是在一系列生物（实际上是分子互作）/化学的数据集上训的，单细胞没这种基础模型，从其他领域迁移可行吗？
2. 