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
library(car)



###Phylum: High-RFI
#What changes occured at the phyla level in high-RFI steers? 

#load data. path is relative to project directory.

phyladata<- readRDS(here("././data/processed_data/processeddata_phyladata.rds"))
phylatest <- readRDS(here("././data/processed_data/processeddata_phyladata.rds"))

#To view the micriobiome at the phyla level overtime an initial plot is created showing the composition of phyla at the beginning of the feedlot period in High RFI/low efficiency steers. Save plot to a file. 
HPplot1<-ggplot(phyladata,aes(x="", y=Beginning, fill=Phyla))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename= here("./results/Highphylabeg.png"),plot=HPplot1)

#A second plot is created showing the composition of families at the end of the feedlot period in High RFI/low efficiency steers.Save the plot to a file.
HPplot2 <- ggplot(phyladata2,aes(x="", y=End, fill=Phyla))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename= here("././results/Highphylaend.png"),plot=HPplot2)

#The axis labels aren't quite right for both graphs. That should be considered when creating them.


#It is easier to see these plots side by side. To do this, create subsets to divide by period, "Beginning" and "End".
#Create datasets 

Period <- c(rep("Beginning",11),  rep("End",11))

Phyla <- rep(c("Firmicutes", "Bacteroidetes", 
               "Actinobacteria", "TM7", "Proteobacteria", "Euryarchaeota", "Spirochaetes", "Cyanobacteria", 
               "Tenericutes", "Planctomycetes", "Other Phyla"),2) 

Abundance <- c(41.34, 47.34, 3.01, 0.97, 1.24, 1.05, 1.40, 0.32, 0.49, 0.35, 2.49, 60.37, 25.98, 1.56, 2.27, 2.01, 2.12, 0.53, 0.89, 0.44, 0.39, 3.43)

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
ggsave(filename = here("././results/Highphylacomb.png"),plot=HPplotcomb)


#Linear Model/ANOVA 
#Transform data into tibble
as_tibble(phylatest)


###Phylum: Low RFI
#What changes occured at the phyla level in low-RFI steers?

#load data. path is relative to project directory.
phyladata2<- readRDS("././data/processed_data/processeddata_phyladata2.rds")
phylatest2 <- readRDS(here("././data/processed_data/processeddata_phyladata2.rds"))

#An initial plot is created showing the composition of phyla at the beginning of the feedlot period in Low RFI/High efficiency steers. Save plot to a file.

LPplot1 <- ggplot(phyladata2,aes(x="", y=Beginning, fill=Phyla))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = here("././results/Lowphylabeg.png"),plot=LPplot1)

#A second plot is created showing the composition of families at the end of the feedlot period in Low RFI/High efficiency steers.Save the plot to a file.

LPplot2 <- ggplot(phyladata2,aes(x="", y=End, fill=Phyla))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = here("././results/Lowphylaend.png"),plot=LPplot2)

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
phylacomb2 <- drop_na(phylacomb2)
dim(phylacomb2)

#Graph combined dataset
LPplotcomb <- ggplot(phylacomb2, aes(fill=Phyla, y=Abundance, x=Period)) +
  geom_bar(stat = "identity")


#The graph above displays the composition of phyla over the course of the feedlot period in Low-RFI/High efficiency steers
#Repeat for Family and Genus 

#Save graph
ggsave(filename = here("././results/Lowphylacomb.png"),plot=LPplotcomb)

#Linear Model/ANOVA prep

#Transform data into tibble
as_tibble(phylatest2)



###Family: High-RFI
#What changes occured in the family level over time in High-RFI steers?

#load data. path is relative to project directory.
familydata<- readRDS("././data/processed_data/processeddata_familydata.rds")

#An initial plot is created showing the composition of families at the beginning of the feedlot period in High RFI/low efficiency steers. Save plot to a file. 
HFplot1 <- ggplot(familydata,aes(x="", y=Beginning, fill=Family))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = here("././results/Highfamilybeg.png"),plot=HFplot1)

#A second plot is created showing the composition of families at the end of the feedlot period in High RFI/low efficiency steers.Save the plot to a file.
HFplot2 <- ggplot(familydata,aes(x="", y=End, fill=Family))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = here("././results/Highfamilyend.png"),plot=HFplot2)

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
ggsave(filename =here("././results/Highfamilycomb.png"),plot=HFplotcomb)





###Family: Low-RFI

#load data. path is relative to project directory.
familydata2<- readRDS("././data/processed_data/processeddata_familydata2.rds")

#An initial plot is created showing the composition of families at the beginning of the feedlot period in Low RFI/High efficiency steers. Save plot to a file. 
LFplot1 <- ggplot(familydata2,aes(x="", y=Beginning, fill=Family))+ geom_bar(width = 1, stat = "identity")

#Save graph
 ggsave(filename =here("././results/Lowfamilycbeg.png"),plot=LFplot1)

#A second plot is created showing the composition of families at the end of the feedlot period in Low RFI/High efficiency steers.Save the plot to a file.
LFplot2 <- ggplot(familydata2,aes(x="", y=End, fill=Family))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = here("././results/Lowfamilyend.png"),plot=LFplot2)

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
ggsave(filename = here("././results/Lowfamilycomb.png"),plot=LFplotcomb)

