"Hello World!"
mydata <- read.csv(file.choose())
library(ggplot2)
ggplot(data = mydata[mydata$carat<2.5,], 
        aes(x=carat, y=price, colour=clarity)) +
        geom_point(alpha=0.1) +
        geom_smooth()

# Types of Variables

# integer
x <- 2L
typeof(x)

# double (anything with a decimal point)
y <- 2.5
typeof(y)

# complex
z <- 3 + 2i
typeof(z)

# character
a <- "h"
typeof(a)

# logical
q1 <- T
typeof(q1)

A <- 10
B <- 5
C <- A + B
C

var1 <- 2.5
var2 <- 4

result <- var1/var2
result

answer <- sqrt(var2)
answer

greeting <- "Hello"
name <- "Bob"
message <- paste(greeting, name)
message

# Logical:
# TRUE T
# FALSE F
4 < 5
10 > 100
4 == 5
# == (equal to)
# != (not equal to)
# < (less than)
# > (greater than)
# <= (less than equal to)
# >= (greater than equal to)
# ! (not)
# | (or)
# & (and)
# isTRUE(x)
result <- 4 < 5
result
typeof(result)

result2 <- !TRUE
result2

result2 <- !(5>1)
result2

result | result2
result & result2

isTRUE(result)

# While loops - continue until argument is FALSE

while(FALSE){
        print("Hello")
}

while(TRUE){
        print("Hello")
}

# ^^ Press (Escape) to exit infinite loop

counter <- 1
while(counter < 12) {
        print(counter)
        counter <- counter + 1
}


# For loops (arguments are iterations of a loop)

for(i in 1:5){
      print("Hello R")  
}

1:5

for(i in 5:10){
        print("Hello R")  
}

# If Else statement

# ---- -2 ---- -1 ----- 0 ----- 1 ----- 2 ----

rm(answer)
x <- rnorm(1)

if(x > 1){
        answer <- "Greater than 1"
} else if(x >= -1){
        answer <- "Between -1 and 1"
} else {
        answer <- "Less than -1"
}

# Law of large numbers = as n increases towards infinity, the mean of x will approach expected value of x

n <- 1000000
counter <- 0
for(i in rnorm(n)) {
       if(i > -1 & i < 1){
               counter <- counter + 1
       }
}
answer <- counter / n
answer

# Vector

MyFirstVector <- c(3, 45, 56, 732)
MyFirstVector 
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(3L, 12L, 243L, 0L)
is.numeric(V2) #Numeric encompasses integers and doubles
is.integer(V2) 
is.double(V2)

V3 <- c("a", "B23", "Hello", 7)
V3
is.character(V3)
is.numeric(V3)

seq() #sequence - like ":"
rep() #replicate

seq(1,15) #gives flexibility
1:15

seq(1,15, 2)
z <- seq(1,15,4)
z

rep(3, 50) #repeat 3, 50 times.
d <- rep(3, 50)
rep("a", 5)
x <- c(80, 20)
y <- rep(x, 10)
y

#Brackets

x <- c(1, 123, 534, 13, 4)
y <- seq(201, 250, 11)
z <- rep("Hi!", 3)

w <- c("a", "b", "c", "d", "e")
w
w[1]
w[-1] #access except one
w[-3]
v <- w[-3]
w[1:3]
w[3:5]
w[c(1, 3, 5)]
w[c(-2, -4)]
w[-3:-5]
w[9]
w[-9]
w[-4]
w[-6]

x <- rnorm(5)
x
#R specific programming loop
for(i in x) {
        print(i)
}

print(x[1])
print(x[2])
print(x[3])

#conventional programming loop
for(j in 1:5){
        print(x[j])
}

#--------2nd part

N <- 100
a <- rnorm(N)
b <- rnorm(N)

#Vectorized approach (Faster than de-vectorized)
c <- a * b

#De-vectorized approach
d <- rep(NA, N)
for(i in 1:N){
        d[i] <- a[i] * b[i]
}

library(ggplot2)
qplot(data=diamonds, carat, price, colour=clarity, facets=.~clarity)

#Homework: Financial Statement Analysis
#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

profit <- revenue - expenses
tax <- round(0.30 * profit, 2)
profitaftertax <- profit - tax
profitmargin <- round(profitaftertax / revenue, 2)*100
goodmonths <- profitaftertax > mean(profitaftertax)
badmonths <- profitaftertax < mean(profitaftertax)
bestmonth <- profitaftertax == max(profitaftertax)
worstmonth <- profitaftertax == min(profitaftertax)
revenue.1000 <- round(revenue/1000, 0)
expenses.1000 <- round(expenses/1000, 0)
profit.1000 <- round(profit/1000, 0)
profitaftertax.1000 <- round(profitaftertax/1000, 0)

