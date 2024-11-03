#import "@local/PKU-Typst-Template:0.1.0": 通用作业

#set text(lang: "en",size: 16pt)



#show: 通用作业.config.with(
  course_name: "00331900 — Probability and Mathematical Statistics",
  student_id: 2300012154,
  student_name: "林乐天",
  hw_no: 7,
)

#let QED = sym.square.stroked
#set text(size: 14pt,font: "Times New Roman")
#set enum(numbering: "(a)")
#let Var = "Var"
#let dx = "dx"
#let dy = "dy"
#let Cov = "Cov"

= Problem 1

== Question
The county hospital is located at the center of a square whose sides are 3 miles wide. If an accident occurs within this square, then the hospital sends out an ambulance. The road network is rectangular, so the travel distance from the hospital, whose coordinates are $(0, 0)$, to the point $(x, y)$ is $|x|+|y|$. If an accident occurs at a point that is uniformly distributed in the square, find the expected travel distance of the ambulance.

== Answer
It's obvious that both $x$ and $y$ fits a uniform distribution in $[-1.5,1.5]$,so the PDF of $x$ and $y$ is $f(x) = 1 / 3 (x in [-1.5,1.5])$,$f(y) = 1 / 3 (y in [-1.5,1.5])$,therefore the PDF of the combination distribution is $f(x,y) = 1 / 9 (x,y in [-1.5,1.5])$.

The expected travel distance is $ EE[|x|+|y|] = integral_(-3/2)^(3/2) integral_(-3/2)^(3/2) |x| + |y| dx dy = 2 * 9/4 * 3 = 27/2 $

= Problem 2

== Question
Let $X_1, . . .$ be independent with common mean $mu$ and common variance $sigma^2$, and set $Y_n = X_n+ X_(n+1) + X_(n+2)$. For $j >= 0$, find $"Cov"(Y_n,Y_(n+j))$.

== Answer
$"Cov"(Y_n,Y_(n+j)) = "Cov"(X_n + X_(n+1) + X_(n+2),X_(n+j) + X_(n+j+1) + X_(n+j+2)) \ = sum_(k=0)^2 sum_(l=0)^2 Cov(X_(n+k),X_(n+j+l))$

For $X_1,...$ are independent,$ Cov(X_(n+k),X_(n+j+l)) = cases(0",  "&k != j + l,sigma^2","&k = j + l) $

If $j > 2$,$k != j + l$ for all $k,l$. So $Cov(X_(n+k),X_(n+j+l)) = 0$.

If $j = 2$,$k = j + l$ for $k=2,l=0$. So $Cov(X_(n+k),X_(n+j+l)) = sigma^2$

If $j = 1$,$k = j + l$ for $k=1,l=0$ and $k = 2,l=1$. So $Cov(X_(n+k),X_(n+j+l)) = 2sigma^2$.

If $j = 0$,$k = j + l$ for $k=0,l=0$ and $k = 1,l=1$ and $k = 2,l=2$. So $Cov(X_(n+k),X_(n+j+l)) = 3sigma^2$

$ Cov(Y_n,Y_(n+j)) = cases(0& j>2,
sigma & j = 2,
2sigma^2 & j = 1,
3sigma^2 & j = 0) $

= Problem 3

== Question
$n$ people throw their hats in a box and then pick a hat at random. Let us find the variance of $X$, the number of people that pick their own hat. We have
$ X = X_1 + · · · + X_n $
where $X_i$ is the random variable that takes the value 1 if the ith person selects his/her
own hat, and takes the value 0 otherwise. Calculate the $Var(X)$.

(Hint: $X_i$ is Bernoulli with parameter $p = P(X_i = 1) = 1/n$)

== Answer

$Var(X) &= Cov(X,X)\ &= Cov(sum_(i=1)^n X_i, sum_(i=1)^n X_i)\ &= sum_(i=1)^n sum_(j=1)^n Cov(X_i, X_j)\ &=sum_(i=1)^n Var(X_i)\ &= n 1/n (1 - 1/n) = 1 - 1/n$

= Problem 4

== Question

Show that $Z$ is a standard normal random variable and if $Y$ is defined by $Y = a +
b Z + c Z^2$, then
$ rho(Y,Z) = b / sqrt(b^2+2c^2) $

== Answer

$Z = 1/sqrt(2)e^(-x^2/2),EE[Z] = 0,Var[Z] = 1$.

