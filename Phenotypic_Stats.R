---
title: "BIO395 Lab Notebook on Phenotypic Selection"
author: "Ars Ghani"
date: "9/11/2019"
output: pdf_document
---

# __BIO395 Lab Notebook__ 
# *Arranged chronologically from 9/6/19 to the end of semester.*

#_________________________________________________________________________________

# Friday, 6 September 2019
# *One-on-one meeting with Nancy and Michaela*

# Discussed expectations for credit-hour commitments, final paper, and the project. 
# The paper will be peer-re#Viewed and about 6 papers and will have incremental writing steps that will be punctuated by re#View from Michaela and Nancy. The final paper will be due (by e-mail) to Dr. Larracuente when the semester ends to ensure BIO395 has been completed properly.   

*Outline & Annotated Bibliography: Friday, November 1  
*First Draft: Monday, November 25  
*Peer ReView: Wednesday, December 2  
*Final draft: Friday, December 13  

# Saturday, 7 September 2019

Read phenotypic selection papers including the famous Lande & Arnold (1983) and Kingsolver & Pfennig (2007). These papers will guide this research project as they focus on the inheritance and patterns of phenotypic selection. There were certain parts of these papers that piqued my interest: 

>"Phenotypic selection in nature is common and can be measured in the field in real time. In particular, directional selection is often sufficiently strong to cause substantial evolutionary change in a relatively short period" (Kingsolver and Pfennig, 2007).

This forms the basis of our project: measuring the phenotypic changes in populations of FLSJ: because hopefully any or all phenotypic selection in the Jays will be evident through the data collected on that certain phenotype. We can then regress fitness as a function of an individual phenotype and that will give us valuable insight on this phenomenon.   

>"Directional selection favors larger body size. This pattern contrasts with the pattern for other morphological traits, which tend to experience positive and negative directional selection with equal frequency. Moreover, bigger organisms are generally fitter, regardless of whether larger body size enhances survival, fecundity, or mating success. In fact, directional selection favoring larger body size is sufficiently strong to explain Cope's rule, the widespread tendency for lineages to evolve toward larger body size" (Kingsolver and Pfennig, 2007).  

This actually is very exciting and fascinating to me- I would never think that a larger size would translate to being fitter, even though it seems very plausible. This is one of the reason that a phenotype that I would like to focus on would be *body weight* and some other numerical trait which can correlate with a larger size such as *head length.*   

# Thursday, 12 September 2019

Started and finished making a spreadsheet which would be the stepping-stone to digitizing the metadata. It contains a separate sheet for each of the list in the FSLJ demography data with its corresponding data frame and columns. The best part about this whole endeavor is that this will serve as a dictionary and reference point for any future analyses. This is because it breaks down each and every data marker of the demography data and also gives a small description of what it is and why it is included. 
The spreadsheet can be found here: [Link](REDACTED)  

# Friday, 13 September 2019
*One-on-one meeting with Nancy and Michaela*

Got more clarity on the project and approval for the spreadsheet. The spreadsheet is now more detailed and will be filled in within a week. It would be pertinent to choose the phenotypes for analysis during this time since it is the first time we are really diving into the demography data.  

```{r}
#Using this for figuring out the type of each data point:
#str()
#typeof()
#This usually gives a type such as integer, date, or character. 
```

# Monday, 16 to Thursday, 19 September 2019

Around 10 hours were spent accessing the myriad of data contained in the FLSJ demography data and digitizing it. It personally gave me a lot of time to look at each data entry personally, explore the serious nooks of different tables, and decide upon phenotypes for analysis by looking at data available for them. Since this is a collaborative effort, certain parts of our spreadsheet remain unfilled but for the most part it seems to be done. 

Next steps: 
*Getting the list of phenotypes confirmed by Michaela and Nancy,  
*Data filtering step for each phenotype,   
*Knowing how PLE digitization will tie in with this project.  

# Thursday, 19 to Friday, 27 September 2019  

This was a very productive week especially due to the clear expectations set in the last week's meeting. Right after last week's meeting, the following goals for this week were made: 

