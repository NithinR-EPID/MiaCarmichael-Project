###############################
# analysis script
#
#this script loads the processed, cleaned data, does a simple analysis
#and saves the results to the results folder

#load needed packages. make sure they are installed.
library(ggplot2)
library(dplyr)
library(broom)
library(readr)
library(ggplot2)
library(dplyr)
library(here)
library(visdat)
library(dplyr)
library(tidyverse)


###Phylum: High-RFI
#What changes occured at the phyla level in high-RFI steers? 

#load data. path is relative to project directory.
phyladata<- readRDS("./data/processed_data/processeddata_phyladata.rds")

#To view the micriobiome at the phyla level overtime an initial plot is created showing the composition of phyla at the beginning of the feedlot period in High RFI/low efficiency steers. Save plot to a file. 
HPplot1<-ggplot(phyladata,aes(x="", y=Beginning, fill=Phyla))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Highphylabeg.png",plot=HPplot1)

#A second plot is created showing the composition of families at the end of the feedlot period in High RFI/low efficiency steers.Save the plot to a file.
HPplot2 <- ggplot(phyladata,aes(x="", y=End, fill=Phyla))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename= "./results/Highphylaend.png",plot=HPplot2)

#The axis labels aren't quite right for both graphs. That should be considered when creating them.


#It is easier to see these plots side by side. To do this, create subsets to divide by period, "Beginning" and "End".
#Create datasets 

Period <- c(rep("Beginning",11),  rep("End",11))

Phyla <- rep(c("Firmicutes", "Bacteroidetes", 
               "Actinobacteria", "TM7", "Proteobacteria", "Euryarchaeota", "Spirochaetes", "Cyanobacteria", 
               "Tenericutes", "Planctomycetes", "Other Phyla"),2) 

Abundance <- c(34.95, 48.73, 7.21, 1.81, 1.48, 1.28, 1.31, 0.39, 0.16, 0.21, 2.46, 55.14, 33.04, 1.29, 2.06, 2.31, 1.39, 0.81, 0.33, 0.46, 0.27, 2.91)

#Combine datasets 
phylacomb <- data.frame(Period, Phyla, Abundance)

#Remove missing data
phylacomb <- drop_na(phylacomb)
dim(phylacomb)

#Graph combined dataset
HPplotcomb <- ggplot(phylacomb, aes(fill=Phyla, y=Abundance, x=Period)) +
  geom_bar(stat = "identity")

#The graph above displays the composition of phyla over the course of the feedlot period in High RFI/low efficiency steers
#Repeat for Family and Genus 

#Save graph
ggsave(filename = "./results/Highphylacomb.png",plot=HPplotcomb)




###Phylum: Low RFI
#What changes occured at the phyla level in low-RFI steers?

#load data. path is relative to project directory.
phyladata2<- readRDS("./data/processed_data/processeddata_phyladata2.rds")

#An initial plot is created showing the composition of phyla at the beginning of the feedlot period in Low RFI/High efficiency steers. Save plot to a file.

LPplot1 <- ggplot(phyladata2,aes(x="", y=Beginning, fill=Phyla))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Lowphylabeg.png",plot=LPplot1)

#A second plot is created showing the composition of families at the end of the feedlot period in Low RFI/High efficiency steers.Save the plot to a file.

LPplot2 <- ggplot(phyladata2,aes(x="", y=End, fill=Phyla))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Lowphylaend.png",plot=LPplot2)

#The axis labels aren't quite right for both graphs. That should be considered when creating them.
#It is easier to see these plots side by side. To do this, create subsets to divide by period, "Beginning" and "End".

#Create datasets 

Period <- c(rep("Beginning",11),  rep("End",11))

Phyla <- rep(c("Firmicutes", "Bacteroidetes", 
               "Actinobacteria", "TM7", "Proteobacteria", "Euryarchaeota", "Spirochaetes", "Cyanobacteria", 
               "Tenericutes", "Planctomycetes", "Other Phyla"),2) 

Abundance <- c(34.95, 48.73, 7.21, 1.81, 1.48, 1.28, 1.31, 0.39, 0.16, 0.21, 2.46, 55.14, 33.04, 1.29, 2.06, 2.31, 1.39, 0.81, 0.33, 0.46, 0.27, 2.91)


#Combine datasets 
phylacomb2 <- data.frame(Period, Phyla, Abundance)

