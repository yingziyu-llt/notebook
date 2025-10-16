# 激活函数
## Sigmoid:
cons:
1. 极大/极小值的梯度变得太小
2. 非0均值
3. 计算复杂
### why non-zero centered a problem>
计算后可以得到：
$$w_i:=w_i-\mu x_i \frac{dL}{df}\frac{df}{dz}$$
所以，梯度的方向只和 $x_i$ 的正负性有关
## tanh
pros:
1. 以0均值
## ReLU
### pros:
1. 无饱和区间（x>0）
2. 计算高效
3. 收敛快
### cons:
1. 非0均x:值
## Leaky ReLU/Parameter ReLU
### Pros:
1. 无饱和
2. 计算非常搞笑
3. 收敛快

## GELU
$$f(x)=xP(X\leq x)=0.5x(1+tanh[\sqrt{2/\pi}(x+0.044715x^3)])$$
$$x\sigma(1.702x)$$
实际上是让模型尝试随机选择这个神经元该不该被使用
## Swish
$$f(x)=x*sigmoid(x)$$
这个dim的特征，应该有多大的概率，继续向前传播
## SwiGLU
$$f(x)=swish(xW)*xV$$
实际上是把$x$映射到一个新的空间后，再进行选择
# 过拟合与欠拟合
常见方法：
1. 正则化
2. normalization
3. dropout
4. early stopping

normalization
1. batch normalization: $x:N*C*H*W->1*C*1*1$
2. layer norm $x:N*C*H*W->N*1*1*1$
3. Instance Normalization: $x:N*C*H*W->N*C*1*1$
4. RMS Norm: $a_i/RMS$,where $RMS=\sqrt{\frac1d\sum a_i^2}$ 可以低精度的norm，还可以remove bias项目

各种norm的用法
1. Transformer based: LayerNorm
2. LLM: RMSNorm
3. Visual Encoder CNN: BatchNorm
4. multi-modal Fusion: LayerNorm
5. Rare: GroupNorm, InstanceNorm
6. GAN: generator(Pixel Normalization)+ Discriminator(Spectral Normalization)
7. Diffusion: GroupNorm(因为是UNet打底的)
8. Auto Regressive: LayerNorm
新的Norm:AdaLN
