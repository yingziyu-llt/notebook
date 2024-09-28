#import "@local/PKU-Typst-Template:0.1.0": 通用作业

#set text(lang: "en",size: 16pt)



#show: 通用作业.config.with(
  course_name: "00331900 — Probability and Mathematical Statistics",
  student_id: 2300012154,
  student_name: "林乐天",
  hw_no: 2,
)

#let QED = sym.square.stroked
#set text(size: 14pt, font: "Times New Roman")
#set enum(numbering: "(a)")
#通用作业.hw_prob("Prob 1")[In an experiment, die is rolled continually until a 6 appears, at which point the experiment stops. What is the sample space of this experiment? Let $E_n$ denote the event
that $n$ rolls are necessary to complete the experiment. What points of the sample space
are contained in $E_n$ ? What is $(union.big_1^infinity E_n)^c$?][
  + Sample space: ${({1,2,3,4,5}^*,6)|* in NN}$,which means that the sample space is the set of all possible outcomes of the experiment, where each outcome is a sequence of rolls that ends with a 6.
  + The points that are contained in $E_n$ are the sequences of rolls that require exactly $n$ rolls to end with a 6. In other words, for all rolls $i$ from 1 to $n-1$, the roll is not a 6, and the $n$-th roll is a 6. In other word,$E_n = {(x_1,x_2,dots,x_(n-1),6|x_i in {1,2,3,4,5})}$
  + $(union.big_1^infinity E_n)^c$ is the set of all sequences of rolls that do not end with a 6. In other words, the points in it contains no 6 and its length is infinite.
]

#通用作业.hw_prob("Prob 2")[Consider the experiment of rolling a pair of 6-sided dice. Assume that the dice are fair,and each outcome has an equal probability of occurring. There are $6 times 6 = 36$ possible
outcomes in the sample space. Calculate the probability of the following events:
+ The sum of the rolls is 7.
+ Both dice show the same number (a double).
+ The first roll is larger than the second.
+ At least one of the rolls is a 6.][
  + Its event space is {(1,6),(2,5),(3,4),(4,3),(5,2),(6,1)}.So its possibility is $6/36=1/6$.
  + Its event space is {(1,1),(2,2),(3,3),(4,4),(5,5),(6,6)}.So its possibility is $6/36=1/6$.
  + Its event space is {(2,1),(3,1),(4,1),(5,1),(6,1),(3,2),(4,2),(5,2),(6,2),(4,3),(5,3),(6,3),(5,4),(6,4),(6,5)}.So its possibility is $15/36=5/12$.
  + Its event space is {(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(5,6),(4,6),(3,6),(2,6),(1,6)}.So its possibility is $11/36$.
]

#通用作业.hw_prob("Prob 3")[Let $S$ be a given set. If, for some $k > 0$, $S_1, S_2, dots , S_k$ are mutually exclusive nonempty subsets of $S$ such that $union.big_i=1^k S_i = S$, then we call the set ${S_1, S_2, dots , S_k}$ a partition of $S$.
Let $T_n$ denote the number of different partitions of ${1, 2, . . . , n}$. Thus, $T_1 = 1$ (the only
partition being $S_1 = {1}$ ) and $T_2 = 2$ (the two partitions being ${{1, 2}}, {{1}, {2}}$).
+ Show, by enumerating all partitions, $T_3 = 5$, $T_4 = 15$.
+ Show $ T_(n+1) = 1 + sum_{i=1}^n vec(n,k) T_i $][
  + The result is shown as follows:
    - $T_3={{{1,2,3}},{{1},{2,3}},{{1,2},{3}},{{1,3},{2}},{{1},{2},{3}}}$
    so $T_3=5$.
    - $T_4={{{1,2,3,4}},{{1,2,3},{4}},{{1,2,4},{3}},{{1,3,4},{2}},$${{2,3,4},{1}},{{1,2},{3,4}},{{1,3},{2,4}},{{1,4},{2,3}},$${{1,4},{2,3}},{{1,3},{2},{4}},{{1,4},{2},{3}},{{1,4},{2},{3}},$${{2,4},{1},{3}},{{3,4},{1},{2}},{{1},{2},{3},{4}}}$
  + When we add the element $n+1$ into the set ${1,2,...,n}$, we select $0,1,2,dots,i,dots,n$ elements in the original set and put them with $n+1$ into a new subset. For each $n-i$, the choice of $n-i$ elements in the original set is $vec(n,n-i) = vec(n,i)$, and the number of partitions of the new subset is $T_i$. So we have $ T_(n+1) = 1 + sum_{i=1}^n vec(n,i) T_i $.
]