#Print
revenue.1000
expenses.1000
profit.1000
profitaftertax.1000
profitmargin
goodmonths
badmonths
bestmonth
worstmonth

#Matrices

m <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profitaftertax.1000,
  profitmargin,
  goodmonths,
  badmonths,
  bestmonth,
  worstmonth      
)

m
colnames(m) <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
class(m)

Salary

kb <- Salary[1, 4:6]
kb

?matrix

my.data <- 1:20
my.data
A <- matrix(my.data, 4, 5)
A
A[2,3]
B <- matrix(my.data, 4, 5, byrow=T)
B
B[2,5]

#rbind
r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1, 2, 3)
C <- rbind(r1, r2, r3)
C

#cbind
c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1, c2)
D

#Named Vectors
Charlie <- 1:5
Charlie

#give names
names(Charlie) <- c("a", "b", "c", "d", "e")
Charlie
Charlie["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

#Naming Matrix Dimensions 1

temp.vec <- rep(c("a", "b", "zZ"), each=3)
rep(c("a", "b", "zZ"), times=3)
rep(c("a", "b", "zZ"), each=3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("How", "are", "you")
Bravo
colnames(Bravo) <- c("X", "Y", "Z")

Bravo["are", "Y"] <- 0 #replace specific values in a matrix
Bravo

rownames(Bravo) <- NULL #remove row names
Bravo

#Matrix operations

Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]
FieldGoals
FieldGoals / Games
round(FieldGoals / Games, 1)

round(MinutesPlayed / Games)

#MATPLOT() - plots columns of matrices; if you want to plot rows you have to transpose data

?matplot
matplot(t(FieldGoals/Games), type="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F )
#transpose
t(FieldGoals/Games)

matplot(t(FieldGoals/FieldGoalAttempts), type="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F )

matplot(t(Salary/Points), type="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F )


#Subsetting

x <- c("a", "b", "c", "d", "e")
x
x[c(1,5)]
x[1]

Games
Games[1:3, 6:10]
Games[c(1,10), ]
Games[, c("2008", "2009")]
Games[1, ]
class(Games[1, ])
Games[1,5] #gives vector because 1d argument
Games[1,,drop=F] #R is no longer dropping a dimension; returns matrix
Games[1,5, drop=F] #R is no longer dropping a dimension; returns matrix

#Visualizing subsets
Data <- MinutesPlayed[1:3,]
matplot(t(Data), type="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4, 6), pch=15:18, horiz=F )

Data <- MinutesPlayed[1,, drop=F]
matplot(t(Data), type="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4, 6), pch=15:18, horiz=F )



#First function

myplot <- function(data, rows=1:10){
  Data <- data[rows,, drop=F]
  matplot(t(Data), type="b", pch=15:18, col=c(1:4, 6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4, 6), pch=15:18, horiz=F )
}

myplot(Salary)
myplot(MinutesPlayed/Games)
myplot(MinutesPlayed/Games, 3)

#Salary
myplot(Salary)
myplot(Salary / Games)
myplot(Salary / FieldGoals)

#In-Game Metrics
myplot(MinutesPlayed)
myplot(Points)

#In-Game Metrics Normalized
myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)

#Interesting Observation
myplot(MinutesPlayed/Games)
myplot(Games)

#Time is valuable
myplot(FieldGoals/MinutesPlayed)

#Player style
myplot(Points/FieldGoals)

#Section 4 Homework 

#Seasons
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")

#Players
Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")

#Free Throws
KobeBryant_FT <- c(696,667,623,483,439,483,381,525,18,196)
JoeJohnson_FT <- c(261,235,316,299,220,195,158,132,159,141)
LeBronJames_FT <- c(601,489,549,594,593,503,387,403,439,375)
CarmeloAnthony_FT <- c(573,459,464,371,508,507,295,425,459,189)
DwightHoward_FT <- c(356,390,529,504,483,546,281,355,349,143)
ChrisBosh_FT <- c(474,463,472,504,470,384,229,241,223,179)
ChrisPaul_FT <- c(394,292,332,455,161,337,260,286,295,289)
KevinDurant_FT <- c(209,209,391,452,756,594,431,679,703,146)
DerrickRose_FT <- c(146,146,146,197,259,476,194,0,27,152)
DwayneWade_FT <- c(629,432,354,590,534,494,235,308,189,284)
#Matrix
FreeThrows <- rbind(KobeBryant_FT,JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT,DwightHoward_FT, 
  ChrisBosh_FT,ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
FreeThrows
rm(KobeBryant_FT,JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT,DwightHoward_FT, 
  ChrisBosh_FT,ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
colnames(FreeThrows) <- Seasons
rownames(FreeThrows) <- Players


#Free Throw Attempts
KobeBryant_FTA <- c(819,768,742,564,541,583,451,626,21,241)
JoeJohnson_FTA <- c(330,314,379,362,269,243,186,161,195,176)
LeBronJames_FTA <- c(814,701,771,762,773,663,502,535,585,528)
CarmeloAnthony_FTA <- c(709,568,590,468,612,605,367,512,541,237)
DwightHoward_FTA <- c(598,666,897,849,816,916,572,721,638,271)
ChrisBosh_FTA <- c(581,590,559,617,590,471,279,302,272,232)
ChrisPaul_FTA <- c(465,357,390,524,190,384,302,323,345,321)
KevinDurant_FTA <- c(256,256,448,524,840,675,501,750,805,171)
DerrickRose_FTA <- c(205,205,205,250,338,555,239,0,32,187)
DwayneWade_FTA <- c(803,535,467,771,702,652,297,425,258,370)
#Matrix
FreeThrowAttempts <- rbind(KobeBryant_FTA,JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA,DwightHoward_FTA, 
  ChrisBosh_FTA,ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
FreeThrowAttempts
rm(KobeBryant_FTA,JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA,DwightHoward_FTA, 
  ChrisBosh_FTA,ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
colnames(FreeThrowAttempts) <- Seasons
rownames(FreeThrowAttempts) <- Players
FreeThrowAttempts

#Free Throw Attampts per Game
myplot(FreeThrowAttempts / Games)

#Accuracy of Free Throws
myplot(FreeThrows / FreeThrowAttempts)

#Player playing style (2 vs 3 points preference) excluding Free Throws
style <- ((Points - FreeThrows) / FieldGoals)
myplot((Points - FreeThrows) / FieldGoals)

#Importing csv
getwd()
stats <- read.csv("/Users/lancer/Documents/R Programming/Udemy/P2-Demographic-Data.csv") #Choose from Working Directory
stats <- read.csv("P2-Demographic-Data.csv")
stats <- read.csv(file.choose()) #Choose file  manually

#Exploring data

str(stats)
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
summary(stats)

#Use the $ sign

head(stats)
stats[3, 3] #get birthrate for Angola
stats[3, "Birth.rate"]
stats["Angola", 3] #This won't work, Angola is not a column name.
#Data frames don't have names for rows; just like Excel
stats$Internet.users #returns vector for Internet.users
stats$Internet.users[2] #returns second value in vector
levels(stats$Income.Group) #see what factors are in a character vector

#Basic operations with a data frame

stats[1:10, ] #look at first 10 rows (and all columns)
stats[3:9, ]
stats[c(4,100),]
stats[, c(1,4)] #look at columns 1 and 4 and all rows
stats[,c("Country.Name","Internet.users")] #look at columns 1 and 4 and all rows

#Remember how the [] work
stats[1, ] #keeps it as a data frame (matrix would return vector (unless drop=F))
is.data.frame(stats)
stats[, 1] #doesn't return data frame (returns vector)
stats[, 1, drop=F] #to return data frame
is.data.frame(stats)

#Multiply columns
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#Add columns
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#test of knowledge
stats$xyz <- 1:5 #recycles 1:5 to fill 195 rows
head(stats)

#Remove columns
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)

#Filtering data frames
head(stats)
filter <- stats$Internet.users < 2
stats[filter,] #Use vector with TRUE FALSE values and displays values for TRUE
stats[stats$Birth.rate > 40 & stats$Internet.users <2, ]
stats[stats$Income.Group == "High income", ]

stats[stats$Country.Name == "Malta",]

#Introduction to qplot

library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate, size=I(3),
  color=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate, geom="boxplot")

#Visualizing what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
  color=I("red"), size=I(2))
qplot(data=stats, x=Internet.users, y=Birth.rate,
  color=Income.Group, size=I(2))

#Creating data frames
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, 
  Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country", "Code", "Region") #Change column names
rm(mydf)
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, 
  Region=Regions_2012_Dataset)
head(mydf)
summary(mydf)

#Merging data frames

head(stats)
head(mydf)
merged <- merge(stats, mydf, by.x="Country.Code", by.y = "Code") #Code column removed to prevent duplicate
head(merged)
merged$Country <- NULL
str(merged)

#qplot Part II
qplot(data=merged, x=Internet.users, y=Birth.rate,
  color=Region, size=I(2))

#1. Shapes
qplot(data=merged, x=Internet.users, y=Birth.rate,
  color=Region, size=I(2), shape=I(23))
#2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate,
  color=Region, size=I(2), shape=I(19), 
  alpha=I(.6))
#3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate,
  color=Region, size=I(2), shape=I(19), 
  alpha=I(.6), 
  main="Birth Rate vs Internet Users")

#Section 5 Homework
mydata5 <- read.csv("P2-Section5-Homework-Data.csv")
mydata5
str(mydata5)
tail(mydata5)
#Insight into years
temp <- factor(mydata5$Year)
temp
#Split years
mydata51960 <- mydata5[mydata5$Year == "1960", ]
mydata52013 <- mydata5[mydata5$Year == "2013", ]
#Check row counts
nrow(mydata51960)
nrow(mydata52013)
#Combining 1960 Life Expectancy with mydata5
data1960 <- cbind(mydata51960, LifeExpectancy=Life_Expectancy_At_Birth_1960)
str(data1960)
colnames(data1960) <- c("Name", "Code", "Region", "Year", "FertRate", "LifeExp")
data1960$Year <- NULL
#Combining 2013 Life Expectancy with mydata5
data2013 <- cbind(mydata52013, LifeExp=Life_Expectancy_At_Birth_2013)
str(data2013)
colnames(data2013) <- c("Name", "Code", "Region", "Year", "FertRate", "LifeExp")
data2013$Year <- NULL
#Plot Life Expectancy vs. Fertility Rate (1960)
qplot(data=data1960, x=FertRate, y=LifeExp, color=Region, main="Life Expectancy vs. Birth Rate 1960",
  size=I(2), shape=I(19), alpha=I(.6))
#Plot Life Expectancy vs. Fertility Rate (2013)
qplot(data=data2013, x=FertRate, y=LifeExp, color=Region, main="Life Expectancy vs. Birth Rate 2013",
  size=I(2), shape=I(19), alpha=I(.6))

#Comments: Fertility rate in decreasing as life expectancy increases, maybe due to increased
##proportion of aging population?

##-------------------------ggplot2

#7 layers to a plot: Data -> Aesthetics -> Geometries -> Statistics -> Facets -> Coordinates -> Theme

#-------------------------Factor - a categorical variable

getwd()
movies <- read.csv("P2-Movie-Ratings.csv")
str(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
summary(movies)

#Year should be a factor (categorical)
factor(movies$Year)
movies$Year <- factor(movies$Year) #Change Year to factor

#-------------------------Aesthetics
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#Add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
    geom_point()

#Add color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
    color=Genre)) +
  geom_point()

#Add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
    color=Genre, size=BudgetMillions)) +
  geom_point()

