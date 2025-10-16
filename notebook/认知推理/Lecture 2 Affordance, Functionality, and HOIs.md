常规的pipeline：object detection, Scene parsing; Understand Relation; Execution
             Pre-defined label; HOI; Humanoid
Challenges: label的数量不够；Long-tail problems
我们不需要object detection，我们更需要一个Possibility for Actions

# C1 Affordance
## 认知模型
人造场景就是为了afford各种各样的activities，不同的地方有不同的功能
Affordance提供了一个中介的作用，用以高效理解极度复杂的环境
不同的样子，几何结构，差异巨大，但可能category是一样的，他们的affordance是一样的。
Mirror Neuron:看别人做什么东西，想象到自己也在做，脑区相同区域激活了。
Gibsonian Affordance：环境里面的物体的affordance是你想做的东西决定的。No separate, distinct, cognitive loop

## 计算模型
Perceive an affordance != classify an object
scene affordance:用某些pose去fit到场景里面。
social affordance:

# C2 HOI
If you can't solve a problem, solve a big problem.
加入一个人后，问题空间变大了，但解空间明显变小了。

## 2D HOI
可以detect human/object/human+object
$H=arg\max_H P(H|I)$;$O=arg\max_O P(O|I)$;$H,O=arg\max_{H,O} P(H,O|I)$
human+object空间最大，但也是最简单的。
Human/Object and Action 是非常相关的，需要共同考虑才能正常处理

<Human, Verb, Object> from $P(A|H,O)P(H,O|I)$
还可以把$P(A|H,O)$建模成一个图，把每个entity建模成一个node，把那个之间的interaction建模成边。用message passing方法来解决这个问题。

## 3D HOI
可以将复杂的解空间简化，将各个不同投影产生的图片的embedding聚合在一起。同时，还可以方便的获取所有需要的信息。
表示3D的方法：
- voxel
- point cloud
- mesh
- SDF
SMPL：实际上是骨骼+皮肤+动作。
T: Linear Blend skinning,$t = w_k*I_k$
![[Pasted image 20250925150946.png]]

# C3 Robotic
Image的space太大了，是$10^{2219328}$量级的，没法做。Video space更大，还要乘以时间\*fps. Motion/Configuration space更可怕，动作是在连续空间上的。计算一下，发现Configuration space比Video space小很多。但是为什么Configuration space为什么那么难呢？
Video Generation 是 soft constraints ，但是 Robotics Generation 是 hard constraints，错一点都不行。
## 传统算法
### 被动行走
人形机器人行走分成主动和被动两种。被动走相当于一个去掉轮毂的轮子，要在斜坡上走。后期加了弹簧做动能回收。
ZMP：零力矩点。如果某一个点他的合力只有向上的力，那么他就是ZMP。基于ZMP的控制方法的缺陷：难以非平面，脚特别大
### 主动行走
主要讲的线性倒立摆。忽略腿的质量，那么就很容易列出一组ODE，是有解析解的。
利用OE(orbit energy)可以计算出是否能走出这一步、落地的点在哪。
缺陷：限制太多，导致不灵活。

## AI based方法
WBC：全身控制器，用来调度资源，切换策略，决定哪个地方占用多少计算资源。可以高效计算非线性的实时模型。command->WBC->torque->robot->state->WBC

2019年，ANYmal，基于RL。就是把WBC换成NN

RL缺陷：Reward的参数难调。

另一种方法是给一个reference motion,即模仿学习。需要大量人的数据。MoCaf的问题在于关节对不上。

