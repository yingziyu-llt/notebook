#import "@local/PKU-Typst-Template:0.1.0": 通用作业

#set text(lang: "en",size: 16pt)



#show: 通用作业.config.with(
  course_name: "00331900 — Probability and Mathematical Statistics",
  student_id: 2300012154,
  student_name: "林乐天",
  hw_no: 2,
)

#let QED = sym.square.stroked
#set text(size: 16pt, font: "Times New Roman")
#set enum(numbering: "(a)")

#通用作业.hw_prob("problem 1")[
  If two fair dice are rolled, what is the conditional probability that the first one lands on 6
given that the sum of the dice is $i$? Compute for all values of $i$ between 7 and 12
][
For i in {7, 8, 9, 10, 11, 12}, there is only one way to get that sum.

If we call the first one land on 6 event $E$,the sum of the dice is $i$ $F_i$, the conditional probability is $ P(F_i | E) = P(F_i E) / P(E) = (1 / 36) / (1 / 6) = 1 / 6 $
]

#通用作业.hw_prob("problem 2")[
  Find the term independent of x in the expansion of $ (sqrt(x)/sqrt(3) + sqrt(3)/(2x^2) )^10 $][
  We first find a general term of the expansion:

  $ (sqrt(x)/sqrt(3) + sqrt(3)/(2x^2) )^10 = sum_(k=0)^(10) vec(k,10) (sqrt(x)/sqrt(3) )^(10-k) (sqrt(3)/(2x^2) )^k\
  = sum_(k=0)^(10) vec(k,10) x^(5 -5 / 2 k) 3 ^ (k-5) $
  So when $ k = 2 $
  the term is independent of $x$.
  
   The term is $ vec(2,10) 3 ^ (2-5) = 5/3 $
  ]

#通用作业.hw_prob("problem 3")[
  Suppose that an ordinary deck of 52 cards (which contains 4 aces) is randomly divided into 4 hands of 13 cards each. We are interested in determining p, the probability that each hand has an ace. Let $E_i$ be the event that the ith hand has exactly one ace. 
  
  Determine $p = P (E_1 E_2 E_3 E_4)$ by using the multiplication rule][
    We redefine the problem as follows:
    - $S$ = all ways to divide 52 cards among 4 people (equally likely outcomes)
- $F_4$ = everyone gets an ace
- $F_3$ = at least 3 people has at least an ace
- $F_2$ = at least 3 people has at least an ace

$P (E_1 E_2 E_3 E_4)\ = P(F_4)\ =P(F_4 | F_3)P(F_3 | F_2)P(F_2 | S)P(S)\ = 39/51 * 26 / 50 * 13/49$
  ]

#通用作业.hw_prob("problem 4")[
  A family has two children, with each child equally likely to be male or female. What is the conditional probability that both children are boys, given that one of the boys was born on a Friday?
][
  We define $E$ as the event that both children are boys, $F$ as the event that one of the boys was born on a Friday.

  $P(E | F)\ = P(E F) / P(F)\ = 1/3$
]

#通用作业.hw_prob("problem 5")[
  A high school student is anxiously waiting to receive mail telling her whether she has been accepted to a certain college. She estimates that the conditional probabilities of receiving notification on each day of next week, given that she is accepted and that she is rejected, are as follows: 
  #table(
  columns: 3,
  align: center + horizon,
  stroke: (_, y) => if y == 0 or y == 5 { (bottom: 1pt) },
  table.header(
    [Day],
    [P(mail | accepted)],
    [P(mail | rejected)],
  ),
  [Monday], [.15], [.05],
[Tuesday], [.20],[.10],
[Wednesday], [.25], [.10],
[Thursday], [.15], [.15],
[Friday], [.10], [.20],
)
She estimates that her probability of being accepted is .6.

+ What is the probability that she receives mail on Monday?
+ What is the conditional probability that she received mail on Tuesday given that she does not receive mail on Monday?
+ If there is no mail through Wednesday, what is the conditional probability that she will be accepted?
+ What is the conditional probability that she will be accepted if mail comes on Thursday?
+ What is the conditional probability that she will be accepted if no mail arrives that week?
][
  We redefine the event as follows:
  - $E$:Being accepted
  - $F_i$ get mail on day $i$

  + $P(F_1)\ = P(F_1 E) + P(F_1 E^c)\ = P(F_1 | E)P(E) + P(F_1 | E^c)P(E^c)\ = 0.15 * 0.6 + 0.05 * 0.4 = 0.11$
  + $P(F_2)\ = P(F_2 E) + P(F_2 E^c) \ = P(F_2 | E)P(E) + P(F_2 | E^c)P(E^c) \ = 0.20*0.6+0.10*0.4=0.16$,\ $P(F_2 | F_1^c) = P(F_2 F_1^c)/ P(F_1^c) = 0.16 /0.81=16/81 $

  + $P(E | F_1^c F_2^c F_3^c)\ = (P(F_1^c F_2^c F_3^c | E) P(E)) /P(F_1^c F_2^c F_3^c)\ = 0.6(1-0.15-0.20-0.25)/(0.6(1-0.15-0.20-0.25)+0.4(1-0.05-0.10-0.10))=4/9$

  + $P(E | F_4)\ = P(F_4 | E)P(E) / P(F_4)\ = 0.15*0.6/(0.6*0.15 + 0.4 * 0.10) = 0.6$
  + $P(E | (union.big_(i=1)^5 F_i))\ = (P(E) P(E(union.big_(i=1)^5 F_i)))/P(union.big_(i=1)^5 F_i)\ =(0.6 * (1-0.85))/(0.09+0.16)=0.36$
]

#通用作业.hw_prob("problem 6")[Independent trials that result in a success with probability $p$ and a failure with probability
$1-p$ are called Bernoulli trials. Let $P_n$ denote the probability that n Bernoulli trials result in an even number of successes ( $0$ being considered an even number). Show that
$ P_n = p (1 - P_(n-1)) + (1 - p)P_(n-1) (n ≥ 1) $
and use this formula to prove (by induction) that$ P_n = (1+(1-2p)^n)/2 $][
  + The reason is as follows:
    - If the trial success,the only way to satisfy the condition is before this trial is an odd number of successes. So the possibility is $p(1-P_(n-1))$
    - If the trial fails,the only way to satisfy the condition is before this trial is an even number of successes. So the possibility is $(1-p)P_(n-1)$
    So,$ P_n = p (1 - P_(n-1)) + (1 - p)P_(n-1) (n ≥ 1) $
  + We use mathematical induction to prove that $ P_n = (1+(1-2p)^n)/2 $.
    - Basis Step: When $n = 0$, $P_0 = 1 = (1 + (1 - 2p)^0) / 2$

    - Inductive Step: Assume that $P_k = (1 + (1 - 2p)^k) / 2$ for some integer $k >= 0$. We need to show that $P_(k+1) = (1 + (1 - 2p)^(k+1)) / 2$. By the recurrence relation, we have$ P_(k+1) = p(1-P_k) + (1-p) P_k\ =p(1-(1+(1-2p)^k)/2)+(1-p)(1+(1-2p)^k)/2\ =(1+(1-2p)^(k+1))/2 $
    Therefore, by the principle of mathematical induction, $P_n = (1 + (1 - 2p)^n) / 2$ for all integers $n >= 0$.#QED
]