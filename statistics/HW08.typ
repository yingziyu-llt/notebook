#import "@local/PKU-Typst-Template:0.1.0": 通用作业
#sym.minus
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

= Problem 1

== Question

Let X be exponentially distributed with parameter $lambda = 1$, please approximate the probability $P (c > 1)$ using Chebyshev's inequality.

== Answer

By Markov's inequality, we have $ P(C>1) <= EE[C] / 1 = 1 $


= Problem 2

== Question
Let the random variable X follow a binomial distribution $B(1, p)$, and let $X_1, X_2, . . . , X_n$
be $n$ independent observations of $X$.
+ Calculate the probability distribution of $(X_1, X_2, . . . , X_n)$.
+ Calculate the probability distribution of $sum_(i=1)^n X_i$.
+ Calculate $E(overline(X))$, $D(overline(X))$, and $E(S^2)$.

== Answer
=== problem a

For the $X_1,X_2,...,X_n$ are independent, we have $P(X_1=x_1,X_2=x_2,...,X_n=x_n) = P(X_1=x_1)P(X_2=x_2)...P(X_n=x_n)$. So the possibility of the sequence depends on the number of $1$ in the sequence. Let's suppose the sequence has $m$ 1.

$P(X_1=x_1,X_2=x_2,...,X_n=x_n) = p^m (1 - p)^(n-m)$.

=== problem b
The distribution of $sum_(i=1)^n X_i$ is binomial distribution $B(n,p)$.

=== problem c

$EE(overline(X)) = EE[1/n sum_(i=1)^n X_i] = 1/n sum^n_(i=1) EE[X_i] = 1/n n p = p $.

$D(overline(X)) = Var(1/n sum^n_(i=1) X_i) = 1/n^2 Var(sum^n_(i=1) X_i) = 1/n p(1-p)$.

$EE(S^2) &= EE[1/(n-1) sum^n_(i=1) (X_i - overline(X))^2] \
&= 1/(n-1) sum^n_(i=1) Var[(n -1)/n X_i - 1/n sum_(i!=j)X_j] \
&= 1/(n-1)sum^n_(i=1) ((n-1)^2/n^2 Var[X_i] + 1/n^2 sum_(i!=j)Var[X_j])\
&= 1/(n-1) sum^n_(i=1) ((n-1)^2/n^2 p(1-p) + (n-1)/n^2 p(1-p))\
&= p(1-p)$

= Problem 3
== Question
Let $p$ be the fraction of voters who support a particular candidate for office. We interview $n$ “randomly selected” voters and record the fraction $M_n$ of them that support the candidate. We interpret “randomly selected” to mean that the $n$ voters are chosen independently and uniformly from the given population. We view $M_n$ as our estimate of $p$.
+ Approximate the upper bound of $P(|M_n - p| <= epsilon)$.
+ Calculate the bound of the probability if $epsilon = 0.1$ and $n = 100$.

== Answer
By Chebyshev's inequality, we have $P(|M_n - p| <= epsilon) <= Var(M_n)/epsilon^2$. 

$n M_n  ~ B(n,p)$,so $P(|M_n - p| <= epsilon) <= (p(1-p)) / (n epsilon^2)$ 

When $n = 100$, $epsilon = 0.1$, we have $P(|M_n - p| <= epsilon) <= p(1-p) / (100 * 0.1^2) = p(1-p)$.

= Problem 4

== Question
Suppose a random variable X follows a normal distribution $N (mu, sigma^2)$ with a sample size of 16, unknown $mu$ and $sigma^2$. Calculate:
+ The probability $P (S^2 / sigma^2 <= 2.041)$, given that $S^2$ is the sample variance.
+ $D(S^2)$.

== Answer

=== problem a

$P(S^2 / sigma^2 <= 2.041) = P((n-1)S^2 / sigma^2 <= 30.615)$.

By ChatGPT, I know that $(n-1)S^2 / sigma^2 ~ chi^2(n-1)$,so $(S^2 / sigma^2 <= 2.041) approx 0.95$.

=== problem B

By ChatGPT, $E(S^2) = sigma^2$,so $D(S^2) = 2sigma^4/(n-1) = (2sigma^4)/15$

So why use $chi$??? Have we learned it? 
= Problem 5
== Question
Two different box-filling machines are used to fill cereal boxes on an assembly line. The critical measurement influenced by these machines is the weight of the product in the boxes. Engineers are quite certain that the variance of the weight of product is $sigma^2 = 1$ ounce. Experiments are conducted using both machines with sample sizes of 36 each. The sample averages for machines A and B are $ overline(x)_A = 4.5$ ounces and $overline(x)_B = 4.7$
ounces. Engineers are surprised that the two sample averages for the filling machines are so different.

+ Use the Central Limit Theorem to determine$ P(overline(x)_B - overline(x)_A ≥ 0.2) $under the condition that $μ_A = μ_B$ .
+ Do the aforementioned experiments seem to, in any way, strongly support a conjecture that the population means for the two machines are different? Explain using your answer in (a).

== Answer 

$P(overline(x)_B - overline(x)_A ≥ 0.2) &= P(1/n sum_(i=1)^n (x_(A i) - mu_A) - 1/n sum_(i=1)^n (x_(B i) - mu_B) >= 0.2)\
&= P(1/n sum_(i=1)^n (x_(A i) - x_(B i)) >= 0.2)$.

For $X_A ~ N(mu_A,sigma^2)$ and $X_B ~ N(mu_B,sigma^2)$,$X_A - X_B ~ N(0,2)$.

$P(overline(x)_B - overline(x)_A ≥ 0.2) = P((sum_(i=1)^n (x_(B,i) - x_(A,i)) - 0)/(sqrt(2n))>= (0.2sqrt(n))/(sqrt(2)))\
=1-Phi((1.2)/(sqrt(2))) approx 0.2$

So we can't say that they are different.

= Problem 6

== Question
If $X_1, X_2, . . . , X_n$ are independent random variables having identical exponential distributions with parameter θ, show that the density function of the random variable $Y = X_1 + X_2 + · · · + X_n$ is that of a gamma distribution with parameters α = n and β = θ.


== Answer

$f(X_i) = theta e^(-theta x_i)$

$M_X (t) = EE[e^(t x)] = integral^infinity_0 theta e^(t x - theta x)  dx = theta / (theta - t)$

$M_Y (t) = theta^n / (theta - t)^n$ fits the gamma distribution with parameters $α = n$ and $β = θ$.

