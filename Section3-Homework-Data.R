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

#matrices

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
