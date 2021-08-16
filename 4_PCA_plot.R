library(bcjupyterimport)
library(ggplot2)
library(ggpubr)
library(grid)

#Fetch data from BC server and read them into a table
res2 = fetchData ("select * from ds101183")
project.pca2 <- read.table(res2$RESULT, sep="\t", header = TRUE)

#ggplot(project.pca2, aes( x =PC1, y = PC2, color = FREG5_RACE_LABEL)) + 
#  geom_point(size = 1) +
#  theme(aspect.ratio = 1/2, axis.text.x = element_text(angle=90, vjust=0.6), plot.margin = unit(c(1,1,1,1),"mm"), legend.position = "right") +
#  labs(title="PCA plot", x = "PC1", y = "PC2") + 
#  guides(color=guide_legend("Ethnicity"))

ggplot(project.pca2, aes( x =PC1, y = PC3, color = FREG5_RACE_LABEL)) + 
  geom_point(size = 1) +
  theme(aspect.ratio = 1/2, axis.text.x = element_text(angle=90, vjust=0.6), plot.margin = unit(c(1,1,1,1),"mm"), legend.position = "right") +
  labs(title="PCA plot", x = "PC1", y = "PC3") +
  guides(color=guide_legend("Ethnicity"))
