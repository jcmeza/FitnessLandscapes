
#1) Does the addition of a single mutation change the growth rate of a strain?
#Look at the differences between single Mutations (Below)
#2) Do mutations increase or decrease the growth rate?
#
#3) Do mutations increase or decrease growth rates more often?

##looking for the variance between the mutants that have one difference

#Response variable = growth rate
#Explanatory Variable = Mutants (categorical variables)

#plot data, then boxplots; then compare the first four mutants

#First Antibiotic CAZ
CAZ<-read.csv("/Users/meza/MyProjects/FitnessLandscapes/CAZtrialnew.csv")
attach(CAZ)

#First four mutant comparisons
boxplot(CAZ,xlab="Mutants",ylab="Absorbance?",main="Boxplot of all Mutants with CAZ",col=5)

model1<-lm(TEM.1~M69L)
anova(model1)
plot(TEM.1~M69L)

model2<-lm(TEM.1~E104K)
anova(model2)
plot(TEM.1~E104K)

model3<-lm(TEM.1~G238S)
anova(model3)
plot(TEM.1~G238S)

model4<-lm(TEM.1~N276D)
anova(model4)
plot(TEM.1~N276D)