= 图像拼接

== 整体流程
+ 特征提取
+ 特征点匹配
+ 解变换
+ 图像融合

== 变换

使用齐次坐标来表示一个变换。$vec(x',y',1) = mat(a,b,c;d,e,f;0,0,1)vec(x,y,1)$

=== 解变换

对于一个特征点：$ vec(x_i',y_i') = mat(a,b;d,e)vec(x_i,y_i)  + vec(c,f) $

将所有点联立 $ vec(dots.v,x_i',y_i',dots.v) = mat(dots;x_i,y_i,0,0,1,0;0,0,x_i,y_i,0,1;dots) vec(a,b,c,d,e,f) $

这个方程组方程的数目远远大于我们要求的未知数，所以大概率无解。用最小二乘法求解。

$ A_(2n times 6) t_(6 times 1) = b_(2n times 1) $

解得：$ t = (A^T A)^(-1) A^T b $

=== Homography

为什么要用？由于两张图片的像平面不一定平行，必须使用一个3*3的变换才能使得其变到同一个平面上。

加约束条件：齐次坐标的归一化条件。

#image("lec5_1.png")

== Feature matching

=== RANSAC算法

== 图像拼接

=== Laplacian拼接

使用Laplacian金字塔，对分割区域做高斯金字塔，就可以对高低频做合适的混合。

=== Poisson拼接

Laplacian拼接的问题在于其对于色调处理很差，会造成颜色不和谐。

于是我们要尝试将图像的梯度保持

目标函数：$E = min_f sum_(i,j in Omega) norm(gradient f(i,j) - gradient g(i,j))^2$

边界条件：要求边界上的值为dest图上的值。