#Remove missing data
phylacomb2 <- drop_na(phylacomb)
dim(phylacomb2)

#Graph combined dataset
LPplotcomb <- ggplot(phylacomb2, aes(fill=Phyla, y=Abundance, x=Period)) +
  geom_bar(stat = "identity")


#The graph above displays the composition of phyla over the course of the feedlot period in Low-RFI/High efficiency steers
#Repeat for Family and Genus 

#Save graph
ggsave(filename = "./results/Lowphylacomb.png",plot=LPplotcomb)




###Family: High-RFI
#What changes occured in the family level over time in High-RFI steers?

#load data. path is relative to project directory.
familydata<- readRDS("./data/processed_data/processeddata_familydata.rds")

#An initial plot is created showing the composition of families at the beginning of the feedlot period in High RFI/low efficiency steers. Save plot to a file. 
HFplot1 <- ggplot(familydata,aes(x="", y=Beginning, fill=Family))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Highfamilybeg.png",plot=HFplot1)

#A second plot is created showing the composition of families at the end of the feedlot period in High RFI/low efficiency steers.Save the plot to a file.
HFplot2 <- ggplot(familydata,aes(x="", y=End, fill=Family))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Highfamilyend.png",plot=HFplot2)

#The axis labels aren't quite right for both graphs. That should be considered when creating them. 

#It is easier to see these plots side by side. To do this, create subsets to divide by period, "Beginning" and "End". 


#Create datasets 

Period <- c(rep("Beginning",18),  rep("End",18))

Family <- rep(c("Ruminococcaceae", "Prevotellaceae", "Order Clostridiales", "Order Bacteroidales", "Lachnospiraceae", "RF16", "Methanobacteriaceae", "F16", "Paraprevotellaceae", "S24-7", "Coriobacteriaceae", "Erysipelotrichaceae", "Bifidobacteriaceae", "Spirochaetaceae", "Streptococcaceae", "Mogibacteriaceae", "Succinivibrionaceae", "Other Families"),2) 

Abundance <- c(25.97712848, 36.91095082, 5.934025064, 5.940942506, 5.189480948, 1.937621255, 1.235079234, 1.049483052, 1.214503215, 0.956874771, 0.860283125, 1.158815891, 1.451193422, 1.135264464, 0.802975589, 0.476774167, 0.255410691, 7.513193298, 40.33978584, 14.30713689, 8.401835665, 7.486088, 7.701011161, 1.357351894, 2.004700597, 2.111417947, 1.348409159, 1.177308762, 1.058027748, 0.733590889, 0.311866263, 0.47494151, 0.461737838, 0.773816017, 0.916878216, 9.034095609)

#Combine datasets 
familycomb <- data.frame(Period, Family, Abundance)

#Graph combined dataset
HFplotcomb <- ggplot(familycomb, aes(fill=Family, y=Abundance, x=Period)) +
  geom_bar(stat = "identity")


#The graph above displays the abundance of families over the course of the feedlot period in High RFI/low efficiency steers

#Save graph
ggsave(filename = "./results/Highfamilycomb.png",plot=HFplotcomb)





###Family: Low-RFI

#load data. path is relative to project directory.
familydata2<- readRDS("./data/processed_data/processeddata_familydata2.rds")

#An initial plot is created showing the composition of families at the beginning of the feedlot period in Low RFI/High efficiency steers. Save plot to a file. 
LFplot1 <- ggplot(familydata2,aes(x="", y=Beginning, fill=Family))+ geom_bar(width = 1, stat = "identity")

#Save graph
 ggsave(filename = "./results/Lowfamilycbeg.png",plot=LFplot1)

#A second plot is created showing the composition of families at the end of the feedlot period in Low RFI/High efficiency steers.Save the plot to a file.
LFplot2 <- ggplot(familydata2,aes(x="", y=End, fill=Family))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Lowfamilyend.png",plot=LFplot2)

#The axis labels aren't quite right for both graphs. That should be considered when creating them. 

#It is easier to see these plots side by side. To do this, create subsets to divide by period, "Beginning" and "End". 

#Create datasets 

Period <- c(rep("Beginning",17),  rep("End",17))

