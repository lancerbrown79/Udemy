library(tidyverse)
R1 <- c("fam001", "fam001", "fam002", "fam002", "fam003", "fam003")
R2 <- c("C001", "C002", "C003", "C004", "C005", "C006")
R3 <- c(23, 24, 23.2, 21.5, 35, 33.9)
T1
T1 <- data.frame(R1, R2, R3)
colnames(T1) <- c("Family", "SSCID", "Ct")
#Filter fam001 and SSCID C001
T2 <- T1 %>%
        filter(T1$Family %in% c("fam001") & T1$SSCID %in% c("C001"))
T2

#Filter fam001 and fam002 without tidyverse
f1 <- (T1$Family=="fam001") | (T1$Family=="fam002")
f1a <- T1[f1, ]
f1a
str(f1a)
str(T1)
T1
f1a
?str
summary(T1)
summary(f1a)
getwd()

f1a[f1a$Family=="fam001" & f1a$SSCID=="C001", "Ct"] <- 20
f1a
