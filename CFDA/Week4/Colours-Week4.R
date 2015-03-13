# http://research.stowers-institute.org/efg/Report/UsingColorInR.pdf
# Earl F. Glynn

# Stowers Institute for Medical Research


colors() #colours()

colors()[grep("red", colors())]

########################################################################

# Color Basics: Palette

palette(rainbow(10)) # Redefine palette
palette()

palette(gray(0:8 / 8))

palette()

palette("default")
palette()


########################################################################

# In R Colour can be represented by
# - index into palette 
# - color name
# - hex constant (24-bit "True Color":2563 colors = 16,777,216 colors)

########################################################################

# Color Basics: Points
n <- 20
plot(1:n, pch=CIRCLE<-16, cex=1:n, col=rainbow(n))


########################################################################


BOTTOM <- 1
LEFT <- 2
TOP <- 3
RIGHT <- 4

par(col.lab="orange", col.main="gray")
plot(0:10,0:10, col=0:10, pch=CIRCLE<-16,
main="Chart Title", axes=FALSE,
xlab="X axis",ylab="Y axis")

# Margin Text
mtext("Bottom", BOTTOM, col="red")
mtext("Left", LEFT, col="green")
mtext("Top", TOP, col="blue")
mtext("Right", RIGHT, col="magenta")
axis(BOTTOM, col="red",
col.axis="red") # 2, ... 10 in red
AXIS_LABEL_HORIZONTAL <- 1
axis(LEFT, col="green", col.axis="green",
at=2*0:5, labels=paste(20*0:5),
las=AXIS_LABEL_HORIZONTAL)
axis(TOP, col="blue", col.axis="blue")
axis(RIGHT, col="magenta", col.axis="magenta") 


########################################################################

# Color Space: RGB Color Model
# Color is additive in the RGB Color Model.
# Coordinate values not always obvious.

#rrggbb R G B

rgb(1,0,0)
# [1] "#FF0000"

rgb(0,1,0)
# [1] "#00FF00"

########################################################################


par(mfrow=c(6,1), mar=c(3,1,0,1))
BOTTOM <- 1
colorstrip <- function(colors, description, 
ShowAxis=FALSE)
{
count <- length(colors)
m <- matrix(1:count, count, 1)
image(m, col=colors, ylab="", axes=FALSE)
if (ShowAxis)
{
axis(BOTTOM)
}
mtext(description, BOTTOM, adj=0.5, line=0.5)
}
COLOR.COUNT <- 256
colorstrip(rainbow(COLOR.COUNT), "rainbow")
colorstrip(heat.colors(COLOR.COUNT), "heat.colors")
colorstrip(terrain.colors(COLOR.COUNT), "terrain.colors")
colorstrip(topo.colors(COLOR.COUNT), "topo.colors")
colorstrip(cm.colors(COLOR.COUNT),
"cm.colors (cyan-magenta)")
colorstrip(gray(0:COLOR.COUNT / COLOR.COUNT),"gray")