#Plotting with layers
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
  color=Genre, size=BudgetMillions))

#point
p + geom_point()

#point
p + geom_line()

#multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

#----------------------Overriding aesthetics

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
  color=Genre, size=BudgetMillions))

#add geom layer
q + geom_point()

#overriding aes
#example 1
q + geom_point(aes(size=CriticRating))

#example 2
q + geom_point(aes(color=BudgetMillions))

#q remains same
q + geom_point()

#example 3
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")

#example 4
q + geom_line() + geom_point()

#reduce line size
q + geom_line(size=.5) + geom_point()

#mapping vs setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#add color
#1. Mapping (what we have done so far; use aesthetic to map to a variable
r + geom_point(aes(color=Genre))

#2. Setting (setting to a physical color)
r + geom_point(color="darkgreen")

#ERROR
#r + geom_point(aes(color="DarkGreen"))

#1. Mapping
r + geom_point(aes(size=BudgetMillions))

#2. Setting
r + geom_point(size=3)

#-----------------------Histograms and Density Charts
str(movies)
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(bindwidth=10)

#add color
s + geom_histogram(bindwidth=10, aes(fill=Genre))

#add border
s + geom_histogram(bindwidth=10, aes(fill=Genre), color="Black")
#>>>3

#Density charts
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")