* Complete the metadata sheet and highlight description for everything we are unsure about,
* Complete lit search: 20 papers and 4 books reference minimum on phenotypes, fitness, and other things our project is focusing on, 
* Make a list of phenotypes, split it between the group members, and also put in where it could be found with code, 
* Put in why we think this phenotype is important and how it will act in the population.

The metadata sheet was completed. Next group meeting, we can go over description of stuff we were confused about. The metadata sheet can be found here: [Link](https://docs.google.com/spreadsheets/d/1NuCdvMbRx2HeiNA05KI6vO2Q-7aFpiGuhCE3KXMhNtk/edit?usp=sharing)  

A lit search was also completed, and in doing so I think I realized what I really want to look into specifically: Cope's Rule in the FLSJ. I have thoroughly looked in Cope's Law and I am sure it will make for a great and interesting dive into the FLSJ phenotypes. The lit search can be found here: [link](https://docs.google.com/document/d/1E3GPUdilLpO63dB6E7dV0KiJbrmSFlZF0OGpRGG9oXs/edit?usp=sharing)    

The phenotypes were also divided: 

### Phenotypes that I am doing: 

* Weight (access$metrics)
* HeadLength (access$metrics)
* BillDepth (access$metrics)
* BillWidth (access$metrics)
* TailLength (access$metrics)
* HeadBreadth (access$metrics)
* Sex (access$metrics)
* Culmen (access$metrics)
* Nares (access$metrics)

### Phenotypes that Michaela is doing: 

* Parasite (access$metrics)
* ClutchNum (accesss$Nests)
* PMolt (access$metrics)
* Fat (access$metrics)
* Manus (access$metrics)
* Tarsus (access$metrics)
* Primary7 (access$metrics)
* WingCord (access$metrics)

The week ended with me choosing the discussion paper for the lab meeting, and Michaela and I pondering upon how each and every chosen phenotype will act in population to form sort of mental models and early hypotheses. 

# October and Fall Break:
Filled with more lit searches and more importantly finalization of phenotypes.

```{r}
metadata <- load("/cloud/project/all_tables_v2.rdata")
library(ggplot2)
```
# Filtering Each Phenotype Alone. 
The phenotypes I chose were Weight, HeadLength, BillDepth, BillWidth, TailLength, HeadBreadth, Culmen, Nares. 
My general protocol for filtering these phenotypes is:
1) Remove all data enteries that do not have a data of birth and/or a date of measurement because then it is impossible to determine the age of the bird, 
2) Only Demo tract data was used, 
3) Data only after 1990 was used,
4) Keep the ID of the bird. This will allow us to merge them together later when calculating corelations between phenotypes. 
5) Remove very obviously erroneous data points. 
6) Also the ages were categorised in brackets: 
  ??? day 0 to 11: nestling,
  ??? >day 11 post hatch: fledgelings,
  ??? >day 70 post hatch: juveniles,
  ??? >365 post hatch: yearlings (with multiples)
  
Filtering Weight Alone:
```{r}
WeightAge <- (access$metrics[, c('Weight', 'AgeMeas', 'MeasDate', "ID", 'est.hatch')])  # Storing Weight and Age when these phenotypes were measured from the Access List to a new variable. It is important to remember that the age is in days. I also included date of measurement and estimated date of hatch. 
#View(WeightAge)  # #Viewing the variable
WeightAge_Cleaned <- WeightAge[which(!is.na(WeightAge$Weight) & WeightAge$AgeMeas != ""), ]  # Removing any instances where data is either blank or "NA".
#View(WeightAge_Cleaned)  # #Viewing cleaned data
plot(WeightAge_Cleaned$Weight~WeightAge_Cleaned$AgeMeas) # Just a quick scatterplot to see where we stand at the moment. I notice that there is an erroneous data point which is around 170grams. Let's remove it.  
boxplot(WeightAge_Cleaned$Weight)
outliersweight<-boxplot(WeightAge_Cleaned$Weight, plot=FALSE)$out # This gives me the exact value of the erroneous data point 
print(outliersweight)
WeightAge_Cleaned[which(WeightAge_Cleaned$Weight %in% outliersweight),] # First you need find in which rows the outliers are in and the values they will be impacting.
WeightAge.Cleaned<-WeightAge_Cleaned[!(WeightAge_Cleaned$Weight %in% c(178)), ] # The outlier is in the 1643rd row!
#View(WeightAge.Cleaned)
boxplot(WeightAge.Cleaned$Weight)
ggplot(data = WeightAge.Cleaned, aes(x = AgeMeas , y = Weight)) + geom_point() + ggtitle("Weight vs Age")
# There are 11,750 entries.
```

