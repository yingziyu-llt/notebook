#import "@local/PKU-Typst-Template:0.1.0": 通用作业
#sym.minus
#set text(lang: "en",size: 16pt)



#show: 通用作业.config.with(
  course_name: "00331900 — Probability and Mathematical Statistics",
  student_id: 2300012154,
  student_name: "林乐天",
  hw_no: 9,
)

#let QED = sym.square.stroked
#set text(size: 14pt,font: "Times New Roman")
#set enum(numbering: "(a)")
#let X1 = $X_1$
#let X2 = $X_2$
#let Xn = $X_n$
#let x1 = $x_1$
#let x2 = $x_2$
#let xn = $x_n$
#let dx = $"dx"$
*all $sum$ below means $sum_(i=1)^n$*
= Problem 1

== Question

Let $X1, X2, . . . , Xn$ be a sample from a population, with $x1, x2, . . . , xn$ as the corresponding sample values. Find the moments estimators and the estimated values for the unknown parameters in the following probability density or distribution laws.
+ $ f(x) = cases(theta c^theta x^(-(theta + 1))", "x > c,0 ", otherwise") $
+ $ f(x) = cases(sqrt(theta) x^(sqrt(theta) - 1)", "0 <= x <= 1,0 ", otherwise") $
+ $P{X=x} = vec(m,x) p^x (1-p)^(m-x) $

== Answer
=== problem a
$ EE[X] = integral_c^infinity theta c^theta x^(-theta) dx\
= (theta c)/(theta - 1) $

$ EE[X^2] = integral_c^infinity theta c^theta x^(-theta+1) dx\
= (theta c^2)/(theta - 2) $

Therefore,  $sum x_i / n = (theta c)/(theta - 1)$, $sum x_i^2 / n = (theta c^2)/(theta - 2)$.

$ theta = sqrt((sum x_i^2) /(n S)) + 1 $, $ c = (sum x_i) / n sqrt(sum x_i^2 / (n S theta)) $

=== problem b
$ EE[X] = integral_0^1 sqrt(theta) x^(sqrt(theta)) dx\
= sqrt(theta) / (sqrt(theta) + 1) $
therefore $ sum x_i / n = sqrt(theta) / (sqrt(theta) + 1) $, $ theta = (overline(X) / (1 - overline(X)))^2 $

=== problem c

$ EE[X] = m p $
$ p = overline(X)/m $.

= Problem 2
== Question
Find the maximum likelihood estimators and estimated values for the unknown parameters in the above problem.

== Answer
=== problem a

$ L(theta,c) = product f(x_i) = theta^n c^(n theta) product x_i^(-(theta + 1)) $
$ln L(theta,c) = n ln theta + n theta ln c - (theta + 1)sum ln x_i$

$ (partial (ln L)) / (partial theta) = n/theta + n ln c - sum ln x_i = 0 => theta = n/(sum (ln x_i - ln c)) $

$ (partial (ln L)) / (partial c) = n theta / c = 0 $. Therefore, $ c = min{x1,x2,dots,xn} $

=== problem b

$ L(theta) = product f(x_i) = theta^(n/2) product x_i^(sqrt(theta) - 1) $

$ ln L(theta) = n/2 ln theta + (sqrt(theta) - 1)sum ln x_i $

$ (partial (ln L)) / (partial theta) = n/(2 theta) + 1/(2sqrt(theta)) sum  ln x_i = 0 => theta = (n / (sum ln x_i) )^2 $

=== problem c
$ L(p) = product f(x_i) = product p^x_i (1-p)^(m-x_i) vec(m,x) $

$ ln L(p) = ln p sum x_i + m n - ln(1 - p) sum x_i + sum vec(m,x_i) $

$ (partial (ln L)) / (partial p) = sum x_i / p - sum x_i / (1 - p) = 0 => p = sum x_i / (m n) $

= Problem 3

== Question
Suppose we have a distribution with the following pdf (called a gamma distribution)
$ f(x|a) = a^5 / (4!) x^4 e^(-a x) $
Suppose we have independent data $x1, x2, . . . , x_m$ drawn from this distribution. Find the maximum likelihood estimate (MLE) for a. (*Suggestion*: The likelihood can be compactly written in terms of the sum S and the product P of the data.)

== Answer
$ L(a) = product f(x_i|a) = a^(5m) / (4!)^m product x_i^4 e^(-a sum x_i) $

$ ln L(a) = 5m ln a - m ln(4!) - 4 sum ln x_i - a sum x_i $

$ (partial ln L(a))/(partial a) = (5m) / a - sum x_i = 0 => a = (5m) / (sum x_i) $

= Problem 4
== Question

+ Let $X1, X2, . . . , Xn$ be a sample from a population with the probability density function $ f (x; θ) =
cases(theta x^(theta - 1)" ," 0 < x < 1,
0", otherwise") $ where θ is unknown. Find the maximum likelihood estimator for $U = e^(1 / theta)$.
+ Let $X1, X2, . . . , Xn$ be a sample from a normal population $N (mu, 1)$. With $mu$ unknown, find the maximum likelihood estimator for $theta = P {X > 2}$.
+ Let $x1, x2, . . . , xn$ be sample values from a population $b(m, θ)$, and let $θ = 1/3 (1+β)$. Find the maximum likelihood estimator for $β$.

== Answer

