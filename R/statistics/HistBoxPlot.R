# import data
data(mtcars)

par(mfrow=c(1,2))

# histogram
hist(mtcars$mpg,
     breaks=seq(min(mtcars$mpg),max(mtcars$mpg),length.out=6),
     main="Histogram of Miles per gallion",
     xlab="MPG",
     ylab="Numbers")

hist(mtcars$wt,
     breaks=seq(min(mtcars$wt),max(mtcars$wt),length.out=6),
     main="Histogram of Miles per Weight",
     xlab="Weight",
     ylab="Numbers")

# boxplot
boxplot(mtcars$wt)

# two variables
boxplot(wt~cyl,data=mtcars,
        main="Boxplot of Weights based on Cylinder",
        xlab="Cylinder",
        ylab="Weight")