Filtering Headlength Alone:
```{r}
HeadlengthAge <- (access$metrics[, c('HeadLength', 'AgeMeas', 'MeasDate', "ID", 'est.hatch')])  # Storing HeadLength and Age when these phenotypes were measured from the Access List to a new variable. It is important to remember that the age is in days. I also included date of measurement and estimated date of hatch. 
#View(HeadlengthAge)  # #Viewing the variable
HeadlengthAge_Cleaned <- HeadlengthAge[which(!is.na(HeadlengthAge$HeadLength) & HeadlengthAge$AgeMeas != ""), ]  # Removing any instances where data is either blank or "NA".
#View(HeadlengthAge_Cleaned)  # #Viewing cleaned data
plot(HeadlengthAge_Cleaned$HeadLength~HeadlengthAge_Cleaned$AgeMeas) # Just a quick scatterplot to see where we stand at the moment. 
boxplot(HeadlengthAge_Cleaned$HeadLength) # No erroneous data points are obvious.
ggplot(data = HeadlengthAge_Cleaned, aes(x = AgeMeas , y = HeadLength)) + geom_point() + ggtitle("Head length vs Age")
# There are 2,711 entries.
```

Filtering BillDepth Alone:
```{r}
BillDepthAge <- (access$metrics[, c('BillDepth', 'AgeMeas', 'MeasDate', "ID", 'est.hatch')])  # Storing BillDepth and Age when these phenotypes were measured from the Access List to a new variable. It is important to remember that the age is in days. I also included date of measurement and estimated date of hatch. 
#View(BillDepthAge)  # #Viewing the variable
BillDepthAge_Cleaned <- BillDepthAge[which(!is.na(BillDepthAge$BillDepth) & BillDepthAge$AgeMeas != ""), ]  # Removing any instances where data is either blank or "NA".
#View(BillDepthAge_Cleaned)  # #Viewing cleaned data
plot(BillDepthAge_Cleaned$BillDepth~BillDepthAge_Cleaned$AgeMeas) # Just a quick scatterplot to see where we stand at the moment. 
boxplot(BillDepthAge_Cleaned$BillDepth) # A huge outlier noticed at ~80. Let's remove it.
outliersbilldepth<-boxplot(BillDepthAge_Cleaned$BillDepth, plot=FALSE)$out # This gives me the exact value of the erroneous data point 
print(outliersbilldepth) # We can see it as 82. 
BillDepthAge.Cleaned<-BillDepthAge_Cleaned[!(BillDepthAge_Cleaned$BillDepth %in% c(82)), ] 
boxplot(BillDepthAge.Cleaned$BillDepth)
ggplot(data = BillDepthAge.Cleaned, aes(x = AgeMeas , y = BillDepth)) + geom_point() + ggtitle("BillDepth vs Age")
# There are 2,760 entries.
```

Filtering BillWidth Alone:
```{r}
BillWidthAge <- (access$metrics[, c('BillWidth', 'AgeMeas', 'MeasDate', "ID", 'est.hatch')])  # Storing BillWidth and Age when these phenotypes were measured from the Access List to a new variable. It is important to remember that the age is in days. I also included date of measurement and estimated date of hatch. 
#View(BillWidthAge)  # #Viewing the variable
BillWidthAge_Cleaned <- BillWidthAge[which(!is.na(BillWidthAge$BillWidth) & BillWidthAge$AgeMeas != ""), ]  # Removing any instances where data is either blank or "NA".
#View(BillWidthAge_Cleaned)  # #Viewing cleaned data
plot(BillWidthAge_Cleaned$BillWidth~BillWidthAge_Cleaned$AgeMeas) # Just a quick scatterplot to see where we stand at the moment. 
boxplot(BillWidthAge_Cleaned$BillWidth) # No erroneous data detected. 
ggplot(data = BillWidthAge_Cleaned, aes(x = AgeMeas , y = BillWidth)) + geom_point() + ggtitle("Bill Width vs Age")
# There are 2,758 entries.
```

