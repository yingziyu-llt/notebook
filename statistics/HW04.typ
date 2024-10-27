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

= Problem 1
== Question
Suppose that the distribution function of $X$ is given by
$ F(b) = cases(0 " "b < 0,
              b/4 " " 0<=b<1,
              1/2 + (b - 1) / 4 " " 1<=b<2,
              11/12 " " 2<=b<3,
              1 " " 3<=b) $
+ Find $P {X = i}, i = 1, 2, 3$.
+ Find $P{1/2 < X < 3/2}$

== Solution
=== problem a
For prob (a), we know that $ F(b) = sum_(i=0)^b P{X = i} $ So,we can get the origin function $P{X = i}$ by a derivative way. 

$ P{X=i} = lim_(delta->0^-) (F(i + 1 + delta) -F(i + delta)) $,so the result is:

$ P{X=i} = cases(b/4" " i = 0,
1/4 " " i = 1, 
1/6 " " i = 2,
1/12 " " i = 3
) $
=== problem b
For prob(b), we have $ P{1/2 < X < 2/3} = P{X < 2/3} - P{X < 1/2} = F(3/2) - F(1/2) = 1 / 2 $


= Problem 2
== Question
If $EE[X] = 1$ and $Var(X) = 5$, find
+ $EE[(2 + X)^2]$;
+ $Var(4 + 3X)$.
== Solution
==== problem a
$Var(x) = EE(x^2) - EE(x)^2$,therefore:

$ EE[X^2] = Var(X) + EE[X]^2 = 5 + 1 = 6 $

$EE[(2 + X)^2]\ = EE[X^2 + 4X + 4]\ = EE[X^2] + 4EE[X] + 4\ = 6 + 4 + 4\ = 14$

==== problem b
$Var(4 + 3X) = 9Var(X) = 45$

= Problem 3

== Question
If the weather is good (which happens with probability $0.6$), Alice walks the 2 miles
to class at a speed of $V = 5$ miles per hour, and otherwise drives her motorcycle at a
speed of $V = 30$ miles per hour. What is the mean of the time $T$ to get to class?

== Solution

We first suppose a random variable $X$ to denote the time costs.

If wether is good, Alice need $2 / 5* 60 = 24$ minutes to get to class,otherwise, Alice need $2 / 30 * 60 = 4$ minutes to get to class. 

The mean of the time, in another words, is $EE[X]$. Therefore, $ T = EE[X] = 24 * 0.6 + 4 * 0.4 = 16 "minutes" $

= Problem 4

== Question
The number of times that a person contracts a cold in a given year is a Poisson random
variable with parameter $lambda = 5$. Suppose that a new wonder drug (based on large
quantities of vitamin C) has just been marketed that reduces the Poisson parameter
to $lambda = 3$ for 75 percent of the population. For the other 25 percent of the population,
the drug has no appreciable effect on colds. If an individual tries the drug for a year
and has 2 colds in that time, how likely is it that the drug is beneficial for him or her?

== Solution

Firstly we denote beneficial as $b$. 
We call $X$ ,a random variable, as the number of cold.We have:
$ P(x) = e^(-lambda) lambda^x / x! $

Therefore,$P(2) = e^(-lambda) lambda^2/2$.

$ P(b | "2 cold") = P(b space sect "2 cold") / (P("2 cold" | b) * P(b) + P("2cold" | b^c) *P(b^c)) $

Easily, $P(b space sect "2 cold") = P(2 | b) * P(b)$.

So, the result is $ (27/8 e^(-3)) / (27/8 e^(-3) + 25/8 e^(-5)) $

is about 3.16e-4.
= Problem 5
== Question
Show that $X$ is a Poisson random variable with parameter $lambda$ , then
$ EE [X^n] = lambda EE[ (X + 1)^(n - 1)] $
Now use this result to compute $EE [X^3]$.

== Solution

$ Var(x) = lambda = EE[X^2] - EE[X]^2 => EE[X^2] = lambda + lambda^2 $

$ EE[X^3] = lambda EE[(X + 1)^2] = lambda EE[X^2 + 2X + 1] = lambda (EE[X^2] + 2EE[x] + 1) = lambda^3 + 3lambda^2 + lambda $

= Problem 6

== Question
Let $X$ be a random variable that takes on values between 0 and c. That is, $P {0  <= X <= c} = 1$. Show that

$ Var(X) <= c^2 / 4 $

== Solution

$ Var(X) = EE[X^2] - EE[X]^2 <= c EE[X] - EE[X]^2 $

The maximum value of function $f(x) = c x - x^2,x in [0,c]$ is $c^2 / 4$ if and only if $x = c/2$.

So,$Var(x) <= c^2 / 4$