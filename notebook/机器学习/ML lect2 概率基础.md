# 基本概念
概率是度量随机事件发生的可能性的方法。概率论是研究随机现象规律的一门学科
基本性质：![[Pasted image 20250915185032.png]]
条件概率，联合概率，全概率公式，乘法公式。
![[Pasted image 20250915185628.png]]
随机变量：结果的函数。定义在样本空间上的实值函数，叫做r.v.
独立和条件独立：给定rv $X,Y$,如果满足乘性$p(x,y)=p(x)*p(y)$，就独立。如果在 given $C$ 下成立，叫做条件独立。
## 随机向量的统计量
期望，方差。期望就是每个随机变量的均值，协方差矩阵是$Cov[X]=\mathbb{E}[(X-E[X])(X-E[X])^T]$
$Cov[X_1,X_2]=E[X_1X_2] - E[X_1]E[X_2]$
度量两个rv的线性相关程度。$Cov[X_1,X_2] \in \mathbb{R}$
用协方差除以各自方差开根号，就是两个rv的相关系数。$$\rho=\frac{Cov[X_1,X_2]}{\sqrt{V[X_1]V[X_2]}}$$
不相关不代表独立。实际上是用两个线性拟合的系数。
辛普森悖论：相关不代表因果。
![[Pasted image 20250915191444.png]]

全期望法则：$$\mathbb{E}[X]=\mathbb{E}[\mathbb{E}[X|Y]]$$
全方差法则：$$V[X]=E[V[X|Y]]+V[E[X|Y]]$$
**贝叶斯公式**
$$P(H=h|X=x)=\frac{P(X=x|H=h)P(H=h)}{P(X=x)}$$
给定观测数据，通过贝叶斯公式修改所关注随机变量分布的过程称为贝叶斯推断或推理（bayesian inference），或后验推断或推理（posterior inference）,或概率推断或推理（probabilistic inference）

# 主要的概率分布
## 伯努利分布
$$x\sim Ber(\theta)=>p(X=1)=\theta$$
## 二项分布
$N$次伯努利实验。$p(x)=Bin(x;N,\theta)=C_x^N \theta^x (1-\theta)^(n-x)$
## 泊松分布
$$p(x)=e^\lambda \frac{\lambda^x}{x!}$$
$N->\inf$ 变泊松，$\lambda->\inf$ 变高斯。证明较为复杂。
## 类型分布
分类分布，伯努利的扩展。![[Pasted image 20250915200444.png]]
## 多项分布
多次独立重复类型分布实验。![[Pasted image 20250915200600.png]]
## 正态分布
![[Pasted image 20250915200724.png]]
![[Pasted image 20250915200735.png]]
## 拉普拉斯分布
$p(x)=Lap(x;\mu,b)=1/2b exp(-1/b |x-\mu|)$
适合对有异常点的数据建模。
## gamma分布
![[Pasted image 20250915201025.png]]
## 经验分布
就是把每个数据点建一个狄拉克函数，加一起就行。
## 多元高斯分布
![[Pasted image 20250915201139.png]]
![[Pasted image 20250915201259.png]]
![[Pasted image 20250915201321.png]]

# 指数分布族
由$\theta \in R^K$刻画的一类分布![[Pasted image 20250915202827.png]]
![[Pasted image 20250915204305.png]]

# 概率分布的度量

度量随机变量和其概率分布，要度量随机变量的不确定性、概率分布之间的差异性。
使用信息论工具。
## 随机性度量：熵
对于离散型随机变量$X$:
$$\mathbb{H}(X)=-\sum p(x) \log p(x)$$
熵是非负数。
对于离散型随机变量$X$，有微分熵：
$$\mathbb{H}(X)=-\int p(x) \log p(x) dx$$
这里都以自然底数为底。