Filtering TailLength Alone:
```{r}
TailLengthAge <- (access$metrics[, c('TailLength', 'AgeMeas', 'MeasDate', "ID", 'est.hatch')])  # Storing TailLength and Age when these phenotypes were measured from the Access List to a new variable. It is important to remember that the age is in days. I also included date of measurement and estimated date of hatch. 
#View(TailLengthAge)  # #Viewing the variable
TailLengthAge_Cleaned <- TailLengthAge[which(!is.na(TailLengthAge$TailLength) & TailLengthAge$AgeMeas != ""), ]  # Removing any instances where data is either blank or "NA".
#View(TailLengthAge_Cleaned)  # #Viewing cleaned data
plot(TailLengthAge_Cleaned$TailLength~TailLengthAge_Cleaned$AgeMeas) # Just a quick scatterplot to see where we stand at the moment. 
boxplot(TailLengthAge_Cleaned$TailLength)
ggplot(data = TailLengthAge_Cleaned, aes(x = AgeMeas , y = TailLength)) + geom_point() + ggtitle("Tail Length vs Age")
# There are 4,429 entries.
```

Filtering HeadBreadth Alone:
```{r}
HeadBreadthAge <- (access$metrics[, c('HeadBreadth', 'AgeMeas', 'MeasDate', "ID", 'est.hatch')])  # Storing HeadBreadth and Age when these phenotypes were measured from the Access List to a new variable. It is important to remember that the age is in days. I also included date of measurement and estimated date of hatch. 
#View(HeadBreadthAge)  # #Viewing the variable
HeadBreadthAge_Cleaned <- HeadBreadthAge[which(!is.na(HeadBreadthAge$HeadBreadth) & HeadBreadthAge$AgeMeas != ""), ]  # Removing any instances where data is either blank or "NA".
#View(HeadBreadthAge_Cleaned)  # #Viewing cleaned data
plot(HeadBreadthAge_Cleaned$HeadBreadth~HeadBreadthAge_Cleaned$AgeMeas) # Just a quick scatterplot to see where we stand at the moment. 
boxplot(HeadBreadthAge_Cleaned$HeadBreadth) #Two outliers/errors can be seen. 
outliersheadbreadth<-boxplot(HeadBreadthAge_Cleaned$HeadBreadth, plot=FALSE)$out # This gives me the exact value of the erroneous data point 
print(outliersheadbreadth) # read them off as 252 and 247. 
HeadBreadthAge.Cleaned<-HeadBreadthAge_Cleaned[!(HeadBreadthAge_Cleaned$HeadBreadth %in% c(247,252)), ] 
boxplot(HeadBreadthAge.Cleaned$HeadBreadth)
#View(HeadBreadthAge.Cleaned)
ggplot(data = HeadBreadthAge.Cleaned, aes(x = AgeMeas , y = HeadBreadth)) + geom_point() + ggtitle("Headbreadth vs Age")
# There are 694 entries.
```

Filtering Culmen Alone:
```{r}
CulmenAge <- (access$metrics[, c('Culmen', 'AgeMeas', 'MeasDate', "ID", 'est.hatch')])  # Storing Culmen and Age when these phenotypes were measured from the Access List to a new variable. It is important to remember that the age is in days. I also included date of measurement and estimated date of hatch. 
#View(CulmenAge)  # #Viewing the variable
Culmen_Cleaned <- CulmenAge[which(!is.na(CulmenAge$Culmen) & CulmenAge$AgeMeas != ""), ]  # Removing any instances where data is either blank or "NA".
#View(Culmen_Cleaned)  # #Viewing cleaned data
plot(Culmen_Cleaned$Culmen~Culmen_Cleaned$AgeMeas) # Just a quick scatterplot to see where we stand at the moment. 
ggplot(data = Culmen_Cleaned, aes(x = AgeMeas , y = Culmen)) + geom_point() + ggtitle("Culmen vs Age")
# There are 2,731 entries.
```

# Filtering Each Phenotype in Pairs

