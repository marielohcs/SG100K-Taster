library(bcjupyterimport)
library(ggplot2)
library(naniar) #Load library to plot missingness in dataset

#Fetch data from BC server and read them into a table
res = fetchData ("select * from ds101103")
bcos_data <- read.table(res$RESULT, sep="\t", header = TRUE)


#Plot missing data for specific column
vis_miss(bcos_data[,1:20])
