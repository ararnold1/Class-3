# Install the package Affy

if (!requireNamespace("BiocManager", quietly=TRUE))
    install.packages("BiocManager")
BiocManager::install("affy", version = "devel")

#or

source("https://bioconductor.org/biocLite.R")
biocLite("affy")

# Install Spike in Subset 

biocLite("SpikeInSubset")

# To load package:
library(SpikeInSubset)
library(affy)

# load data
data(spikein95)

# check the chips
image(spikein95)

# Collect the gene IDs from this dataset and put it into an object
ids <- geneNames(spikein95)

# HW 2 paragraph on - what is microarray normalization? 3 techniques of normalization (Mas 5.0, RMA)

# perform Mas 5.0 normaliazation
Mas <- mas5(spikein95)

#Box plot for raw data, and boxplot for normalized data on log fold
boxplot(spikein95)
mas_log <- log2(exprs(Mas))
x11 ()
boxplot(Mas)

#Density plot 
density <- density(mas_log[,1])
plot(density, main="Mas normalization")

density2 <- density(mas_log[,2])
plot(density2, col="red")

density3 <- density(mas_log[,3])
plot(density3, col="blue")
