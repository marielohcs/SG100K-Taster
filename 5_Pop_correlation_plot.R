library(bcjupyterimport)
library(ggplot2)
library(ggpubr)
library(grid)

#Fetch data from BC server and read them into a table

res2 = fetchData ("select * from ds101093")
EAS_chr22_CHS_chr22 <- read.table(res2$RESULT, sep="\t", header = TRUE)

a <- sample(1:nrow(EAS_chr22_CHS_chr22),100000, replace=F)

ggplot(EAS_chr22_CHS_chr22[a,], mapping = aes(x = EAS_chr22_CHS_chr22[a,5], y = EAS_chr22_CHS_chr22[a,6])) + 
  geom_point(size=0.1) +
  labs(x = "MAF_1KG_EAS_chr22", y = "MAF_SG10K_CHS_chr22", title = "MAF_1KG_EAS_chr22 vs MAR_SG10K_CHS_chr22") +
  geom_abline(intercept = 0, slope = 1, linetype="dotted") + 
  theme(axis.text = element_text(size = rel(2)), 
        axis.title = element_text(size = rel(2)),
        legend.title = element_text(size = rel(1)), 
        legend.text = element_text(size = rel(1)),
        legend.key.size = unit(1,"line"))


#Plot correlation plot for variants associated with lipids
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
