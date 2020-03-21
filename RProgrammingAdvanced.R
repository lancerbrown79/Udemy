#Import data
getwd()

fin <- read.csv("P3-Future-500-The-Dataset.csv")
fin
head(fin)
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