#------------Starting layer tips
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10,
  fill="White", color="Blue")

#another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10,
  aes(x=AudienceRating),
  fill="White", color="Blue")
#>>>4
t + geom_histogram(binwidth=10,
  aes(x=CriticRating),
  fill="White", color="Blue")
#>>>5
#Skeleton plot
t <- ggplot()
t + geom_histogram(data=movies, aes(x=AudienceRating))

#Statistical transformations
?geom_smooth
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
  color=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
  color=Genre))
u + geom_boxplot()
u + geom_boxplot() + geom_point()
#tip/hack
u + geom_boxplot() + geom_jitter(size=.2)
#another way (puts boxes on top)
u + geom_jitter(size=0.2) + geom_boxplot(alpha=0.5)
#>>>6

#--------------------Facets
v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre), 
  color="black")

v + geom_histogram(binwidth=10, aes(fill=Genre), 
  color="black") + 
  facet_grid(Genre~., scales="free")

#scatterplots
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
  color=Genre))
w + geom_point(size=1) 

#facet grid
w + geom_point(size=1) +
  facet_grid(Genre~.)

w + geom_point(size=1) +
  facet_grid(.~Year)

w + geom_point(size=1) +
  facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year)
#>>>>1

#----------Coordinates (limits and zoom)

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
  size=BudgetMillions, 
  color=Genre))

