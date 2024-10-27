#import "@local/PKU-Typst-Template:0.1.0": 通用作业

#set text(lang: "en",size: 16pt)



#show: 通用作业.config.with(
  course_name: "00331900 — Probability and Mathematical Statistics",
  student_id: 2300012154,
  student_name: "林乐天",
  hw_no: 4,
)

#let QED = sym.square.stroked
#set text(size: 14pt,font: "Times New Roman")
#set enum(numbering: "(a)")
#let Var = "Var"
#let dx = "dx"
= Problem 1
== Question
Let $X$ be a random variable with probability density function
$ f(x) = cases(c(1-x^2) " " x in (-1,1),0 "otherwise") $
+ What is the value of c ?
+ What is the cumulative distribution function of X ?

== Answer
$integral_{-1}^1 f(x) dx = 1=> c = 3/4$

So,the cumulative distribution function of X is $ f(x) = cases(0 "                       "x < -1,3/4(x - 1/3 x^3) + 1/2 "   " -1 <= x <= 1,1 "                     " x > 1) $.

= Problem 2
== Question
Two types of coins are produced at a factory: a fair coin and a biased one that comes
up heads 55 percent of the time. We have one of these coins, but do not know whether
it is a fair coin or a biased one. In order to ascertain which type of coin we have, we
shall perform the following statistical test: We shall toss the coin 1000 times. If the
coin lands on heads 525 or more times, then we shall conclude that it is a biased coin,
whereas if it lands on heads less than 525 times, then we shall conclude that it is a
fair coin. If the coin is actually fair, what is the probability that we shall reach a false
conclusion? What would it be if the coin were biased?
== Answer
$X ~ "Binomal"(1000,0.5)$

Considering the DeMoivre-Laplace Theorem$ lim_(x->infinity) P{a<(X_n - n p) / sqrt(n p (1 - p)) < b} = Phi(b) - Phi(a) $,
when $n p (1-p) >= 10$,we can say that $P{a<(X_n - n p) / sqrt(n p (1 - p)) < b} = Phi(b) - Phi(a)$.
=== Subproblem a

Mean: $mu = 1000 * 0.5 = 500$

Standard deviation: $sigma = sqrt(1000 * 0.5 * 0.5) = 5sqrt(10)$

Possibility of heads more than 525: $P{X_n >= 524.5} = P(Z > 24.5  / 5 sqrt(10)) = 0.0606$

=== Subproblem b

Mean: $mu = 1000 * 0.55 = 550$

Standard deviation: $sigma = sqrt(1000 * 0.55 * 0.45) = (3sqrt(110))/2$

Possibility of heads less than 525: $P{X_n <= 524.5} = P(Z < (-25) / sigma) = 0.0525$

= Problem 3
== Question
You are allowed to take a certain test three times, and your final score will be the maximum of the test scores. Thus,
$ X = max{X_1,X_2,X_3} $
where $X_1$, $X_2$, $X_3$ are the three test scores and $X$ is the final score. Assume that your score in each test takes one of the values from 1 to 10 with equal probability 1/10, independently of the scores in other tests. What is the PMF $p_X$ of the final score?

== Answer

It's easily to know that the total number of possible outcomes is $10^3 = 1000$.

We first try to find the CDF of the distribution.

$F(X <= k)\ = F(X_1 <= k,X_2 <= k,X_3 <= k)\ = F(X_1 <= k)  F(X_2 <= k)  F(X_3 <= k)$.

So, we can know that $F(X <= k) = (k / 10)^3$.

$p_X(k) = F(X <= k) - F(X <= k - 1) = (k / 10)^3 - ((k - 1) / 10)^3$.

= Problem 4
== Question
Find the distribution of $R = A sin theta$, where $A$ is a fixed constant and $θ$ is uniformly
distributed on $(−π/2, π/2)$. Such a random variable R arises in the theory of ballistics.
If a projectile is fired from the origin at an angle $alpha$ from the earth with a speed $v$, then
the point $R$ at which it returns to the earth can be expressed as $R = (v^2/g) sin 2alpha$,
where g is the gravitational constant, equal to 980 centimeters per second squared.
== Answer
$R = A sin theta$.

First we need to find the CDF of the distribution.

$ F(R <= r) = P(theta  < arcsin(r / A)) = arcsin(r / A) / pi + 1/2 $

Then the PDF of the distribution is the derivative of the CDF.

$ p(r) = (d F(r)) / (d r) = A^2/sqrt(A^2-r^2) $

= Problem 5
== Question

Let $Z_n$, $n ≥ 1$, be a sequence of random variables and $c$ be a constant such that, for
$forall epsilon > 0$, $P {| Z_n - c | > epsilon} -> 0$ as $n -> infinity$. Show, for any _bounded continuous function_
$g$,
$ E[ g(Z_n) ] = g(c) "as "n -> infinity $ 

== Answer

For all $|Z_n - c| < epsilon$,we have $|g(Z_n) - g(c)| < delta$.We remark the maximum value of $|g(Z_n)|$ is $B$

So, 

$E[ g(Z_n) ]\
= integral_RR g(x) d P_Z_n\
= integral_(|Z_n - c| < epsilon) g(x) d P_Z_n + integral_(|Z_n - c| >= epsilon)g(x) P(x) dx$

When $n -> infinity$,$integral_(|Z_n - c| >= epsilon)g(x) P(x) dx < B integral_(|Z_n - c| < epsilon)g(x) P(x) dx -> 0$.

So the function is $E[ g(Z_n) ] = integral_(|Z_n - c| < epsilon) g(x) d P_Z_n $,
where $g(c) - delta < E < g(c) + delta$.

So $E[ g(Z_n) ] = g(c)$