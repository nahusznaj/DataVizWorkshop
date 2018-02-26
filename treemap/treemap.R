library(ggplot2) 
library(treemapify)
proglangs <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/proglanguages.csv")

# plot
treeMapCoordinates <- treemapify(proglangs,
                                 area = "value",
                                 fill = "parent",
                                 label = "id",
                                 group = "parent")

treeMapPlot <- ggplotify(treeMapCoordinates) + 
                  scale_x_continuous(expand = c(0, 0)) +
                  scale_y_continuous(expand = c(0, 0)) +
                  scale_fill_brewer(palette = "Dark2")

print(treeMapPlot)
