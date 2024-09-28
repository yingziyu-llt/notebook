#import "@local/PKU-Typst-Template:0.1.0": 通用作业

#set text(lang: "en",size: 16pt)



#show: 通用作业.config.with(
  course_name: "00331900 — Probability and Mathematical Statistics",
  student_id: 2300012154,
  student_name: "林乐天",
  hw_no: 1,
)

#let QED = sym.square.stroked
#set text(size: 14pt)
#set enum(numbering: "(a)")
#通用作业.hw_prob("Prob 1")[
  
How many different letter arrangements can be made from the letters?
+ Fluke?
+ Propose?
+ Missisippi?
+ Arrange?
  ][
We call result as $k$.
+ $k= 5! = 120$
+ $k=7!/(2!*2!)=1260$
+ $k=11!/(4!*4!*2!*1)=34650$
+ $k=7!/(2!*2!)=1260$
]

#通用作业.hw_prob("Prob 2")[

For years, telephone area codes in the United States and Canada consisted of a sequence
of three digits. The first digit was an integer between 2 and 9, the second digit was
either 0 or 1, and the third digit was any integer from 1 to 9. How many area codes
were possible? How many area codes starting with a 4 were possible?
  ][
+ For prob 1,we have 8 choices for the first digit, 2 choices for the second digit and 9 choices for the third digit. Therefore the total number of area codes is $ 8*2*9=144 $.
+ For prob 2,we have 1 choice for the first digit, 2 choices for the second digit and 9 choices for the third digit. Therefore the total number of area codes is $ 1*2*9=18 $.
]

#通用作业.hw_prob("Prob 3")[
We have 20 thousand dollars that must be invested among 4 possible opportunities.
Each investment must be integral in units of 1 thousand dollars, and there are minimal
investments that need to be made if one is to invest in these opportunities. The
minimal investments are 2,2,3, and 4 thousand dollars. How many different investment
strategies are available if
+ an investment must be made in each opportunity?
+ investments must be made in at least 3 of the 4 opportunities
  ][
    + For prob 1, we must put at least 2,2,3,4 in each opportunity, so there are $20-2-2-3-4=9$ thousand dollars left. So the number is $ vec(9+4-1,4-1)=vec(12,3)=220 $ 
    +  For prob 2,we need to divided it into several cases.
       - We invest all of them, the situation is the same as prob 1, so there are 220 different investment strategies.
       - We invest first 3 of them,and then we need to put at least 2,2,3 in them, so the number is $ vec(20-2-2-3+3-1,3-1)=vec(15,2)=105 $
       - We invest the 1st,2nd,4th opportunity,and then we need to put at least 2,2,4 in them, so the number is$ vec(20-2-2-4+3-1,3-1)=vec(14,2)=91 $ 
       - We invest the 1st,3rd,4th or 2nd,3rd,4th opportunity,and then we need to put at least 2,3,4 in them, so the number is $ vec(20-2-3-4+3-1,3-1)=vec(13,2)=78 $ $78*2=156$ in total.
       - Therefore the total number of investment strategies is $ 220+105+91+312=728 $.
  ]

#通用作业.hw_prob("Prob 4")[
John, Jim, Jay, and Jack have formed a band consisting of 4 instruments. If each of
the boys can play all 4 instruments, how many different arrangements are possible? If John and Jim can play all 4 instruments, but Jay and Jack can each play only
piano and drums?][
  + For prob 1, is obvious that there are $4! = 24$ different arrangements.
  + for prob 2, we ask Jay and Jack to choose their instrument first. There is only $2$ ways to do this. Then we need to arrange the remaining 2 instruments, so there are $2! = 2$ different arrangements. Therefore the total number of arrangements is $ 2*2=4 $.
]

#通用作业.hw_prob("Prob 5")[
  Six people are to sit at a round table; how many seating arrangements are there?

Consider the following cases:

+ If there is a “special seat”, for example, it may matter who ends up in that seat.
+ If this doesn’t matter, we only care about the relative position of each person.
+ Then it may or may not matter whether a certain person is on the left or right of another.
][
+ For prob (a), it's easily to say that the problem is similar to arrange seats on a line. So there are $ 6! = 720 $ different arrangements.
+ For prob (b), we can first so the same thing as prob (a). Then, we know that the first person can seat anywhere,so we count the same thing for 6 times. Therefore the answer is $ 6!/6=120 $
+ For prob (c), we can first so the same thing as prob (b). Then, we know that the strategy and its reversed one are actually the same. So we count the same thing for 2 times. Therefore the answer is $ 120/2=60 $
]