#通用作业.hw_prob("Prob 4")[If it is assumed that all $vec(52,5)$ poker hands are equally likely, what is the probability of being dealt
+ a flush? (A hand is said to be a flush if all 5 cards are of the same suit.)
+ one pair? (This occurs when the cards have denominations a, a, b, c, d, where a, b, c, and d are all distinct.)
+ two pairs? (This occurs when the cards have denominations a, a, b, b, c, where a, b, and c are all distinct.)
+ three of a kind? (This occurs when the cards have denominations a, a, a, b, c, where a, b, and c are all distinct.)
+ four of a kind? (This occurs when the cards have denominations a, a, a, a, b.)][
  + The possibility is $ vec(13,5)/vec(52,5) times vec(4,1) = 33/16660 $
  + The possibility is $ (vec(13,4)*vec(4,1)*vec(4,2)*vec(4,1)*vec(4,1)*vec(4,1))/vec(52,5) = 352/833 $
  + The possibility is $ (vec(13,2) * vec(4,2) * vec(4,2) * vec(11,1) *vec(4,1))/vec(52,5) = 198/4165 $
  + The possibility is $ (vec(13,1) * vec(4,3) * vec(12,2) * vec(4,1) * vec(4,1))/vec(52,5) = 88/4165 $
  + The possibility is $ (vec(13,1)* vec(4,4)*vec(12,1)*vec(4,1))/vec(52,5) = 1/4165 $
]

#通用作业.hw_prob("Prob 5")[The game of craps is played as follows: A player rolls two 6-sided dice. If the sum of
the dice is either a 2 ,3 , or 12 , the player loses; if the sum is either a 7 or an 11 ,
the player wins. If the outcome is anything else, the player continues to roll the dice
until she rolls either the initial outcome or a 7 . If the 7 comes first, the player loses,
whereas if the initial outcome reoccurs before the 7 appears, the player wins. Compute
the probability of a player winning at craps.][
First we need to calculate the probability of each outcome. We call the possibility of rolling a $i$ called $P(i)$.Easily, we can know that $P(2)=1/36$,$P(3)=2/36=1/18$,$P(4)=3/36=1/12$,$P(5) = 4/36=1/9$,$P(6) = 5/36$,$P(7)=6/36=1/6$,$P(8)=5/36$,$P(9)=1/9$,$P(10)=1/12$,$P(11)=1/18$,$P(12)=1/36$.

Then we call the possibility of winning at round $i$ as $P_w (i)$,losing at round $i$ as $P_l (i)$.

$ P_l (1) = P(2)+P(3)+P(12) = 1/36+1/18+1/36=1/9 $

$ P_w (1) = P(7)+P(11) = 1/6+1/18=2/9 $

If the first roll is $j (j != 2,3,7,11,12)$,then $ P_l (i)= (1 - P_l (1) - P_w (1))(1-P(j)-P(7))^(i-2)P(7) $

$ P_w (i) = (1 - P_l (1) - P_w (1))(1-P(j)-P(7))^(i-2)P(j) $

We can easily calculate $P_w (i)$ and $P_l (i)$

$ P_w = P_w (1)+ sum^12_(j=1) sum^infinity_(i=2)P_w (i) (j!=2,3,7,11,12) $

$ P_l = P_l (1) + sum^12_(j=1) sum^infinity_(i=2)P_l (i) (j!=2,3,7,11,12) $

]

#通用作业.hw_prob("Prob 6")[Romeo and Juliet have a date at a given time, and each will arrive at the meeting place with a delay between 0 and 1 hour, with all pairs of delays being equally likely. The first to arrive will wait for 15 minutes and will leave if the other has not yet arrived. What is the probability that they will meet?][
  We use a geometric way to solve this problem. 
  #image("fig1.png")
  We think the x-axis and y-axis as the arrival time of Romeo and Juliet. The area of the rectangle is 1.We draw 2 lines $e:y=x+1/4$ and $g_1:y = x - 1/4$, which means the max time Romeo and Juliet can wait.The area of the red space is $1-9/16=7/16$. So the possibility of they will meet is $7/16$.
]
#通用作业.hw_prob("Prob 7")[
  Find the simplest expression for the following events:
+ $(E union F ) (E union F^c)$;
+ $(E union F ) (E^c union F ) (E union F^c)$;
+ $(E union F )(F union G)$.
][
  + $(E union F ) (E union F^c) = E$
  + $(E union F ) (E^c union F ) (E union F^c) = E F$
  + $(E union F )(F union G) = F union (E G)$
]

#通用作业.hw_prob("Prob 8")[
  Use induction to generalize Bonferroni’s inequality to $n$ events. That is, show that
$P (E_1 E_2 · · · E_n) ≥ P (E_1) + · · · + P (E_n) - (n - 1)$][Let us prove Bonferroni’s inequality using mathematical induction.

*Base*:

$P(E_1 E_2) = 1 - P(E_1^c union E_2^c) $

$>= 1 - (1 - P(E_1)) - (1 - P(E_2)) $

$= P(E_1) + P(E_2) - 1$

Which is true.

*Induction*:

Assume that for $n$ events, the inequality holds:

$ P(E_1 E_2 · · · E_n) >= sum_(i = 1)^(n)P(E_i) - (n - 1) $

Now we need to prove that for $n+1$ events, the inequality also holds,

$P(E_1 E_2 · · · E_n E_(n+1))$

$ = P((E_1 E_2 · · · E_n)E_(n+1))$

$ >= P(E_(n+1)) + P(E_1 E_2 ... E_n) - 1$

$ >= sum_(i = 1)^(n+1)P(E_i) - n$

Therefore, the inequality holds for $n+1$ events.

By the principle of mathematical induction, Bonferroni’s inequality holds for any number of events.
    #QED
]