Family <- rep(c("Ruminococcaceae", "Prevotellaceae", "Order Bacteroidales", "Order Clostridiales", "Lachnospiraceae", "Bifidobacteriaceae", "F15", "RF16",  "Paraprevotellaceae", "Methanobacteriaceae", "Spirochaetaceae", "Erysipelotrichaceae", "Coriobacteriaceae", "Succinivibrionaceae", "Order RF32", "S24-7", "Other Families"),2) 

Abundance <- c(20.1494728, 38.02867118, 6.835860087, 5.508270337, 5.904255838, 6.231525756, 1.812183786, 1.50086736, 1.331658729, 1.280539877, 1.254985451, 1.199951243, 0.707032815, 0.587611249, 0.446050088, 0.49438202, 6.726681384, 39.27078212, 20.09301518, 8.471782946, 7.119817496, 5.863717733, 0.317316787, 2.053210621, 1.752576479, 1.496544772, 1.392298259, 0.649711389, 0.529057072, 0.757975929, 0.820005408, 0.932485624, 0.862008182, 7.617694)

#Combine datasets 
familycomb2 <- data.frame(Period, Family, Abundance)

#Graph combined dataset
LFplotcomb <- ggplot(familycomb2, aes(fill=Family, y=Abundance, x=Period)) +
  geom_bar(stat = "identity")

#Save graph
ggsave(filename = "./results/Lowfamilycomb.png",plot=LFplotcomb)

#The graph above displays the abundance of families over the course of the feedlot period in Low RFI/High efficiency steers
#Notice that the abundance and composition of families differs between Low-RFI and High-RFI steers

#Repeat for Genus



###Genus: High-RFI

#load data. path is relative to project directory.
genusdata<- readRDS("./data/processed_data/processeddata_genusdata.rds")

#An initial plot is created showing the composition of two genera at the beginning of the feedlot period in High RFI/low efficiency steers. Save plot to a file. 
HGplot1 <- ggplot(genusdata,aes(x="", y=Beginning, fill=Genus))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Highgenusbeg.png",plot=HGplot1)

#A second plot is created showing the composition of two genera at the end of the feedlot period in High RFI/low efficiency steers.Save the plot to a file.
HGplot2 <- ggplot(genusdata,aes(x="", y=End, fill=Genus))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Highgenusend.png",plot=HGplot2)

#It is easier to see these plots side by side. To do this, create subsets to divide by period, "Beginning" and "End". 
Period <- c(rep("Beginning",2),  rep("End",2))

Genus <- rep(c("Methanobrevibacter",
               "Methanosphaera"),2) 

Abundance <- c(1.2, 0.01, 2.0, 0.03)

#Combine datasets 
genuscomb <- data.frame(Period, Genus, Abundance)

#Graph combined dataset
HGplotcomb <- ggplot(genuscomb, aes(fill=Genus, y=Abundance, x=Period)) +
  geom_bar(stat = "identity")

#Save graph
ggsave(filename = "./results/Highgenuscomb.png",plot=HGplotcomb)




###Genus: Low-RFI

#load data. path is relative to project directory.
genusdata2<- readRDS("./data/processed_data/processeddata_genusdata2.rds")

#An initial plot is created showing the composition of two genera at the beginning of the feedlot period in Low RFI/High efficiency steers. Save plot to a file.
LGplot1 <- ggplot(genusdata2,aes(x="", y=Beginning, fill=Genus))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Lowgenusbeg.png",plot=LGplot1)

#A second plot is created showing the composition of two genera at the end of the feedlot period in Low RFI/High efficiency steers.Save the plot to a file.
LGplot2 <- ggplot(genusdata2,aes(x="", y=End, fill=Genus))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = "./results/Lowgenusbend.png",plot=LGplot2)


#It is easier to see these plots side by side. To do this, create subsets to divide by period, "Beginning" and "End".
Period <- c(rep("Beginning",2),  rep("End",2))

Genus <- rep(c("Methanobrevibacter",
               "Methanosphaera"),2) 

Abundance <- c(1.3, 0.02, 1.4, 0.02)

#Combine datasets 
genuscomb2 <- data.frame(Period, Genus, Abundance)

#Graph combined dataset
LGplotcomb <- ggplot(genuscomb2, aes(fill=Genus, y=Abundance, x=Period)) +
  geom_bar(stat = "identity")

#Save graph
ggsave(filename = "./results/Lowgenuscomb.png",plot=LGplotcomb)






  
 





  