library(bcjupyterimport)
library(ggplot2)
library(ggpubr)
library(grid)

res = fetchData ("select * from ds101075")
bcos_data <- read.table(res$RESULT, sep="\t", header = TRUE)

# Defining extra variable as string, ext_var1="":
#ext_var1=""

# Defining extra variable as string, ext_var2="":
#ext_var2=""

### Automatically created script part ends here

### User script starts here ###
bcos_data = as.data.frame(bcos_data)
attach(bcos_data)

correlation_height <- cor.test(bcos_data$DBI13_HEIGHT, bcos_data$DSM8_FEV1_1, method = c("pearson"))$estimate
correlation_weight <- cor.test(bcos_data$DBI14_WEIGHT, bcos_data$DSM8_FEV1_1, method = c("pearson"))$estimate

FVC_1_male <- bcos_data[bcos_data$FREG7_GENDER2_LABEL == "Male",]
FVC_1_female <- bcos_data[bcos_data$FREG7_GENDER2_LABEL == "Female",]

t.test(DSM8_FEV1_1 ~ FREG7_GENDER2_LABEL)
ttest_gender <- t.test(DSM8_FEV1_1 ~ FREG7_GENDER2_LABEL)

correlation_age <- cor.test(bcos_data$FREG8_AGE2, bcos_data$DSM8_FEV1_1, method = c("pearson"))$estimate

#Visualize the Regression Graphically
#png(file = "res_lm.txt")
# Plot the chart
A <- ggplot(bcos_data, mapping = aes(x = DBI13_HEIGHT , y = DSM8_FEV1_1)) + 
  geom_point() +
  labs(x = "DBI13_HEIGHT", y = "DSM8_FEV1_1", title = "DBI13_HEIGHT & DSM8_FEV1_1") +
  geom_smooth(method='lm', formula= y~x, color = "black") + 
  annotate("text", x = 145, y = 5, label = paste("R=",(round(correlation_height,3))))

B <- ggplot(bcos_data, mapping = aes(x = DBI14_WEIGHT , y = DSM8_FEV1_1)) + 
  geom_point() +
  labs(x = "DBI14_WEIGHT", y = "DSM8_FEV1_1", title = "DBI14_WEIGHT & DSM8_FEV1_1") +
  geom_smooth(method='lm', formula = y~x, color = "black") + 
  annotate("text", x =45, y = 5, label = paste("R=",(round(correlation_weight,3))))

C <- ggplot(bcos_data, mapping = aes(x = FREG8_AGE2 , y = DSM8_FEV1_1)) + 
  geom_point() +
  labs(x = "FREG8_AGE", y = "DSM8_FEV1_1", title = "FREG8_AGE & DSM8_FEV1_1") +
  geom_smooth(method='lm', formula = y~x, color = "black") + 
  annotate("text", x =70, y = 5, label = paste("R=",(round(correlation_age,3))))

D <- ggplot(bcos_data, mapping = aes(x = as.factor(FREG7_GENDER2_LABEL) , y = DSM8_FEV1_1)) + 
  geom_boxplot() +
  labs(x = "FREG7_GENDER", y = "DSM8_FEV1_1", title = "FREG7_GENDER & DSM8_FEV1_1") +
  annotate("text", x = 1.5, y = 5, label = paste("P value =",(pvalue_gender)))


ggarrange(A, B, C, D, ncol = 2, nrow = 2)
# Save the file.
#dev.off()
