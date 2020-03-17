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






