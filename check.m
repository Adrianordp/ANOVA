function flag = check(P)

f1 = P(1,end) == P(1,2);
f2 = P(2,end) == P(2,5);
f3 = P(3,end) == P(3,3);
f4 = P(4,end) == P(4,4);
f5 = P(5,end) == P(5,2);
% f5_= P(5,end) == P(5,3);
f5_= 1;
f6 = P(6,end) == P(6,3);

flag = f1 && f2 && f3 && f4 && f5 && f5_&& f6;