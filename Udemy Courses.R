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









