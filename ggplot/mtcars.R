## Load Up Azure Notebooks

#--------------------------------------------------------#
## 1. Install some R packages

install.packages("car")

    # - See SULIS folder

#--------------------------------------------------------#
## 2. Load the R packages

library(MASS)
library(ggplot2)
library(car)

#--------------------------------------------------------#

## 3. ggplot2 scatterplot

ggplot(data=mtcars, aes(x = mpg, y = wt)) + geom_point()

   # - make a sketch of this plot

p1 <- ggplot(data=mtcars, aes(x = mpg, y = wt)) 
p1

p2 <- p1 + geom_point()
p2

p3 <- p1 + stat_smooth()
p3

   # - make a sketch of this plot

# try out the following
p3 + coord_flip()
p3 + ggtitle("my lovely scatter plot")

#--------------------------------------------------------#
p1 <- ggplot(data=mtcars, aes(x = factor(vs) , y = mpg)) 
p1 + geom_boxplot()

# - make a sketch of this plot

# see what this does
p1 + geom_boxplot() + coord_flip()

# Replace "vs" with "cyl" (keep the factor() statement)
# - make a sketch of this plot

#--------------------------------------------------------#

## 3. ggplot2 histogram and density plot

p1 <- ggplot(data=mtcars, aes(x = mpg))

p1 + geom_histogram(binwidth=3)
# - make a sketch of this plot

p1 + geom_density(col="red")
# - make a sketch of this plot

#--------------------------------------------------------#

## 4. Fit the model

# Model diagnostics for linear models ( "lm" ) 

model <- lm(mpg ~ cyl + wt + drat, data = mtcars)

# - create the following plots cell by cell in the notebook

plot(model, which=c(1))

plot(model, which=c(2))

plot(model, which=c(3))

plot(model, which=c(4)) # Sketch this plot

plot(model, which=c(5))

plot(model, which=c(6))

#--------------------------------------------------------#

# Testing Linear Model Assumptions

# Durbin Watson Test for Autocorrelation

durbinWatsonTest(model)

# Non Constant Variance Test
ncvTest(model)

# Outlier Test
outlierTest(model)
