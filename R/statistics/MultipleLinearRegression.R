fit = lm(Income~Work_hours+Age+factor(Gender)+factor(Job_type),data=mydata)
summary(fit) 