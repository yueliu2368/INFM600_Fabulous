#Rscript for Research Question #2: what are the peak hours on bike trips in a day

#read the file naming "INFM600_0201_Fabulous_RidershipPerHour.csv"
#the dataset genereate by aggregating data per hour
q = read.csv(file.choose())

#show the basic structure of the dataset
head(q)

#basic desscriptive statistics, like mean and SD
mean(q$Ridership)
sd(q$Ridership)

#do a basic plot for the trends of picking up bikes in time of aday
plot(q$Hour,q$Ridership,main="the trends of picking up bike in a day", xlab="The time of a day",ylab="Ridership",type="s")

#read the file naming "INFM600_0201_Fabulous_RidershipPerDatePerHour.csv"
#the dataset generated by aggreagating data per date per hour
p = read.csv(file.choose())
attach(p)

#show the basic structure of the dataset
head(p)

#convert the numeric variables to factor/levels
p$Category_ID = factor(p$Category_ID)

#loading the car package
library(car)
#test the homogeneity of variance
leveneTest(p$Ridership~p$Category_ID,p)
#However, after testing the assumption of homogeneity of variance, we found that our dataset violates this assumption

#perform ANOVA
panova=aov(p$Ridership~p$Category_ID,data=p)
summary(panova)

#perform pairwise t-test
pairwise.t.test(p$Ridership,p$Category_ID,p.adj="bonferroni")
