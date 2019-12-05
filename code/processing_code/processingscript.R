###############################
# processing script
#
#this script loads the raw data, processes and cleans it 
#and saves it as Rds file in the processed_data folder

#Load needed packages. make sure they are installed.


library(readxl)
library(readr)
library(ggplot2)
library(dplyr)
library(here)
library(visdat)
library(dplyr)
library(tidyverse)


###Alpha Diversity: High

#Load data, path is relative to project directory. Select a file and read the data into a data frame.
alpha_diversity_hi <- read.csv(here("data", "raw_data", "Alpha_Diversity_high.csv"))

#Take a look at the data
head(alpha_diversity_hi)

#Make a subset of this data frame without P to recalculate that value in our own analysis
alpha_diversity_hi =subset(alpha_diversity_hi, select = -c(`P.value`))

#Take a look at the data
head(alpha_diversity_hi)
saveRDS(alpha_diversity_hi, file = here("./data/processed_data/processed_data_alpha_diversity_hi.rds"))

###Alpha Diversity: Low

#Load data, path is relative to project directory. Select a file and read the data into a data frame.
alpha_diversity_low <- read.csv(here("data", "raw_data", "Alpha_Diversity_Low.csv"))

#Take a look at the data
head(alpha_diversity_low)

#Make a subset of this data frame without P to recalculate that value in our own analysis
alpha_diversity_low =subset(alpha_diversity_low, select = -c(`P.value`))

#Take a look at the data
head(alpha_diversity_low)

saveRDS(alpha_diversity_low, file = here("./data/processed_data/processed_data_alpha_diversity_low.rds"))


###Alpha Diversity: Animal Performance

#Load data, path is relative to project directory. Select a file and read the data into a data frame.
animalPerformance <- read.csv(here("data", "raw_data", "AnimalPerformance.csv"))

#Take a look at the data
head(animalPerformance)

#Make a subset of this data frame without P to recalculate that value in our own analysis
animalPerformance =subset(animalPerformance, select = -c(`P.value`))

#Take a look at the data
head(animalPerformance)

saveRDS(animalPerformance, file = here("./data/processed_data/processed_data_animal_performance.rds"))


###Phylum:High RFI

#Load data, path is relative to project directory. Select a file and read the data into a data frame.
phyladata <- read_csv(here("data", "raw_data", "Abundant_Phyla_MADA.csv"))


#Take a look at the data
head(phyladata)
dplyr::glimpse(phyladata)

#There are only 11 identified Phylum in this data, but there are currently 13 observations. Remove any observations with NA
phyladata <- drop_na(phyladata)
dim(phyladata)

#Rename the columes, so when creating a graph things can be plotted easier
names(phyladata)[1:4]<-c("Phyla", "Beginning", "End", "P")

#Check name of columns to see what data looks like.
names(phyladata)

#Make a subset of this data frame without P to recalculate that value in our own analysis

phylatest=subset(phyladata, select = -c(P))

#Take a look at the data
head(phylatest)



###Phylum: Low RFI

#Load data, path is relative to project directory. Select a file and read the data into a data frame.
phyladata2 <- read_csv(here("data", "raw_data", "Phyla_Low_MADA.csv"))

#Take a look at the data
head(phyladata2)
dplyr::glimpse(phyladata2)

#There are only 11 identified Phylum in this data, but there are currently 13 observations. Remove any observations with NA
phyladata2 <- drop_na(phyladata2)
dim(phyladata2)

#Rename the columes, so when creating a graph things can be plotted easier
names(phyladata2)[1:4]<-c("Phyla", "Beginning", "End", "P")

#Check name of columns to see what data looks like.
names(phyladata2)

#Make a subset of this data frame without P to recalculate that value in our own analysis

phylatest2 =subset(phyladata2, select = -c(P))

#Take a look at the data
head(phylatest2)


###Family: High RFI

#Load data, path is relative to project directory. Select a file and read the data into a data frame.
familydata <- read_csv(here("data", "raw_data", "Abundant_FamiliesHighRFI_MADA.csv"))

#Take a look at the data
head(familydata)
dplyr::glimpse(familydata)


