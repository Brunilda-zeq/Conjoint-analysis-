library(conjoint)
library(factoextra)
setwd("C:/Users/Bru/Desktop/metaptuxiako/2o/vasilopoulos")
car<- expand.grid(price=c('1,000-4,000','5,000-10,000','11,000-20,000','20,000+'),
                   cubic_capacity=c('800-1,200','1,250-1,600','1,650-2,000','2,000'),
                   mileage=c('0-50,000','50,000-10,0000','100,000-200,000','200,000'),
                   used=c('yes','no'),
                   crashed=c('yes','no'))
head(car)


North<-caFactorialDesign(data=car, type="orthogonal", 
                         seed=200)
North
write.csv(North,"full factorial.csv")
nrow(North)

Efficient<-caFactorialDesign(data=car, type="fractional", 
                             seed=200,cards=12)
Efficient
write.csv(North,"EF factorial.csv")


nrow(Efficient)
data(tea)
str(tprof)
str(tlevn)
str(tprefm)
dim(tprefm)
head(tprefm)
tprof
dim(tprof)
tprefm[1,]
caModel(y=tprefm[1,], x=tprof)
caUtilities(y=tprefm[1,], x=tprof, z=tlevn)
caImportance(y=tpref, x=tprof)
caPartUtilities(y=tprefm[1:10,], x=tprof, z=tlevn)
caPartUtilities
Conjoint(y=tpref, x=tprof, z=tlevn)
ShowAllSimulations(tsimp,tpref,tprof)
totalU <- caTotalUtilities(tpref,tprof)
totalU 
ShowAllSimulations(tsimp,tpref,tprof)
print(segments$size)

fviz_cluster(segments, data = totalU)
segments <- kmeans(totalU, centers = 3,  nstart=25)
print(segments$size)
