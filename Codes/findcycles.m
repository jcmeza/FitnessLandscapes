winner = 0;
for i1 in choices do
for i2 in choices do
P := multiply(cat(M,i1),cat(M,i2)):
if (P[1,1] > winner) then winner := P[1,1] : fi:
if ((P[1,1] >= winner) and (P[1,1] >= cutoff)) then
  lprint([i1,i2],[an[i1],an[i2]],P[1,1],evalf(P[1,1]));
fi:
od:od:

print(time());

winner := 0:
for i1 in choices do
for i2 in choices do
for i3 in choices do
P := multiply(cat(M,i1),multiply(cat(M,i2),cat(M,i3))):
if (P[1,1] > winner) then winner := P[1,1] : fi:
if ((P[1,1] >= winner) and (P[1,1] >= cutoff)) then
  lprint([i1,i2,i3],[an[i1],an[i2],an[i3]],P[1,1],evalf(P[1,1]));
fi:
od:od:od:

print(time());

winner := 0:
for i1 in choices do
for i2 in choices do
for i3 in choices do
for i4 in choices do
P := multiply(cat(M,i1),multiply(cat(M,i2),multiply(cat(M,i3),cat(M,i4)))):
if (P[1,1] > winner) then winner := P[1,1] : fi:
if ((P[1,1] >= winner) and (P[1,1] >= cutoff)) then
  lprint([i1,i2,i3,i4],[an[i1],an[i2],an[i3],an[i4]],P[1,1],evalf(P[1,1]));
fi:
od:od:od:od:

print(time());

winner := 0:
for i1 in choices do
for i2 in choices do
for i3 in choices do
for i4 in choices do
for i5 in choices do
P := multiply(cat(M,i1),multiply(cat(M,i2),
multiply(cat(M,i3),multiply(cat(M,i4),cat(M,i5))))):
if (P[1,1] > winner) then winner := P[1,1] : fi:
if ((P[1,1] >= winner) and (P[1,1] >= cutoff)) then
  lprint([i1,i2,i3,i4,i5],[an[i1],an[i2],an[i3],an[i4],an[i5]],P[1,1],evalf(P[1,1]));
fi:
od:od:od:od:od:

print(time());


winner := 0:
for i1 in choices do
for i2 in choices do
for i3 in choices do
for i4 in choices do
for i5 in choices do
for i6 in choices do
P := multiply(cat(M,i1),multiply(cat(M,i2),multiply(cat(M,i3),
multiply(cat(M,i4),multiply(cat(M,i5),cat(M,i6)))))):
if (P[1,1] > winner) then winner := P[1,1] : fi:
if ((P[1,1] >= winner) and (P[1,1] >= cutoff)) then
  lprint([i1,i2,i3,i4,i5,i6],[an[i1],an[i2],an[i3],an[i4],an[i5],an[i6]],P[1,1],evalf(P[1,1]));
fi:
od:od:od:od:od:od: