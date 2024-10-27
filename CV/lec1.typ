= intro
== 什么是计算机视觉
John MyCarthy: “An attempt will be made to find how to make machines use language,form abstractions and concepts,solve kinds of problems now reserved for humans, and improve themselves.”

从图像重建三维，从图像重建语义

*让计算机能够看*，让计算机知道看什么，看哪里，看的是什么。

=== 应用
- 自动驾驶
- 运动检测
- 增强现实
- 安防
- 人脸识别
- 图像处理和合成
=== 和其他学科的联系
- 生物视觉
- 计算机图形学
- 图形处理
- 机器学习

和图形学的差异：计算机视觉是从一个图片形成三维图形、语义，而计算机图形学是从三维图形形成图片。

计算机视觉是一个病态的问题，投影过程是有信息损失的，需要补充一些知识才能重建模型。

== CV is hard

=== Semantic gap(语义鸿沟)
- 图像和语义之间的鸿沟
- 图像和物体之间的鸿沟
- 图像和动作之间的鸿沟

=== Images are 2D Projections of 3D Scenes
图片是一个三维场景的二维投影，存在很多信息损失，也存在很多错觉。

=== Viewpoint Variation(视角变化)
视角的变化会对物体的形状发生很多变异，使得物体看起来完全不同。

=== Deformation(形变)
物体在运动中会形变，导致物体看起来完全不同。

=== Occlusion(遮挡)
遮挡会导致物体的一部分被遮挡，使得物体看起来完全不同。

=== Illumination(光照)
光照的变化会导致物体看起来完全不同。

但这也是一个机遇，使用不同的光照，我们可以得到物体的三维构建。

=== Motion Blur(运动模糊)

运动中的物体，会产生很大的模糊，使得重建造成巨大困难。

=== Intra Class Variation(类内差异)

同一类物体，在内部也会有很大的差异，有时候可能甚至会出现类内差异大于类间差异的问题。

=== 1960s-1970s
- **立体视觉 (Stereo)**
  - 1968-1972: Rosenblatt's Perspective
  - 1963: Larry G. Roberts: Blocks World
  - 1966: MIT Summer Vision Project
  - 1969: Minsky 提出 XOR 问题，导致神经网络寒冬
  - 1970: Shape from Shading（从阴影恢复形状）
  - 1978: Intrinsic Images
  - 1980: Photometric Stereo（从多个光照情况还原三维形状）
  - 1981: Essential Matrix（本征矩阵）
  - 1981: Binocular Scanline Stereo（双目重建）
  - 1981: Dense Optical Flow（光流，可以重建运动）

- **低级视觉 (Low-level vision)**
  - 1980s: Part-based model
    - 1973: Pictorial Structures
    - 1976: Generalized Cylinders（旋转体，扫掠曲线）
    - 1986: Superquadrics（二次曲面的泛化）
    - 特点：表达复杂关系，紧凑表示

=== 1980s-1990s
- **神经网络 (Neural networks)**
  - 1986: Backpropagation（反向传播算法）
  - 1986: 第一辆自动驾驶汽车

- **3D 几何 (3D geometry)**
  - 1992: Structure from Motion（从运动恢复结构）
  - 1992: ICP算法（迭代最近点算法）
  - 1996: Volumetric Fusion（体积融合）
  - 1998: Multi-View Stereo（多视图立体视觉）

=== 2000s-2010s
- **特征工程 (Feature engineering)**
  - 1998: Convolutional Neural Networks（卷积神经网络）
  - 1999: SIFT（尺度不变特征变换）
  - 2006: Photo Tourism
  - 2009: Building Rome in a Day

- **深度学习 (Deep learning)**
  - 2009-2012: ImageNet 和 AlexNet
  - 2012-Now: 深度学习时代
  - 2014: 对抗神经网络
  - 2014: 3D Scanning
  - 2015: 3D Scanning
  - 2015-2017: Semantic Segmentation（语义分割）
  - 2017: Mask R-CNN
  - 2017: Image Captioning（图像描述）
  - 2018: Human Shape and Pose（人体形状和姿态）
  - 2016-2020: 3D Deep Learning（3D 深度学习）
  - 2020: Neural Radiance Field (NeRF)（神经辐射场）

=== 2020s
- **多模态学习 (Vision and other modalities)**
  - 2018-2022: Vision and other modalities（视觉与其他模态）