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









