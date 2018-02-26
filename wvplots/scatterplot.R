set.seed(34903490)
x = rnorm(50)
y = 0.5*x^2 + 2*x + rnorm(length(x))
frm = data.frame(x=x,y=y,yC=y>=as.numeric(quantile(y,probs=0.8)))
frm$absY <- abs(frm$y)
frm$posY = frm$y > 0
Scatterplots
Scatterplot with smoothing line through points. Reports the square of the correlation between x and y (R-squared) and its significance.

WVPlots::ScatterHist(frm, "x", "y", title="Example Fit")
## `geom_smooth()` using method = 'loess'
## `geom_smooth()` using method = 'loess'
