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

#Median imputation method (Part I)
fin[fin$Industry=="Retail", ]
fin[!complete.cases(fin), ]
med_empl_retail <- median(fin[fin$Industry=="Retail", "Employees"], na.rm=TRUE) 

fin[is.na(fin$Employees) & fin$Industry=="Retail", "Employees"] <- med_empl_retail #replace NA for retail employees with median of retail employees
fin[3,]

mean(fin[, "Employees"], na.rm=TRUE)
mean(fin[fin$Industry=="Financial Services", "Employees"], na.rm=TRUE)
median(fin[, "Employees"], na.rm=TRUE)
median(fin[fin$Industry=="Financial Services", "Employees"], na.rm=TRUE)

med_empl_financialservices <- median(fin[fin$Industry=="Financial Services", "Employees"], na.rm=TRUE)
med_empl_financialservices

fin[is.na(fin$Employees) & fin$Industry=="Financial Services", "Employees"] <- med_empl_financialservices
fin[330, ]

#Replacing Missing Data: Median Imputation Method (Part 2)
fin[!complete.cases(fin), ]
mean(fin[ ,"Growth"], na.rm=TRUE)
mean(fin[fin$Industry=="Construction", "Growth"], na.rm=TRUE)
median(fin[ ,"Growth"], na.rm=TRUE)
median(fin[fin$Industry=="Construction", "Growth"], na.rm=TRUE)

med_growth_const <- median(fin[fin$Industry=="Construction", "Growth"], na.rm=TRUE)

fin[is.na(fin$Growth), ]
fin[is.na(fin$Growth) & fin$Industry=="Construction", ]
fin[is.na(fin$Growth) & fin$Industry=="Construction", "Growth"] <- med_growth_const
#check
fin[8, ]
fin[!complete.cases(fin), ]

#Replacing Missing Data: Median Imputation Method (Part 3)
fin_backup2 <- fin
fin <- fin_backup2
#Replacing Construction Revenue NAs
mean(fin[ ,"Revenue"], na.rm=TRUE)
mean(fin[fin$Industry=="Construction" ,"Revenue"], na.rm=TRUE)
median(fin[ ,"Revenue"], na.rm=TRUE)
median(fin[fin$Industry=="Construction" ,"Revenue"], na.rm=TRUE)
med_constr_revenue <- median(fin[fin$Industry=="Construction" ,"Revenue"], na.rm=TRUE)
fin[is.na(fin$Revenue) & fin$Industry=="Construction", "Revenue"] <- med_constr_revenue
fin[c(8,42), ]
#Replacing Construction Expenses NAs
mean(fin[ ,"Expenses"], na.rm=TRUE)
mean(fin[ ,"Expenses"], na.rm=TRUE)
mean(fin[fin$Industry=="Construction", "Expenses"], na.rm=TRUE)
median(fin[ ,"Expenses"], na.rm=TRUE)
median(fin[fin$Industry=="Construction", "Expenses"], na.rm=TRUE)
med_constr_expenses <- median(fin[fin$Industry=="Construction", "Expenses"], na.rm=TRUE)
med_constr_expenses
fin[is.na(fin$Expenses) & fin$Industry=="Construction" & is.na(fin$Profit),"Expenses"] <- med_constr_expenses #add extra filter to insure rows have Profit as NA
fin[!complete.cases(fin), ]

#Replacing  missing data: deriving values
#Revenue - Expenses = Profit
#Expenses = Revenue - Profit

fin[is.na(fin$Profit), "Profit"] <- fin[is.na(fin$Profit), "Revenue"] - fin[is.na(fin$Profit), "Expenses"]
fin[!complete.cases(fin), ]

fin[c(8,42), ]

fin[is.na(fin$Expenses), "Expenses"] <- fin[is.na(fin$Expenses), "Revenue"] - fin[is.na(fin$Expenses), "Profit"]
fin[15, ]
fin[!complete.cases(fin), ]

#Visualizing Results
library(ggplot2)

#Scatterplot classified by Industry showing revenue, expenses, profit
p <- ggplot(data=fin)
p + geom_point(aes(x=Revenue, y=Expenses, 
        color=Industry, size=Profit))

#Scatterplot that includes industry trends for the expenses revenue relationship
d <- ggplot(data=fin, aes(x=Revenue, y=Expenses, 
        color=Industry))
d + geom_point() + 
        geom_smooth(fill=NA, size=1.2)

#BoxPlots showing growth by industry
e <- ggplot(data=fin, aes(x=Industry, y=Growth,
        color=Industry))
e + geom_boxplot(size=1)

#Extra
e + geom_jitter() +
        geom_boxplot(alpha=0.5, outlier.color=NA)