#The graph above displays the abundance of families over the course of the feedlot period in Low RFI/High efficiency steers
#Notice that the abundance and composition of families differs between Low-RFI and High-RFI steers

#Repeat for Genus



###Genus: High-RFI

#load data. path is relative to project directory.
genusdata<- readRDS("./data/processed_data/processeddata_genusdata.rds")

#An initial plot is created showing the composition of two genera at the beginning of the feedlot period in High RFI/low efficiency steers. Save plot to a file. 
HGplot1 <- ggplot(genusdata,aes(x="", y=Beginning, fill=Genus))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = here("././results/Highgenusbeg.png"),plot=HGplot1)

#A second plot is created showing the composition of two genera at the end of the feedlot period in High RFI/low efficiency steers.Save the plot to a file.
HGplot2 <- ggplot(genusdata,aes(x="", y=End, fill=Genus))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = here("./results/Highgenusend.png"),plot=HGplot2)

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
ggsave(filename = here("././results/Highgenuscomb.png"),plot=HGplotcomb)




###Genus: Low-RFI

#load data. path is relative to project directory.
genusdata2<- readRDS("./data/processed_data/processeddata_genusdata2.rds")

#An initial plot is created showing the composition of two genera at the beginning of the feedlot period in Low RFI/High efficiency steers. Save plot to a file.
LGplot1 <- ggplot(genusdata2,aes(x="", y=Beginning, fill=Genus))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = here("././results/Lowgenusbeg.png"),plot=LGplot1)

#A second plot is created showing the composition of two genera at the end of the feedlot period in Low RFI/High efficiency steers.Save the plot to a file.
LGplot2 <- ggplot(genusdata2,aes(x="", y=End, fill=Genus))+ geom_bar(width = 1, stat = "identity")

#Save graph
ggsave(filename = here("././results/Lowgenusbend.png"),plot=LGplot2)


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
ggsave(filename = here("././results/Lowgenuscomb.png"),plot=LGplotcomb)


### Alpha diversity - high

#Load Data
alpha_diversity_high <- readRDS("./data/processed_data/processed_data_alpha_diversity_hi.rds")

#Take a look at the data and rename variables
head(alpha_diversity_high)
Item <- alpha_diversity_high$Item
Beginning <- alpha_diversity_high$Beginning
End <- alpha_diversity_high$End
datafri <- data.frame(Item, Beginning, End)
print(datafri)
cor(datafri$Beginning, datafri$End)
stacked <- stack(datafri)
stacked

#Create linear model and ANOVA 
results <- aov(values ~ ind, data = stacked)
summary(results)
linearMod1 <- lm(Beginning ~ End, data=datafri)
print(linearMod1)
Anova(linearMod1, type="III")
modelSummary <- summary(linearMod1)
print(modelSummary)

# save chart with p-value
saveRDS(Anova(linearMod1, type="III"), file = "./results/resulttable_high_alpha_lm.rds")

#Place results back into a data frame
linearMod1table <-broom::tidy(linearMod3)
linearMod1table

# save chart with p-value
saveRDS(linearMod1table, file = here ("././results/linearMod1table.rds"))


### Alpha diversity - low

#Load Data
alpha_diversity_low <- readRDS("./data/processed_data/processed_data_alpha_diversity_low.rds")

#Take a look at the data and rename variables as needed
head(alpha_diversity_low)
Item <- alpha_diversity_low$Item
Beginning <- alpha_diversity_low$Beginning
End <- alpha_diversity_low$End
datafri <- data.frame(Item, Beginning, End)
cor(datafri$Beginning, datafri$End)
stacked <- stack(datafri)
stacked

#Create Linear Model and ANOVA
results <- aov(values ~ ind, data = stacked)
summary(results)
linearMod1 <- lm(Beginning ~ End, data=datafri)
Anova(linearMod1, type="III")
modelSummary <- summary(linearMod1)
print(modelSummary)


# save chart with p-value
saveRDS(Anova(modelSummary, type="III"), file = "./results/resulttable_low_alpha_lm.rds")

#Place results back into a data frame
modelSummarytable <-broom::tidy(modelSummary)
modelSummarytable

# save chart with p-value
saveRDS(modelSummarytable, file = here ("././results/modelSummarytable.rds"))



### Animal Performance
animal_performance <- readRDS("./data/processed_data/processed_data_animal_performance.rds")


#Take a look at the data and rename variables as needed
head(animal_performance)
Item <- animal_performance$Item
High <- animal_performance$High
Low <- animal_performance$Low
data_frame_performance <- data.frame(Item, High, Low)
cor(data_frame_performance$High, data_frame_performance$Low)
stacked <- stack(data_frame_performance)
stacked

#Create Linear Model and ANOVA
results <- aov(values ~ ind, data = stacked)
summary(results)
linearMod3 <- lm(High ~ Low, data=data_frame_performance)
Anova(linearMod3, type="III")
modelSummary <- summary(linearMod3)
print(modelSummary)


#Place results back into a data frame
linearMod3table <-broom::tidy(linearMod3)
linearMod3table
# save chart with p-value
saveRDS(linearMod3table, file = here ("././results/linearMod3table.rds"))










  
 





  