=== problem a
$ L(theta) = theta^n product x_i^(theta - 1) $
$ ln L(theta) = n ln theta + (theta - 1)sum x_i $
$ (partial ln L(theta)) / (partial theta) = n / theta + sum x_i = 0 => theta = -n / (sum x_i) $
$ U = e ^ (- overline(X)) $

=== problem b
$ L(mu) = product f(x_i) =  (1 / sqrt(2 pi))^n e^(-sum(x_i - mu)^2 / 2) $

$ ln L(mu) = -n ln sqrt(2pi) - sum(x_i - mu)^2 / 2 $ 

$ (partial ln L(mu)) / (partial mu)=0 => sum(x_i - mu) = 0 => mu = overline(X) $

$ theta = 1 - Phi(2 - overline(X)) $

=== problem c

From  problem 2(c),we have $ theta = overline(X)/m $,$ beta = 3theta - 1 = (3 overline(X) - m) / m $

= Problem 5

Suppose $X1, X2, . . . , Xn$ are samples from a population $X$, with E$(X) = μ$ and $D(X) = sigma^2$.
+ Determine the constant $c$ such that $c sum^(n-1)_1 (X_(i+1) - X_i)^2$ is an unbiased estimator for $sigma^2$.
+ Determine the constant $c$ such that $(overline(X)) - c S^2$ is an unbiased estimator for $μ$

== Answer
=== problem a
$EE[X_(i+1) - X_i] = EE(X_(i + 1)) - EE(X_i) = 0$

$EE[(X_(i+1) - X_i)^2] = "Var"(X_(i+1) - X_i) = 2"Var"(X) - 2 "Cov"(X_i,X_(i+1)) = 2sigma^2 $

$EE[sum^(n-1)_1 (X_(i+1) - X_i)^2] = 2(n-1)sigma^2$.$c = 1/(2(n-1))$

=== problem b
$EE[overline(X)] = mu$, $EE[S^2] = sigma^2$. Therefore, $c = 0$

= Problem 6
The gravitational constant (unit: $10^(−11) m^3 · "kg"^(−1) · s^(−2)$) is measured separately using gold and platinum spheres.
+ The observed values measured using gold spheres are$ 6.683;6.681;6.676;6.678;6.679;6.672 $
+ The observed values measured using platinum spheres are $ 6.661;6.661;6.667;6.667;6.664 $
Assuming that the measured values follow a normal distribution $N (μ, σ^2)$, where both $mu$ and $σ^2$ are unknown, calculate the 90% confidence interval for μ and the 90% confidence interval for $σ^2$ for both (1) and (2).

== Answer
=== problem a
$overline(X) = 6.678$,$S^2 = 1.497 times 10^(-5)$

$ t_(0.05,5) = 2.015$

Confidence interval:

$overline(X) plus.minus t s / sqrt(n) = 6.678 plus.minus 3.182 times 10^(-2) = [6.646,6.710]$

for $sigma^2$, $chi^2_(0.05,5) = 11.070$,$chi^2_(0.95,5) = 1.145$

Confidence interval:

$ [((n-1)S^2) / chi^2_(0.95,5),((n-1)S^2) / chi^2_(0.05,5) ] $

$ [6.762 times 10^(-6),6.537 times 10^(-5)] $

=== problem b
$overline(X) = 6.664$,$S^2 = 9 times 10^(-6)$

$ t_(0.05,4) = 2.1319$

Confidence interval:

$overline(X) plus.minus t s / sqrt(n) = 6.664 plus.minus 3.198 times 10^(-3) = [6.661,6.667]$

for $sigma^2$, $chi^2_(0.95,4) = 9.488$,$chi^2_(0.05,4) = 0.711$

Confidence interval:

$ [((n-1)S^2) / chi^2_(0.95,5),((n-1)S^2) / chi^2_(0.05,5) ] $

$ [2.846times 10^(-6),3.797times 10^(-5)] $

= Problem 7

Suppose the weights of randomly selected American college students are normally distributed with unknown mean $μ$ and standard deviation $sigma$. A random sample $X1, X2, . . . , X_10$ of 10 American college students yielded the following weights $x1, x2, . . . , x_10$
(in pounds):
$ 115, 122, 130, 127, 149, 160, 152, 138, 149, 180 $
From above,
+ Identify the likelihood function of unknown parameters μ and σ, given the sample;
+ Provide detailed steps to derive the maximum likelihood estimators for μ and σ using random sample $X1, X2, . . . , X_10$;
+ Using the given samples, compute the maximum likelihood estimates of μ and σ,respectively.
== Answer
=== problem a
$ L(mu,sigma) = product f(x_i|mu,sigma) = 1/((2 pi)^5 sigma^10) e^(-sum(x_i - mu)^2 / (2 sigma^2)) $
=== problem b
$ln L = -10ln sigma - 5 ln 2pi - sum(x_i - mu) ^2 / (2sigma^2)$
$ (partial ln L(mu,sigma)) / (partial mu) = sum(x_i - mu) / sigma^2 = 0 => mu = (sum x_i) / 10 $

$ (partial ln L(mu,sigma)) / (partial sigma) = -10 / sigma + sum(x_i - mu)^2 / (6sigma^3) = 0 => sigma^2=1/n sum(x - mu) $

=== problem c
$ mu = 142.2 $, $ sigma = 350.24 $