fin

# Lists

#Deliverable - a list with the following components:
#Character:     Machine name
#Vector:        (min, mean, max) Utilization for the month (excluding unknown hours)
#Logical:       Has utilization ever fallen below 90%? TRUE/FALSE
#Vector:        All hours where utilization is unknown (NA's)
#Dataframe:     For this machine
#Plot:          For all machines

getwd()

util <- read.csv("P3-Machine-Utilization.csv")

head(util, 12)
str(util)
summary(util)

#Derive utilization column

util$Utilization = 1 - util$Percent.Idle
head(util,12)

#Handling Date-Times in R

tail(util) #Determine if european or american format. Tail shows you where 30 days is in the date. 

?POSIXct #Stores time as number of seconds that have passed since 1970

util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M") #Y is 4 digit year
head(util, 12)
summary(util) #Posix time recognized as time

#TIP: How to rearrange columns in dataframe:

util$Timestamp <- NULL
head(util, 12)

util <- util[, c(4, 1, 2, 3)] #rearrange columns by passing on vector of rearranged column numbers
head(util, 12)

#What is a list?

#List is data object that can contain any types of elements

summary(util)

RL1 <- util[util$Machine=="RL1", ]
RL1

summary(RL1)

#When subsetting dataframe, you need to refactor data frame to get rid of legacy factor

RL1$Machine <- factor(RL1$Machine)

#Construct list
#Character:     Machine name
#Vector:        (min, mean, max) Utilization for the month (excluding unknown hours)
#Logical:       Has utilization ever fallen below 90%? TRUE/FALSE

util_stats_rl1 <- c(min(RL1$Utilization, na.rm=T),
        mean(RL1$Utilization, na.rm=T), 
        max(RL1$Utilization, na.rm=T))

util_stats_rl1
length(which(RL1$Utilization < 0.90)) > 0 #tells length of vector indeces that have True values; has one occurance of True ever happened; ignores NAs
as.logical(length(which(RL1$Utilization < 0.90)))
util_under_90_flag <- length(which(RL1$Utilization < 0.90)) > 0 
util_under_90_flag

list_rl1 <- list("RL1", util_stats_rl1, util_under_90_flag)
list_rl1

#Naming components of a List
names(list_rl1)
names(list_rl1) <- c("Machine", "Stats", "LowThreshold")

list_rl1

#Another way. Like with dataframes: 

rm(list_rl1)
list_rl1 <- list(Machine="RL1", Stats=util_stats_rl1, LowThreshold=util_under_90_flag)
list_rl1

#Extracting components of a list
#Three ways:
#[] - will always return a list
#[[]] - will always return a component
#$ - same as [[]] but prettier

list_rl1[1] #returns list of component 1
list_rl1[[1]] #returns component vector
list_rl1$Machine #returns component vector 
list_rl1[2] #returns list of component 2
typeof(list_rl1[2])
typeof(list_rl1$Machine)
typeof(list_rl1[[2]])

list_rl1$Stats
typeof(list_rl1$Stats)

#how would you access the third element of the vector (max utilization)?
list_rl1[[c(2,3)]]
list_rl1[[2]][3]
list_rl1$Stats[3]

#Adding and deleting components in list
list_rl1
list_rl1[4] <- "New Information"
list_rl1

#Another way to add component via the $
#We will add:
#Vector: All hours where utilization is unknown (NAs)
RL1
RL1[is.na(RL1$Utilization), ] #Gives subset of data where NA's are present
RL1[is.na(RL1$Utilization), "PosixTime"] 
list_rl1$UnknownHours <- RL1[is.na(RL1$Utilization), "PosixTime"] 
list_rl1

#Remove component. Use NULL method

list_rl1[100] <- "New Information"
list_rl1
list_rl1[c(5:100)] <- NULL #remove components 5 through 100
list_rl1
list_rl1[4] <- NULL
list_rl1

#!!Notice: numeration has shifted
list_rl1[4] #when component 4 was removed, component 5 automatically became component 4

#Add another component 
#Dataframe: for this machine

list_rl1$Data <- RL1
list_rl1

#Change maxprint option to 10000
options("max.print"=10000)
getOption("max.print")

summary(list_rl1)
str(list_rl1)

#Challenge - how would you access first date in component UnknownHours?

list_rl1[[4]][1]
list_rl1$UnknownHours[1]

#Subsetting a list []
list_rl1
list_rl1[1:3]
list_rl1[c(1,4)]
list_rl1[c("Machine", "Stats")]
sublist_rl1 <- list_rl1[c("Machine", "Stats")]
sublist_rl1
sublist_rl1[[2]][2] #get average in component 2
sublist_rl1$Stats[2]  #get average in component 2
#Double Square brackets are NOT for subsetting
list_rl1[[1:3]] #doesn't work because you can only specify 1 component in double brackets

