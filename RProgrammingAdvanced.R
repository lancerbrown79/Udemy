#Import data
getwd()

fin <- read.csv("P3-Future-500-The-Dataset.csv") #Basic
fin <- read.csv("P3-Future-500-The-Dataset.csv", na.strings=c(""))
fin
head(fin, 20)
tail(fin)
str(fin)
summary(fin)
#Factor is a categorical variable; R deals with factors in numerical sense
#Changing from non-factor to factor
fin$ID <- factor(fin$ID) 
summary(fin)
str(fin)
fin$Inception <- factor(fin$Inception)
summary(fin)

#Factor Variable Trap (FVT) - you cannot convert factor into number without making it character first
#Converting into Numerics for Characters
a <- c("12", "13", "14", "12", "12")
a
typeof(a)
b <- as.numeric(a)
b
typeof(b)
#Converting into Numerics for Factors:
z <- factor(c("12", "13", "14", "12", "12")) 
z
typeof(z) #this is an integer based on factorization of z (12 is level 1, 13 is level 2, 14 is level 3)
y <- as.numeric(z)
y #integers of factorization show up (not 12, 13, 14)
typeof(y)
#---------CORRECT WAY - convert factor into character, then numeric
x <- as.numeric(as.character(z))
x

#gsub() and sub() - sub() replaces first instance; gsub() replaces all instances
?sub
fin$Expenses <- gsub(" Dollars","", fin$Expenses)
head(fin)
fin$Expenses <- gsub(",","",fin$Expenses)
str(fin) #Expenses became character

fin$Revenue <- gsub("\\$","",fin$Revenue) #create escape sequence in front of special characters, e.g. (\\) in front of $ 
fin$Revenue <- gsub(",","",fin$Revenue)
head(fin)
str(fin) #Revenue became character

fin$Growth <- gsub("%","",fin$Growth)
head(fin)
str(fin)

fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)
fin$Profit <- as.numeric(as.character(fin$Profit))
str(fin)
summary(fin)

#Dealing with missing data
#1. Predict with 100% accuracy
#2. Leave record asis
#3. Remove record entirely
#4. Replace with mean or median
#5. Fill in by exploring correlations and similarities
#6. Introduce dummy variable for "Missingness"

#What is NA
?NA
TRUE #1
FALSE #0
NA #NA is missing value

#Locate missing data
#Updated import to: fin <- read.csv("P3-Future-500-The-Dataset.csv", na.strings=c(""))
fin
head(fin, 24)
complete.cases(fin) #check to see if NA is present in any row
fin[!complete.cases(fin), ] #returns all rows with NA in them
str(fin)
# <NA> occurs because of factors

#Filtering: using which() for non-missing data
head(fin)
fin$Revenue == 9746272
fin[fin$Revenue == 9746272, ] #Filter rows containing 9746272; why are NA rows coming up?
#Filter fin$Revenue == 9746272 contains NA's
9746272 == NA #R is telling us there are NA's in rows for desired revenue value.
which(fin$Revenue == 9746272) #gives row number with TRUE value, which only picks out TRUE value
?which
fin[which(fin$Revenue == 9746272), ]
head(fin)
fin[fin$Employees==45, ]
fin[which(fin$Employees==45), ] #returns rows with no NA's

#Filtering: using is.na() for missing data; how do we get rows that do have NAs
head(fin, 24)
fin$Expenses==NA #filter returns all NAs
fin[fin$Expenses==NA, ] #not what we want
is.na() #checks to see if something is NA
a <- c(1, 24, 543, NA, 76, 45, NA)
is.na(a)
is.na(fin$Expenses) #filter returns all NAs
fin[is.na(fin$Expenses), ] #pick out rows with NAs
fin[is.na(fin$State), ]

#Removing records with missing data
#Remove Industry rows with empty data
fin_backup <- fin
fin[!complete.cases(fin), ] #returns all rows with NAs
fin[is.na(fin$Industry), ] #Returns NA rows in industry column
fin <- fin[!is.na(fin$Industry), ] #opposite (removes rows with NAs)
tail(fin)

fin[!complete.cases(fin), ] 

#Resetting the dataframe index

rownames(fin) <- 1:nrow(fin) #reset rownames to number of rows
fin

#faster way to reset rows
fin <- fin_backup
rownames(fin) <- NULL
fin

#Replacing Missing Data: Factual Analysis
fin[!complete.cases(fin), ]
fin[is.na(fin$State) & fin$City=="New York", "State" ] <- "NY"
#check
fin[c(11,377), ]
fin[!complete.cases(fin), ]

#Change state to CA for San Francisco
fin[is.na(fin$State) & fin$City=="San Francisco", "State" ] <- "CA"
#check
fin[c(82,265), ]
fin[!complete.cases(fin), ]

