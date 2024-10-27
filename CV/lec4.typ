= 特征检测

== 边缘检测

什么是边：图像的不连续变化。光照不连续、面不连续、色彩不连续、深度不连续...

对图像做边缘检测，就是找突然变化。也就是其梯度很大的地方。如何对不连续的函数做导数？

连续函数：$(partial f(x,y))/(partial x) = limits(lim)_(epsilon->0) (f(x+epsilon,y) - f(x,y))/epsilon$

为了对不连续的函数做导数，设计差分方法：

forward differencing $(partial f(x,y))/(partial x)  = (f(x+1,y) - f(x,y))/1$，滤波核$vec(-1,1)$

central differencing $(partial f(x,y))/(partial x) (f(x+1,y) - f(x-1,y))/2$，滤波核$vec(-1,0,1)$

噪声会对边缘检测带来很大的干扰。

#image("lec4_1.png")

为了减少这个影响，我们用高斯滤波先做滤波，再做边缘检测。

即$d/(d x) (f * g)$,$g$是高斯模糊

根据简单的数学推导，我们可以一步实现这个算法。$d/(d x) (f * g) = f * d/(d x) g$

=== Canny Edge Detector

+ 预处理：灰度化+高斯模糊
+ Sober算子边缘检测，并将x方向和y方向合并。
+ 非极大值抑制
+ 再次threshold
+ 将前面被筛选掉的可能点重新考虑，只有和其他边相连的做保留

问题：边缘和语义边缘不一定一致
== 角点检测

==== Harris Corner Detector

+ 灰度化+高斯模糊
+ Sober算子边缘检测
+ Harris求值
  + 求出$M = mat(sum_(x,y in W) I_x^2,sum_(x,y in W) I_x I_y;sum_(x,y in W) I_x I_y,sum_(x,y in W) I_y^2)$
  + 求$R = det(M) - alpha * tr(M)^2$
  + 求出角点
+ threshold和非极大值抑制

== blob检测（图像块检测）

边难以定位，角点难以解释

blob就是和周围不一样的一个区域。

blob检测算法：

先称高斯核为$f$

我们先从边缘检测中找灵感。为了做边缘检测，我们实际上是用$f'$对原函数滤波，其最大值就是边缘。

如果我们对原函数用$f''$滤波，那么显然0点就是边缘。函数长这个样子

#image("lec4_2.png")

后待续

== SIFT算法

+ 尺度不变性
+ 描述力

推荐阅读：https://arxiv.org/abs/1602.07064