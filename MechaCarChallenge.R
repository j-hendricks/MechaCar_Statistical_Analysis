library(dplyr)
library(tidyverse)
library(ggplot2)

mpg_data <- read.csv("data/MechaCar_mpg.csv", stringsAsFactors = F)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_data))

coil_data <- read.csv("data/Suspension_Coil.csv", stringsAsFactors = F)

total_summary <- coil_data %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

lot_summary <- coil_data %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups= 'keep')

# p value is 2.2e-16 < 0.05, so the data is not normally distributed
print(shapiro.test(coil_data$PSI))

# plot density plot
plt <- ggplot(coil_data, aes(x=PSI))
plt + geom_density()

# data transformation using inverse
trans <- 1 / coil_data$PSI

plt2 <- ggplot(coil_data, aes(x=1 / PSI))
plt2 + geom_density()

# inverse transformation failed
print(shapiro.test(trans))

# data transformation: square
sq <- (coil_data$PSI)^2

# square failed
print(shapiro.test(sq))

x <- coil_data$PSI

sd_x <- sd(x)

x_filt <- c()

# remove outliers
for (element in x) {
  if (element - mean(x) < 2.5*sd_x){
    if (element - mean(x) > -2.5*sd_x){
      x_filt <- append(x_filt, element)
    }
  }
}

plot(density(x_filt))

# final transormation failed, unable to transform data
print(shapiro.test(x_filt))

# provided by project instructions
population_mean = 1500

t_test <- t.test(x, mu= population_mean )
print(t_test)

t.test(subset(coil_data, Manufacturing_Lot == 'Lot1')$PSI, mu = population_mean)
t.test(subset(coil_data, Manufacturing_Lot == 'Lot2')$PSI, mu = population_mean)
t.test(subset(coil_data, Manufacturing_Lot == 'Lot3')$PSI, mu = population_mean)