$ rho(Y,Z) &= Cov(Y,Z) / (EE[Y] EE[Z])\ &=(Cov(a,Z) + b Cov(Z,Z) + c Cov(Z^2,Z)) / (sqrt(Var(Y)))\ &=b / sqrt(b^2 + 2c^2) $

= Problem 5

== Question
Let $X$ have moment generating function $M (t)$, and define $Psi(t) = log M (t)$. Show that

$ Psi''(t)|_(t=0) = Var(X) $.

== Answer

$Psi'(t) = (M'(t)) / M(t)$.

$Psi''(t) = (M''(t) M(t) - M'(t)^2) / M(t)$.

$M(t) = EE[e^(t X)],M(0) = 1,M'(0) = EE[X],M''(0) = EE[X^2]$.

$Psi''(t)|_(t=0) = EE[X^2] - EE[X]^2 = Var(X)$

= Problem 6

== Question
Consider a population consisting of individuals that are able to produce offspring (next generation) of the same kind. 
Suppose that, by the end of its lifetime, each individual will have produced j new offspring with probability $P_j,j>=0$ , independent of the number produced by any other individual.

The number of individuals initially present, denoted by $X_0$, is called the size of the zeroth generation.
All offspring of the zeroth generation constitute the first generation, and their number is denoted by $X_1$.
In general, let $X_n$ denote the size of the nth generation. Let $mu = sum_(j=0)^infinity j P_j$ and $sigma^2 = sum_(j=0)^infinity (j - mu)^2 P_j$ denote, respectively, the mean and the variance of the number of offspring produced by a single individual.
Suppose $X_0 = 1$. That is, initially there is a single individual in the population.

+ Show that $ EE[X_n] = mu EE[X_(n-1)] $
+ Show that $ EE[X_n] = mu^n $
+ Show that $ Var[X_n] = sigma^2 mu^(n-1) + mu^2 Var[X_(n-1)] $
+ Show that $ Var[X_n] = cases(sigma^2 mu^(n-1)(mu^n - 1) / (mu - 1)& "if" mu!=1,n sigma^2 & "if" mu = 1) $
+ The model just described is known as a branching process, and an important question for a population that evolves along such lines is the probability that the population will eventually die out. Let π denote this probability when the population starts with a single individual, i.e.,$ π := P {"population eventually dies out" | X_0 = 1} $Argue that π satisfies $ pi = sum^infinity_(j=0)P_j pi^j $

== Answer

=== problem a

$E[X_n | X_(n-1)]\ 
= sum_(j=0)^n j P_j X_(n-1)\ 
= mu X_(n-1)$

$EE[X_n] = EE[EE[X_n | X_(n-1)]] = mu EE[X_(n-1)]$

=== problem b

By the result of the previous problem $EE[X_n] = mu EE[X_(n-1)]$,the $EE[X_n]$ fit the definition of a geometric progression,whose common ratio is $mu$.

We put $EE[X_0] = 1$ into the formula of $EE[X_n]$, we get
$EE[X_n] = mu^n EE[X_0] = mu^n$.

=== problem c

$Var[X_n]& = EE[Var[X_n | X_(n-1)]] + Var[EE[X_n | X_(n-1)]]\ 
&= EE[X_(n-1) sigma^2] + Var[mu X_(n-1)]\ 
&= sigma^2 mu^(n-1) + mu^2 Var[X_(n-1)]
$

=== problem d

When $mu != 0$,$Var[X_1] = sigma^2 + mu^2 * 0 = sigma^2 = sigma^2 mu^0 (mu - 1)/ (mu - 1)$.

We suppose $n in NN,Var[X_n] = sigma^2 mu^(n-1)(mu^n - 1) / (mu - 1)$,then when $k = n+1$:

$Var[X_(n + 1)] &= sigma^2 mu^n + mu^2 sigma^2 mu^(n-1)(mu^n - 1) / (mu - 1)\
&=sigma^2 mu^n (1 + (mu^(n+1) - mu) / (mu - 1))\
&= sigma^2 mu^n (mu^(n + 1) - 1) / (mu - 1)$

When $mu = 0$,$Var[X_n] = sigma^2 + Var[X_(n-1)] = n sigma^2$

=== problem e

First, we need to find $P{"population eventually dies out" | X_0 = k}$.

For the progress is a branching process, $X_0$s should not disturb others, so we can say that $P{"population eventually dies out" | X = k} = P{"population eventually dies out" | X = 1}^k = pi^k$.

The possibility of $P{"population eventually dies out"} = sum_(j=0)^infinity P{"population eventually dies out" | X_1 = j} P(X_1 = j) = sum_(j=0)^infinity pi^j P_j$.