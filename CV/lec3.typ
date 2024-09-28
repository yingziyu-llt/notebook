= 图像处理

== 图像处理

=== 图像表示

先认为图像是一个函数$I(x,y) -> "color"(r,g,b)$

- darken:$I(x,y)-128$
- lighten:$I(x,y)+128$
- low contrast:$I(x,y) * 0.5$
- invert $255 - I(x,y)$
- gray: $(0.3,0.6,0.1) dot I(x,y)$

直方图均衡化：将累积分布直方图画出来，然后将其每个点的亮度改成其对应y的值，就可以完成归一化

=== 图像滤波

取一个小区域来处理，叫滤波

记$I(i,j)$是一个$w times h$的图像，$f(i,j)$是一个$w times h$的滤波器

$ I_"filtered" = sum^p_(k=-q) sum^(-q)_(l=q) I(i+k,j+l) * f(k,l) $

边界效应处理
- 忽略边界处理
- 补0（pad）
- 假设周期性
- 假设反射性

常见滤波器：

- 恒等$I = mat(0,0,0;0,1,0;0,0,0)$

- 平移$mat(0,0,0;0,0,0;0,1,0)$向上平移一个像素

- 平滑(box filter)$1/9 mat(1,1,1;1,1,1;1,1,1)$

- 高斯模糊，实际是低频滤波$1/16 mat(1,2,1;2,4,2;1,2,1)$

- 锐化，高通滤波$mat(0,0,0;0,2,0;0,0,0) - 1/9 mat(1,1,1;1,1,1;1,1,1)$,即$I + lambda(I - I_"blur")$

滤波加速：可以把一个二维滤波转化为两个一维滤波，将$K^2$优化到$2K$，即可分离滤波

性质
- 线性
- 实际是一个Correlation，不是Convolution
- 可以被写称成一个矩阵乘法

=== 非线性滤波

==== 中值滤波

椒盐噪音（冲击噪音，直接是0，255）这种值的噪音，高斯滤波去除不了，反而会扩大噪声的范围

采用中值滤波，就可以去除这种离群值的噪点。

方法：取一个窗口，将窗口内的值排序，取中间值

=== 双边滤波

对图像进行模糊，同时保留边缘信息

方法：根据这个点和周围像素颜色的欧式距离(range filter)，距离越远，权重越小，距离越近，权重越大，用这个权重加权到高斯滤波(domain filter)上。

== 滤波的应用
=== 模式匹配

使用滤波器的特征，即只有和滤波器相像的波可以顺利通过，获得比较大的卷积值，这样可以实现模式匹配。但是，需要注意的是，像素的原值会对结果产生较大的影响，于是我们需要像素本身的值做一个归一化操作，这样才能更好提取特征。