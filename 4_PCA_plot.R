library(bcjupyterimport)
library(ggplot2)
library(ggpubr)
library(grid)

#res = fetchData ("select * from ds101047")
#eigenval2 <- read.table(res$RESULT, sep="\t", header = TRUE)

#screeplot <- 
#  eigenval2 %>%
#  mutate(PC = fct_relevel(PC, "PC1", "PC2", "PC3", "PC4", "PC5", "PC6", "PC7", "PC8", "PC9", "PC10")) %>%
#  ggplot(aes(x=PC, y=EIGENVAL)) +
#  geom_bar(stat="identity")+
#  theme(aspect.ratio = 1/2, axis.text.x = element_text(angle=90, vjust=0.6), plot.margin = unit(c(1,1,1,1),"mm"), legend.position = "right") +
#  labs(title="Scree plot", x = "PC", y = "Eigenvalue")

res2 = fetchData ("select * from ds101049")
project.pca2 <- read.table(res2$RESULT, sep="\t", header = TRUE)

ggplot(project.pca2, aes( x =PC1, y = PC2, color = FREG5_RACE2_LABEL)) + 
  geom_point(size = 1) +
  theme(aspect.ratio = 1/2, axis.text.x = element_text(angle=90, vjust=0.6), plot.margin = unit(c(1,1,1,1),"mm"), legend.position = "right") +
  labs(title="PCA plot", x = "PC1", y = "PC2") + 
  guides(color=guide_legend("Ethnicity"))

ggplot(project.pca2, aes( x =PC1, y = PC3, color = FREG5_RACE2_LABEL)) + 
  geom_point(size = 1) +
  theme(aspect.ratio = 1/2, axis.text.x = element_text(angle=90, vjust=0.6), plot.margin = unit(c(1,1,1,1),"mm"), legend.position = "right") +
   labs(title="PCA plot", x = "PC1", y = "PC3") +
  guides(color=guide_legend("Ethnicity"))
