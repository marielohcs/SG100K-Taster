library(bcjupyterimport)
library(ggplot2)
library(ggpubr)
library(grid)

#Fetch data from BC server and read them into a table
res = fetchData ("select * from ds101184")
bcos_data <- read.table(res$RESULT, sep="\t", header = TRUE)
attach(bcos_data)

bcos_data = as.data.frame(bcos_data)

ggplot(bcos_data, mapping = aes(x = DBI13_HEIGHT , y = DSM7_FVC_1)) + 
  geom_point() +
  labs(x = "DBI13_HEIGHT", y = "DSM7_FVC_1", title = "DBI13_HEIGHT & DSM7_FVC_1") +
  geom_smooth(method='lm', formula= y~x, color = "black")

cor.test(bcos_data$DBI13_HEIGHT, bcos_data$DSM7_FVC_1, method = c("pearson"))
cor.test(bcos_data$DBI14_WEIGHT, bcos_data$DSM7_FVC_1, method = c("pearson"))

correlation_height <- cor.test(bcos_data$DBI13_HEIGHT, bcos_data$DSM7_FVC_1, method = c("pearson"))$estimate
correlation_weight <- cor.test(bcos_data$DBI14_WEIGHT, bcos_data$DSM7_FVC_1, method = c("pearson"))$estimate

t.test(DSM7_FVC_1 ~ FREG7_GENDER_LABEL)
ttest_gender <- t.test(DSM7_FVC_1 ~ FREG7_GENDER_LABEL)

correlation_age <- cor.test(bcos_data$FREG8_AGE, bcos_data$DSM7_FVC_1, method = c("pearson"))$estimate

pvalue_gender <- signif(dt(ttest_gender$statistic,df=(ttest_gender$parameter)),3)

# Plot the correlation plot and boxplot
A <- ggplot(bcos_data, mapping = aes(x = DBI13_HEIGHT , y = DSM7_FVC_1)) + 
  geom_point() +
  labs(x = "DBI13_HEIGHT", y = "DSM7_FVC_1", title = "DBI13_HEIGHT & DSM7_FVC_1") +
  geom_smooth(method='lm', formula= y~x, color = "black") + 
  annotate("text", x = 145, y = 6, label = paste("R=",(round(correlation_height,3))))

B <- ggplot(bcos_data, mapping = aes(x = DBI14_WEIGHT , y = DSM7_FVC_1)) + 
  geom_point() +
  labs(x = "DBI14_WEIGHT", y = "DSM7_FVC_1", title = "DBI14_WEIGHT & DSM7_FVC_1") +
  geom_smooth(method='lm', formula = y~x, color = "black") + 
  annotate("text", x =45, y = 6, label = paste("R=",(round(correlation_weight,3))))

C <- ggplot(bcos_data, mapping = aes(x = FREG8_AGE , y = DSM7_FVC_1)) + 
  geom_point() +
  labs(x = "FREG8_AGE", y = "DSM7_FVC_1", title = "FREG8_AGE & DSM7_FVC_1") +
  geom_smooth(method='lm', formula = y~x, color = "black") + 
  annotate("text", x =70, y = 6, label = paste("R=",(round(correlation_age,3))))

D <- ggplot(bcos_data, mapping = aes(x = as.factor(FREG7_GENDER_LABEL) , y = DSM7_FVC_1)) + 
  geom_boxplot() +
  labs(x = "FREG7_GENDER", y = "DSM7_FVC_1", title = "FREG7_GENDER & DSM7_FVC_1") +
  annotate("text", x = 1.5, y = 5, label = paste("P value =",(pvalue_gender)))

ggarrange(A, B, C, D, ncol = 2, nrow = 2)