#Build timeseries plot
library(ggplot2)

p <- ggplot(data=util)
p + geom_line(aes(x=PosixTime, y=Utilization,
        color=Machine), size=1.1) +
        facet_grid(Machine~.) +
        geom_hline(yintercept = 0.90,
                color="Gray", size=1.2,
                linetype=3)
?linetype

myplot <- p + geom_line(aes(x=PosixTime, y=Utilization,
        color=Machine), size=1.1) +
        facet_grid(Machine~.) +
        geom_hline(yintercept = 0.90,
                color="Gray", size=1.2,
                linetype=3)

list_rl1$Plot <- myplot
list_rl1

summary(list_rl1)
str(list_rl1)

#Apply family of functions
getwd() 
setwd("./Weather Data") #. is current directory

#Read data; #we don't want rownames to be separate column; rownames=1 means take rownames from first column
Chicago <- read.csv("Chicago-F.csv", row.names=1) 
NewYork <- read.csv("NewYork-F.csv", row.names=1)
Houston <- read.csv("Houston-F.csv", row.names=1) 
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names=1)
#Check
Chicago
NewYork
Houston
SanFrancisco

#These are dataframes
is.data.frame(Chicago)

#Convert to matrices (all values are numeric)
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#Put all into a list
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Weather

Weather[3] #Returns component as subset list
Weather[[3]] #Returns just component (not in list)
Weather$Houston #Returns just component (not in list)

#Apply
M <- rbind(c(27,63,42,111,12),c(1, 54, 34, 98, 21), c(44, 14, 54, 101, 2))
is.matrix(M)
M

#Apply functions apply something to a matrix
#Apply mean function to matrix M. 1 denotes rows.
apply(M, 1, mean) 
apply(M, 1, max)

#Apply function with 2 applies function to columns
apply(M, 2, mean)

#Apply family
#apply - use on a matrix, either rows (1) or the columns (2)
#tapply - use on a vector to extract subgrounds and apply a function to them
#by - use on data frames. Same concept as in group by in SQL
#eapply - use on an environment(E)
#lapply - apply a function to elements of a list (L)
#sapply - a version of lapply. Can simplify (S) the result so it's not presented as a list
#vapply - has a pre-specified type of return value (V)
#replicate - run a function several times. Usually used with generation of random variables.
#mapply - multivariate(M) verson of sapply. Arguments can be recycled
#rapply - recursive(R) version of lapply

?apply
Chicago
#Get average for every row
apply(Chicago, 1, mean)
#check:
mean(Chicago["DaysWithPrecip", ])
#analyize one city:
Chicago
apply(Chicago, 1, max)
apply(Chicago, 1, min)
#for practice
apply(Chicago, 2, max) #good exercise
apply(Chicago, 2, min) #good exercise

#Compare:
apply(Chicago, 1, mean)
apply(Houston, 1, mean)
apply(NewYork, 1, mean)
apply(SanFrancisco, 1, mean)
                                #<<< (nearly) deliverable 1: but there is a faster way

#Recreate apply function using loops (advanced topic)

Chicago

#Find mean of every row
#Method 1: via loops
output <- NULL #preparing empty vector
for(i in 1:5) { #run cycle
        output[i] <- mean(Chicago[i, ])
}

output #let's see what we have
names(output) <- rownames(Chicago)
output

#Method 2: via apply
apply(Chicago, 1, mean) #shorter than loops

#Using lapply()
?lapply
Chicago
t(Chicago) #transpose matrix
Weather #list has 4 matrices

#How can we transpose all 4 matrices and put them back into a list?
lapply(Weather, t) #t(Chicago), t(NewYork), t(Houston), t(SanFrancisco)

mynewlist <- lapply(Weather, t)
mynewlist

#example 2
Chicago
rbind(Chicago, NewRow=1:12)
lapply(Weather, rbind, NewRow=1:12) #Add new row to each component in a list; returns list

#example 3
?rowMeans
rowMeans(Chicago) #Identical to: apply(Chicago, 1, mean)
lapply(Weather, rowMeans)
                                #<<< (nearly) deliverable 1: better; but will improve

#Handy functions
#rowMeans
#colMeans
#rowSums
#colSums

test <- list(Chicago=colMeans(Chicago), NewYork=colMeans(NewYork), Houston=colMeans(Houston), SanFrancisco=colMeans(SanFrancisco))
test

#OR
lapply(Weather, colMeans)







