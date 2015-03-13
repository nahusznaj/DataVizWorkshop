
## Tonga Trench Earthquakes
## see demonstration code on help file for "xyplot"
Depth <- equal.count(quakes$depth, number=8, overlap=.1)

xyplot(lat ~ long | Depth, data = quakes)

## Save this plot as an object called "Plot"

Plot <- xyplot(lat ~ long | Depth, data = quakes)


## What type of object is "Plot"

class(Plot)
################################################
