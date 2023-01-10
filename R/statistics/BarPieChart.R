# Load built-in dataset
data("mtcars")

# Bar chart (1 variable = gear)
gear = mtcars$gear

# frequency table
gearType = table(gear)
gearType

barplot(gearType,main="Distribution of Gear Type",
        xlab="Gear Type",
        ylab="Counts",
        col="red")

# stacked barchart (2 variables, gear, cylinder)
cylinder = mtcars$cyl

# frequency table 2 variables
cylGear = table(cylinder,gear)
cylGear

# create color vector
colors = c("darkgreen","green","lightgreen")

barplot(cylGear,col=colors,
        main="Distribution of Gear Type grouped by Culinder",
        xlab="Gear Type",
        ylab="Counts")

# add the legend to the chart
legend("topright",rownames(cylGear),fill=colors)

# pie chart (1 variable)
carbs = mtcars$carb

# frequency table
carbs_type = table(carbs)
carbs_type

# percent
percent = round((carbs_type/ sum(carbs_type) * 100),1)
percent

# change percent into label
pielabels = paste(percent,"%")
pielabels

# pie chart
pie(carbs_type,labels=pielabels,
    main="% of Carburetors",
    cex=0.8)
