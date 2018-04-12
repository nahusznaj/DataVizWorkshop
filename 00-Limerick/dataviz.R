##################################################################
# Part 1 - A: load R packages

install.packages("ggplot2")

# PhD Thesis by Hadley Wickham under Prof. Dianne Cook and Prof. Heike Hofffman 
# Iowa State University 

###################################################################
# Part 1 - B
# Install Other packages

install.packages("ggfortify")
install.packages("GGally")
install.packages("WVplot")   # WinVector Plot

###################################################################
## 2. Load the R packages

library(GGally)
library(ggplot2)
library(WVplots)

###################################################################

## 3. ggplot2 scatterplot

   # Basic Syntax

ggplot(data=mtcars, aes(x = mpg, y = wt)) + geom_point()

   # ---------------------------------------------------- # 

   # Layers

p1 <- ggplot(data=mtcars, aes(x = mpg, y = wt)) 
p1

p2 <- p1 + geom_point()
p2

p3 <- p1 + stat_smooth()
p3

# ---------------------------------------------------- # 

# Enhancements
p3 + coord_flip()
p3 + ggtitle("my lovely scatter plot")

#--------------------------------------------------------#

# Relationship between variables
#  - vs : Categorical
#  - mpg : numeric
#  - factor : converts numeric to categorical

p1 <- ggplot(data=mtcars, aes(x = factor(vs) , y = mpg)) 
p1 + geom_boxplot()

#--------------------------------------------------------#

# see what this does
p1 + geom_boxplot() + coord_flip()


#--------------------------------------------------------#

## 3. ggplot2 histogram and density plot

p1 <- ggplot(data=mtcars, aes(x = mpg))

p1 + geom_histogram(binwidth=3)

p1 + geom_density(col="red")



###################################################################
# WVplots
# Win-Vector Consulting LLC
# Nina Zumel and John Mount


### Exploratory Data Analysis with ggpairs

# - from GGally R package


###################################################################
# GGally

### ggcoef

# - visual representation for regression coefficient estimates for linear models.

###################################################################
# WVplots
# Win-Vector Consulting LLC
# Nina Zumel and John Mount

### ROC Cuves

### Gain Curves

### Shaded Density Plot

# Plots created by WVplots are "ggplot" objects
# Therefore you can use the regular ggplot syntax with them.

###################################################################
# ggfortify


###################################################################
# ggmap

# Maps of Limerick
# Adding Points




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
