
#First Antibiotic CAZ
CAZ<-read.csv("/Users/portia/Documents/Antibiotic Resistance/CAZ.csv")
attach(CAZ)

boxplot(CAZ,xlab="Mutants",ylab="O.D.",main="Boxplot of all Mutants with CAZ",col=5)

#Pair Plot
pairs(CAZ,main="Comparison of all Mutants")


##TEM.1 Comparisons##
model1<-lm(TEM.1~M69L)
anova(model1)

model2<-lm(TEM.1~E104K)
anova(model2)

model3<-lm(TEM.1~G238S)
anova(model3)

model4<-lm(TEM.1~N276D)
anova(model4)


## M69L Comparisons  ##
model5<-lm(M69L~M69.E104)
anova(model5)

model6<-lm(M69L~G238.M69)
anova(model6)

model7<-lm(M69L~M69.N276)
anova(model7)


##E104K Comparisons ##
model8<-lm(E104K~M69.E104)
anova(model8)

model9<-lm(E104K~G238.E104)
anova(model9)

model10<-lm(E104K~N276.E104)
anova(model10)


##G238S Comparisons ##
model11<-lm(G238S~G238.M69)
anova(model11)

model12<-lm(G238S~G238.E104)
anova(model12)

model13<-lm(G238S~G238.N276)
anova(model13)


##N276D Comparisons##
model14<-lm(N276D~M69.N276)
anova(model14)

model15<-lm(N276D~N276.E104)
anova(model15)

model16<-lm(N276D~G238.N276)
anova(model16)


### M69/E104 Comparisons ##

model17<-lm(M69.E104~M.E.G)
anova(model17)

model18<-lm(M69.E104~M.E.N)
anova(model18)


## G238/M69 Comparisons ##
model19<-lm(G238.M69~M.E.G)
anova(model19)

model20<-lm(G238.M69~G.N.M)
anova(model20)


## M69/N276 Comparisons ##
model21<-lm(M69.N276~M.E.N)
anova(model21)

model22<-lm(M69.N276~G.N.M)
anova(model22)



## G238/E104 Comparisons #
model23<-lm(G238.E104~M.E.G)
anova(model23)

model24<-lm(G238.E104~G.N.E)
anova(model24)



## N276/E104 Comparisons ##
model25<-lm(N276.E104~M.E.N)
anova(model25)

model26<-lm(N276.E104~G.N.E)
anova(model26)



## G238/N276 Comparisons ##
model27<-lm(G238.N276~G.N.E)
anova(model27)

model28<-lm(G238.N276~G.N.M)
anova(model28)



### TEM-50 Comparisons ###
model29<-lm(TEM.50~M.E.G)
anova(model29)

model30<-lm(TEM.50~M.E.N)
anova(model30)

model31<-lm(TEM.50~G.N.E)
anova(model31)

model32<-lm(TEM.50~G.N.M)
anova(model32)



##This doesn't seem to be showing anything yet but I feel I can work something out with it
plot(M69L~TEM.1,main="First Four Mutants with TEM.1", col=10)
lines(E104K~TEM.1,col="blue")
lines(G238S~TEM.1,col="green")
lines(N276D~TEM.1,col="black")



