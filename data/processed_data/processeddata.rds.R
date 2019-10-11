###############################
# processing script
#
#this script loads the raw data, processes and cleans it 
#and saves it as Rds file in the processed_data folder

#load needed packages. make sure they are installed.
library(readxl)
library(ggplot2)
library(dplyr)

#Load data, path is relative to project directory. Select a file and read the data into a data frame.

setwd("~/Desktop/epid8060fall2019/MiaCarmichael-Project")
library(readxl)
rawdata <- read_excel("code/Abundant_Phyla_MADA.xlsx")


                                         
#take a look at the data
head(rawdata)
dplyr::glimpse(rawdata)

#Rename the columes, so when creating a graph things can be plotted easier
names(rawdata)[1:4]<-c("Phyla", "Beginning", "End", "P")

#Check name of columns to see what data looks like.
names(rawdata)

#An initial plot is created showing the composition of phyla at the beginning of the feedlot period in High RFI/low efficiency steers. Save plot to a file. 
ggplot(rawdata,aes(x="", y=Beginning, fill=Phyla))+ geom_bar(width = 1, stat = "identity")



#A second plot is created showing the composition of phyla at the end of the feedlot period in High RFI/low efficiency steers.Save the plot to a file.
ggplot(rawdata,aes(x="", y=End, fill=Phyla))+ geom_bar(width = 1, stat = "identity")