Filtering Weight and HeadLength:
```{r}
WeightHL <- merge(WeightAge.Cleaned, HeadlengthAge_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(WeightHL)
ggplot(data = WeightHL, aes(x = Weight, y = HeadLength)) + geom_point() + ggtitle("Weight & Head Length")
cor(WeightHL$Weight,WeightHL$HeadLength)
# There are 2,693 entries.
```

Filtering Weight and BillDepth:
```{r}
WeightBD <- merge(WeightAge.Cleaned, BillDepthAge.Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(WeightBD)
ggplot(data = WeightBD, aes(x = Weight, y = BillDepth)) + geom_point() + ggtitle("Weight & Bill Depth")
cor(WeightBD$Weight,WeightBD$BillDepth)
# There are 2,743 entries.
```

Filtering Weight and Bill Width:
```{r}
WeightBW <- merge(WeightAge.Cleaned, BillWidthAge_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(WeightBW)
ggplot(data = WeightBW, aes(x = Weight, y = BillWidth)) + geom_point() + ggtitle("Weight & Bill Width")
cor(WeightBW$Weight,WeightBW$BillWidth)
# There are 2,742 entries.
```

Filtering Weight and Tail Length:
```{r}
WeightTL <- merge(WeightAge.Cleaned, TailLengthAge_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(WeightTL)
ggplot(data = WeightTL, aes(x = Weight, y = TailLength)) + geom_point() + ggtitle("Weight & Tail Length")
cor(WeightTL$Weight,WeightTL$TailLength)
# There are 4,415 entries.
```

Filtering Weight and Head Breadth:
```{r}
WeightHB <- merge(WeightAge.Cleaned, HeadBreadthAge.Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(WeightHB)
ggplot(data = WeightHB, aes(x = Weight, y = HeadBreadth)) + geom_point() + ggtitle("Weight & Head Breadth")
cor(WeightHB$Weight,WeightHB$HeadBreadth)
# There are 691 entries.
```

Filtering Weight and Culmen:
```{r}
WeightCulmen <- merge(WeightAge.Cleaned, Culmen_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(WeightCulmen)
ggplot(data = WeightCulmen, aes(x = Weight, y = Culmen)) + geom_point() + ggtitle("Weight & Culmen")
cor(WeightCulmen$Weight,WeightCulmen$Culmen)
# There are 2,714 entries.
```

Filtering HeadLength and BillDepth:
```{r}
HLBD <- merge(HeadlengthAge_Cleaned, BillDepthAge.Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(HLBD)
ggplot(data = HLBD, aes(x = HeadLength, y = BillDepth)) + geom_point() + ggtitle("Head Length & Bill Depth")
cor(HLBD$HeadLength,HLBD$BillDepth)
# There are 2,624 entries.
```

Filtering HeadLength and BillWidth:
```{r}
HLBW <- merge(HeadlengthAge_Cleaned, BillWidthAge_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(HLBW)
ggplot(data = HLBW, aes(x = HeadLength, y = BillWidth)) + geom_point() + ggtitle("Head Length & Bill Width")
cor(HLBW$HeadLength,HLBW$BillWidth)
# There are 2,623 entries.
```

Filtering HeadLength and TailLength:
```{r}
HLTL <- merge(HeadlengthAge_Cleaned, TailLengthAge_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(HLTL)
ggplot(data = HLTL, aes(x = HeadLength, y = TailLength)) + geom_point() + ggtitle("Head Length & TailLength")
cor(HLTL$HeadLength,HLTL$TailLength)
# There are 2,218 entries.
```

Filtering HeadLength and Head Breadth:
```{r}
HLHB <- merge(HeadlengthAge_Cleaned, HeadBreadthAge.Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(HLHB)
ggplot(data = HLHB, aes(x = HeadLength, y = HeadBreadth)) + geom_point() + ggtitle("Head Length & Head Breadth")
cor(HLHB$HeadLength,HLHB$HeadBreadth)
# There are 694 entries.
```

Filtering Head Length and Culmen:
```{r}
HLCulmen <- merge(HeadlengthAge_Cleaned, Culmen_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(HLCulmen)
ggplot(data = HLCulmen, aes(x = HeadLength, y = Culmen)) + geom_point() + ggtitle("Head Length & Culmen")
cor(HLCulmen$HeadLength,HLCulmen$Culmen)
# There are 2,597 entries.
```