m + geom_point() +
  xlim(50,100) +
  ylim(50,100)

#won't work well always
n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(bindwidth=10, aes(fill=Genre), color="black")

n + geom_histogram(bindwidth=10, aes(fill=Genre), color="black") +
  ylim(0,50)

#instead - zoom
n + geom_histogram(bindwidth=10, aes(fill=Genre), color="black") +
  coord_cartesian(ylim=c(0,50))

#improve #1
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth(size=0.5) + facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))  

#-------------Theme

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), color="black")

#axes label
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=15),
    axis.title.y = element_text(color="red", size=15),
    axis.text.x= element_text(size=10),
    axis.text.y= element_text(size=10))

?theme

#legend formatting
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color="DarkGreen", size=15),
    axis.title.y = element_text(color="red", size=15),
    axis.text.x= element_text(size=10),
    axis.text.y= element_text(size=10),
    legend.title = element_text(size=15),
    legend.text = element_text(size=10), 
    legend.position = c(1,1),
    legend.justification = c(1,1))
    
#title
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="DarkGreen", size=15),
    axis.title.y = element_text(color="red", size=15),
    axis.text.x= element_text(size=10),
    axis.text.y= element_text(size=10),
    legend.title = element_text(size=15),
    legend.text = element_text(size=10), 
    legend.position = c(1,1),
    legend.justification = c(1,1),
    plot.title = element_text(color="dark blue",
      size=20, family="Courier"))   

#============SECTION 6 HOMEWORK
library(tidyverse)
mov2 <- read.csv("Section6-Homework-Data.csv")
#Logical for select studios
mov3 <- (mov2$Studio=="Buena Vista Studios") | (mov2$Studio=="Fox") | (mov2$Studio=="Paramount Pictures") | (mov2$Studio== "Sony") | (mov2$Studio== "Universal") | (mov2$Studio== "WB")
#Logical for select genres
mov4 <- (mov2$Genre=="action") | (mov2$Genre=="adventure") | (mov2$Genre=="animation") |(mov2$Genre=="comedy") | (mov2$Genre=="drama")
#Filter studios and genres
filtdat <- mov2[mov3&mov4, ]
#confirm filtering
factor(filt$Studio)
factor(filt$Genre)
head(filtdat)
summary(filtdat)
str(filtdat)
factor(filtdat$Gross...mill.)
#Rename column
names(filtdat)[names(filtdat)=="Budget...mill."] <- "Budget $M"

#Plot
aa <- ggplot(data=filtdat, aes(x=Genre, y=Gross...US))
aa + geom_point()
bb <- aa + geom_jitter(aes(color=Studio, size=Budget...mill.)) + geom_boxplot(alpha=0.7, 
  color="black", fill="white", outlier.color=NA)
bb <- bb + 
  xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(color="Blue", size="20"),
    axis.title.y = element_text(color="Blue", size="20"), 
    axis.text.x = element_text(size=10),
    axis.text.y = element_text(size=12),
    plot.title = element_text(size=25),
    legend.title = element_text(),
    text = element_text(family="Comic Sans MS")
    )

bb$labels$size <- "Budget $M"
bb    
    
library(tidyverse)
mov3td <- mov2 %>%
  filter(mov2$Studio %in% c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB"))
mov4td <- mov3td %>%
  filter(mov3td$Genre %in% c("action", "adventure", "animation", "comedy", "drama"))
summary(mov4td)
summary(mov3td)    
summary(mov3)    
factor(mov4td$Studio)
factor(mov4td$Genre)
factor(mov2$Genre)
str(mov3td)