#There are only 18 identified Phylum in this data, but there are currently  observations. Remove any observations with NA
familydata <- drop_na(familydata)
dim(familydata)

#Rename the columes, so when creating a graph things can be plotted easier
names(familydata)[1:4]<-c("Family", "Beginning", "End", "P")

#Check name of columns to see what data looks like.                                    
names(familydata)

#Make a subset of this data frame without P to recalculate that value in our own analysis

familytest=subset(familydata, select = -c(P))

#Take a look at the data
head(familytest)

###Family: Low RFI

#Load data, path is relative to project directory. Select a file and read the data into a data frame.
familydata2 <- read_csv(here("data", "raw_data", "Family_Low_MADA.csv"))

#Take a look at the data
head(familydata2)
dplyr::glimpse(familydata2)


#There are only 17 identified families in this data, but there are currently  observations. Remove any observations with NA
familydata2 <- drop_na(familydata2)
dim(familydata2)

#Rename the columes, so when creating a graph things can be plotted easier
names(familydata2)[1:4]<-c("Family", "Beginning", "End", "P")

#Check name of columns to see what data looks like. 
names(familydata2)


#Make a subset of this data frame without P to recalculate that value in our own analysis

familytest2=subset(familydata2, select = -c(P))

#Take a look at the data
head(familytest2)



###Genus: High RFI
#For my dataset, there was litte variation over the course of the feedlot amongst genra. Howver there were noticible changes amongst methanogen populations. 

#Load data, path is relative to project directory. Select a file and read the data into a data frame .
genusdata <- read_csv(here("data", "raw_data", "Genera_MADA.csv"))

#Take a look at the data
head(genusdata)
dplyr::glimpse(genusdata)

#Remove any observations with NA
genusdata <- drop_na(genusdata)
dim(genusdata)

#Rename the columes, so when creating a graph things can be plotted easier
names(genusdata)[1:4]<-c("Genus", "Beginning", "End", "P")

#Check name of columns to see what data looks like.
names(genusdata)


#Make a subset of this data frame without P to recalculate that value in our own analysis

genustest=subset(genusdata, select = -c(P))

#Take a look at the data
head(genustest)


###Genus: Low RFI
#For my dataset, there was litte variation over the course of the feedlot amongst genra. Howver there were noticible changes amongst methanogen populations. 

#Load data, path is relative to project directory. Select a file and read the data into a data frame .
genusdata2 <- read_csv(here("data", "raw_data", "Genus_Low_MADA.csv"))

#Take a look at the data
head(genusdata2)
dplyr::glimpse(genusdata2)

#Remove any observations with NA
genusdata2 <- drop_na(genusdata2)
dim(genusdata2)

#Rename the columes, so when creating a graph things can be plotted easier
names(genusdata2)[1:4]<-c("Genus", "Beginning", "End", "P")

#Check name of columns to see what data looks like.
names(genusdata2)

genustest2=subset(genusdata2, select = -c(P))

#Take a look at the data
head(genustest2)


saveRDS(phyladata, file = here("./data/processed_data/processeddata_phyladata.rds"))
saveRDS(phyladata2, file =here("./data/processed_data/processeddata_phyladata2.rds"))
saveRDS(familydata, file = here("./data/processed_data/processeddata_familydata.rds"))
saveRDS(familydata2, file = here("./data/processed_data/processeddata_familydata2.rds"))
saveRDS(genusdata, file = here("./data/processed_data/processeddata_genusdata.rds"))
saveRDS(genusdata2, file = here("./data/processed_data/processeddata_genusdata2.rds"))

saveRDS(phylatest, file = here("./data/processed_data/processeddata_phyladata.rds"))
saveRDS(phylatest2, file =here("./data/processed_data/processeddata_phyladata2.rds"))
saveRDS(familytest, file = here("./data/processed_data/processeddata_familydata.rds"))
saveRDS(familytest2, file = here("./data/processed_data/processeddata_familydata2.rds"))
saveRDS(genustest, file = here("./data/processed_data/processeddata_genusdata.rds"))
saveRDS(genustest2, file = here("./data/processed_data/processeddata_genusdata2.rds"))