Filtering Bill Depth and Bill Width:
```{r}
BDBW <- merge(BillDepthAge.Cleaned, BillWidthAge_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(BDBW)
ggplot(data = BDBW, aes(x = BillDepth, y = BillWidth)) + geom_point() + ggtitle("Bill Depth & Bill Width")
cor(BDBW$BillDepth,BDBW$BillWidth)
# There are 2,757 entries.
```

Filtering Bill Depth and Tail Length:
```{r}
BDTL <- merge(BillDepthAge.Cleaned, TailLengthAge_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(BDTL)
ggplot(data = BDTL, aes(x = BillDepth, y = TailLength)) + geom_point() + ggtitle("Bill Depth & Tail Length")
cor(BDTL$BillDepth,BDTL$TailLength)
# There are 2,171 entries.
```

Filtering Bill Depth and Head Breadth:
```{r}
BDHB <- merge(BillDepthAge.Cleaned, HeadBreadthAge.Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(BDHB)
ggplot(data = BDHB, aes(x = BillDepth, y = HeadBreadth)) + geom_point() + ggtitle("Bill Depth & Head Breadth")
cor(BDHB$BillDepth,BDHB$HeadBreadth)
# There are 690 entries.
```

Filtering Bill Depth and Culmen:
```{r}
BDCulmen <- merge(BillDepthAge.Cleaned, Culmen_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(BDCulmen)
ggplot(data = BDCulmen, aes(x = BillDepth, y = Culmen)) + geom_point() + ggtitle("Bill Depth & Culmen")
cor(BDCulmen$BillDepth,BDCulmen$Culmen)
# There are 2,698 entries.
```

Filtering Bill Width and Tail Length:
```{r}
BWTL <- merge(BillWidthAge_Cleaned, TailLengthAge_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(BWTL)
ggplot(data = BWTL, aes(x = BillWidth, y = TailLength)) + geom_point() + ggtitle("Bill Width & Tail Length")
cor(BWTL$BillWidth,BWTL$TailLength)
# There are 2,170 entries.
```

Filtering Bill Width and Culmen:
```{r}
BWCulmen <- merge(BillWidthAge_Cleaned, Culmen_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(BWCulmen)
ggplot(data = BWCulmen, aes(x = BillWidth, y = Culmen)) + geom_point() + ggtitle("Bill Width & Culmen")
cor(BWCulmen$BillWidth,BWCulmen$Culmen)
# There are 2,697 entries.
```

Filtering Tail Length and Head Breadth:
```{r}
TLHB <- merge(TailLengthAge_Cleaned, HeadBreadthAge.Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(TLHB)
ggplot(data = TLHB, aes(x = TailLength, y = HeadBreadth)) + geom_point() + ggtitle("Tail Length & Head Breadth")
cor(TLHB$TailLength,TLHB$HeadBreadth)
# There are 624 entries.
```

Filtering Tail Length and Culmen:
```{r}
TLCulmen <- merge(TailLengthAge_Cleaned, Culmen_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(TLCulmen)
ggplot(data = TLCulmen, aes(x = TailLength, y = Culmen)) + geom_point() + ggtitle("Tail Length & Culmen")
cor(TLCulmen$TailLength,TLCulmen$Culmen)
# There are 2,149 entries.
```

Filtering Head Breadth and Culmen:
```{r}
HBCulmen <- merge(HeadBreadthAge.Cleaned, Culmen_Cleaned, by = "ID") # Since every Jay has a unique ID in the DEMO dataset, we can merge the two data lists horizontally together. 
#View(HBCulmen)
ggplot(data = HBCulmen, aes(x = HeadBreadth, y = Culmen)) + geom_point() + ggtitle("Tail Length & Culmen")
cor(HBCulmen$HeadBreadth,HBCulmen$Culmen)
# There are 693 entries.
```

The procedure to ensure that we are controlling for birds only in demo and not in the peripheral territories is as follows (in psuedocode):
Go to the list all.breeders,
Ensure that the following columns have loaded properly: ID, TerrYr.
This is to make sure that the ID of the Jay can be matched with the territory and Year and thus the data can be properly filtered. The last 2 digits of TerrYr are the years the data was collected in. 

