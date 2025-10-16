# 判断题
## 问：
1. 算法A在测试集上的误差比算法B小，那么算法A在训练集上的误差也一定比算法B小。
2. 机器学习的主要目标是寻求泛化性能好的算法。
3. 交叉验证是选择模型超参数的一种方法。
4. 模型A欠拟合（Underfitting，也称欠学习）指在测试集上，该模型达不到足够低的误差。
5. 低容量的模型通常表现出过拟合。
6. 正则化技术用于降低训练误差，但对降低泛化误差（测试误差）无益。
7. KL散度是一种距离度量
8. $x_1$ 和 $x_2$ 的联合分布服从高斯分布，但 $x_1$ 和 $x_2$ 的边缘分布不一定是高斯分布
9. $x_1$ 和 $x_2$ 的联合分布服从高斯分布，$p(x_1|x_2)$ 也服从高斯分布
10. 交叉熵是度量概率分布不确定性的方法
## 答
1. 错
2. 对
3. 对
4. 错
5. 错
6. 错
7. 错
8. 错
9. 对
10. 错
# 简答题
## 问
- 给定一个4面体骰子。记1, 2, 3, 4分别表示其四个面，其中掷一次该骰子，第i面朝下的概率为$\theta_i$，即$p(x=i) = \theta_i$。假设掷该骰子十二次，结果如下
  - $\{1, 1, 3, 2, 2, 1, 4, 3, 2, 1, 4, 3\}$
  - 即$D = \{x_1=1, x_2=1, x_3=3, x_4=2, x_5=2, x_6=1, x_7=4, x_8=3, x_9=2, x_{10}=1, x_{11}=4, x_{12}=3\}$

- 问题
  1. 请用最大似然估计方法，计算$\theta_1, \theta_2, \theta_3, \theta_4$
  2. 假定参数$\boldsymbol{\theta}=\{\theta_1, \theta_2, \theta_3, \theta_4\}$的先验分布服从超参数为$\boldsymbol{\alpha}=\{2, 2, 3, 3\}$的狄利克雷分布，请用最大后验概率估计方法计算$\theta_1, \theta_2, \theta_3, \theta_4$

$$
p(\boldsymbol{\theta}; \boldsymbol{\alpha}) = \operatorname{Dir}(\boldsymbol{\theta}; \boldsymbol{\alpha}) = \frac{1}{\mathrm{B}(\boldsymbol{\alpha})} \prod_{k=1}^{K} \theta_{k}^{\alpha_{k}-1} = \frac{\Gamma(10)}{\Gamma(2)\Gamma(2)\Gamma(3)\Gamma(3)} \theta_{1}^{2-1} \theta_{2}^{2-1} \theta_{3}^{3-1} \theta_{4}^{3-1} = \frac{\Gamma(10)}{\Gamma(2)\Gamma(2)\Gamma(3)\Gamma(3)} \theta_{1} \theta_{2} \theta_{3}^{2} \theta_{4}^{2}
$$

## 答
首先写出负对数似然函数：$$NLL=4\ln \theta_1+3 \ln \theta_2 + 3 \ln \theta_3 + 2 \ln \theta_4$$
列出拉格朗日乘子式：
$$L=-(4\ln \theta_1+3 \ln \theta_2 + 3 \ln \theta_3 + 2 \ln \theta_4) + \lambda(\theta_1 + \theta_2 + \theta_3 + \theta_4 - 1)$$
求偏导等，可以得到结果：
$$\theta_1 = \frac1 3;\theta_2 = \frac1 4;\theta_3 = \frac1 4;\theta_4 = \frac1 6;\lambda=12$$
最大后验估计目标函数：
$$LL(\theta)+\ln p(\theta) 
= 4\ln \theta_1+3 \ln \theta_2 + 3 \ln \theta_3 + 2 \ln \theta_4 + (\ln \frac{\Gamma(10)}{\Gamma(2)\Gamma(2)\Gamma(3)\Gamma(3)} + \ln \theta_{1}  + \ln \theta_{2} +2\ln \theta_{3} + 2\ln \theta_{4})$$
化简得：
$$LL(\theta) + \ln p(\theta)= 5\ln \theta_1 + 4 \ln \theta_2 + 5 \ln \theta_3 + 4 \ln \theta_4$$

列出拉格朗日乘子式：
$$L=-(5\ln \theta_1+4 \ln \theta_2 + 5 \ln \theta_3 + 4 \ln \theta_4) + \lambda(\theta_1 + \theta_2 + \theta_3 + \theta_4 - 1)$$
解出
$$\theta_1 = \frac5 {18};\theta_2 = \frac2 9;\theta_3 = \frac5 {18};\theta_4 = \frac2 9;\lambda=18$$