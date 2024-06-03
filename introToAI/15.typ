= MDP和动态规划

== MDP(马尔可夫决策过程)

=== 马尔可夫性
要求$S_t$只和$S_t-1$有关。代表了计算$V_pi$只需要看下一步就可以了，因为$V_pi,1=V_pi,2=...=V_pi,n$，于是往后任意相同步就只是下一步乘上一个常数。

=== 建模
1. 状态集合S
2. 动作集合A
3. 状态转移函数$P : <S,A,S> -> RR^+$,$P(s,a,s')=P[s'|s,a]$
4. 奖励函数$R:<S,A,RR^+> -> RR^+$

=== 状态价值和动作价值
$V_pi (S_1)=sum_a pi(a|s) sum_"s',r" p(s',r|s,a) [r + gamma V_pi(s')]$

$Q_pi (s,a) = sum_"s',r" p(s',r|s,a) [r + gamma V_pi(s')]$

于是得到了Bellman方程
$V_pi (s) = sum_a pi(a|s) Q_pi(s,a)$

定义$V^*(s) = max_pi V_pi (s)$叫做最优状态价值,最优策略就是能取到最优状态价值的策略$pi^*$

Bellman最优方程$V^*(s)=sum_{a} pi(a|s) Q^*(s,a)$

== 动态规划方法

适用于P,R已知的情况

=== 策略估值
对于任意策略$pi$,计算这个策略下的状态估值函数$V_pi$

使用Bellman方程的赋值形式：

$v_pi(s) = sum_a pi(a|s) sum_"s',r" p(s',r|s,a) [r + gamma v_pi(s')]$

迭代更新，$v_pi$是这个规则的不动点。

$v_"k+1" (s) = sum_a pi(a|s) sum_"s',r" p(s',r|s,a) [r + gamma v_k(s')]$