TLDR: all.breeders->filter out ID, and TerrYr column. Use merge function to merge the this new list with each phenotype using ID as an argument. 

```{r}
PerTer<-all.breeders[, c('TerrYr', 'ID', 'Tract', 'Year', 'Terr')] #Make a new list of just these columns
View(PerTer) #This has some "South" in it. Lets remove that. Also there are no PLEs in this. 
PerTer_Cleaned<-na.omit(PerTer) # Removes all NA
View(PerTer_Cleaned)
PerTer_Cleaned1<-PerTer[PerTer$Tract!= "South",] # Removes all South tracts. 
View(PerTer_Cleaned1)
```

# Now to ensure that we are controlling for the correct year because Demo study tract stabilised around 1990. 

```{r}
PerTer_Year<-PerTer_Cleaned1[PerTer_Cleaned1$Year >= "1990",]
View(PerTer_Year)
```

# Importing a list of peripheral territories to be removed. This list will be done against our PerTer_Year and will remove any matches from the Terr column. 

```{r}
#toremovePT<-read.csv("/cloud/project/PTNancy1.csv")
#View(toremovePT)
remove <- c("ATNT", "BEAR", "CHGR", "CHIK", "CIRB", "CIRC" ,"COTG" ,"EAGB", "EAGR", "FTZP", "GRVR", "GRVW", "HARB", "HILD" ,"HTOP", "KAJO", "LARB", "LARY", "MIDG", "NARY", "NENE" ,"NNAR", "OSEE", "PINN", "PITA", "PMPN", "RISE", "RTHA", "TOAK" ,"TP11", "WARY", "WCHK", "WICK" ,"WISB", "WISE", "SEGR", "WCIT", "PINE", "PINS", "SWCT", "CRIS", "FELD", "JESS", "KELV", "TNGL", "WINO" ,"WLAK") #This makes a variable "remove" that contains all the peripheral territories that need to be removed.
finalphenotype<-PerTer_Year[!PerTer_Year$Terr %in% remove,] #Removal sucessful! 
View(finalphenotype)
```
Now hopefully, this can be merged with our phenotypes, and although our number will decrease, we will get controlled data. 

```{r}
#Trying to merge weight with the new controlled for periphery data along with marking the age of the Jays as nestlings, fledgelings, juveniles, and yearlings This will represent the final step in ensuring data filteration and we can move on to data filteration of fitness measures and ultimately results. This will also include a discussion and control for covariates along with potential fitness variable to regress against. Final file names will be called systematically!
```

```{r}
#File name: WeightAge.Cleaned
#11,750 entries

WeightMerge<-merge(WeightAge.Cleaned, finalphenotype, by = "ID")
View(WeightMerge)
WeightMerge$AgeCategory<-99 #adding a new column to prepare for categorical ages such as juveniles, yearlings etc. 
WeightMerge$AgeCategory[WeightMerge$AgeMeas<=11]<-"Nestling"
WeightMerge$AgeCategory[11<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=70]<-"Fledgling"
WeightMerge$AgeCategory[70<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=365]<-"Juveniles"
WeightMerge$AgeCategory[365<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=730]<-"Yearling"
WeightMerge$AgeCategory[730<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=1095]<-"Second Yearling"
WeightMerge$AgeCategory[1095<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=1460]<-"Third Yearling"
WeightMerge$AgeCategory[1460<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=1825]<-"Fourth Yearling"
WeightMerge$AgeCategory[1825<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=2190]<-"Fifth Yearling"
WeightMerge$AgeCategory[1825<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=2190]<-"Fifth Yearling"
WeightMerge$AgeCategory[2190<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=2555]<-"Sixth Yearling"
WeightMerge$AgeCategory[2555<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=2920]<-"Seventh Yearling"
WeightMerge$AgeCategory[2920<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=3285]<-"Eighth Yearling"
WeightMerge$AgeCategory[3285<WeightMerge$AgeMeas & WeightMerge$AgeMeas<=3650]<-"Ninth Yearling"

#The number of entries dropped to 1,524. 
```