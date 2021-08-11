library(bcjupyterimport)
library(ggplot2)
library(ggpubr)
library(grid)

res = fetchData ("select * from ds101077")
bcos_data <- read.table(res$RESULT, sep="\t", header = TRUE)
attach(bcos_data)

bcos_data = as.data.frame(bcos_data)

ggplot(bcos_data, mapping = aes(x = MAF_EUR , y = MAF_SG)) + 
  geom_point() +
  labs(x = "MAF_EUR", y = "MAF_SG", title = "MAF_EUR vs MAR_SG") +
  geom_abline(intercept = 0, slope = 1, linetype="dotted") + 
  theme(axis.text = element_text(size = rel(2)), 
        axis.title = element_text(size = rel(2)),
        legend.title = element_text(size = rel(1)), 
        legend.text = element_text(size = rel(1)),
        legend.key.size = unit(1,"line"))
