library(bcjupyterimport)
library(ggplot2)
library(naniar) #Load library to plot missingness in dataset

#API fetch data from BCP
res = fetchData ("select * from ds101079")
bcos_data <- read.table(res$RESULT, sep="\t", header = TRUE)

#Plot missing data in whole dataset
vis_miss(bcos_data)

#Plot missing data in specific column
vis_miss(bcos_data[,1:20])

#Count number of column with NA value
#n_var_miss(bcos_data)

#Use UpSetR to plot number of dataset with missing data
#gg_miss_upset(bcos_data)
#gg_miss_upset(bcos_data[,10:ncol(bcos_data)], nsets = n_var_miss(bcos_data)) #nsets determinbce the number of sets (up tp 40)

