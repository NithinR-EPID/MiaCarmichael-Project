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

saveRDS(phyladata, file = "./data/processed_data/processeddata_phyladata.rds")
saveRDS(phyladata2, file = "./data/processed_data/processeddata_phyladata2.rds")
saveRDS(familydata, file = "./data/processed_data/processeddata_familydata.rds")
saveRDS(familydata2, file = "./data/processed_data/processeddata_familydata2.rds")
saveRDS(genusdata, file = "./data/processed_data/processeddata_genusdata.rds")
saveRDS(genusdata2, file = "./data/processed_data/processeddata_genusdata2.rds")
