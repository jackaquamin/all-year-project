var_age = data$Age

# mean of age
mean_age = mean(var_age)
print(mean_age)

# median of age
median_age = median(var_age)
print(median_age)

# mode (not in r)
# frequency table
mode = (-sort(-table(var_age))[1])
print(mode)

# quantile
quantile_age = quantile(var_age)
print(quantile_age)

# variance
variance_age = var(var_age)
print(var_age)

# std
std_age = sqrt(variance_age)
print(std_age)


