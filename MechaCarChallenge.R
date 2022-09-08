library(dplyr)
library(tidyverse)
mpg_data <- read.csv("data/MechaCar_mpg.csv", stringsAsFactors = F)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_data))

coil_data <- read.csv("data/Suspension_Coil.csv", stringsAsFactors = F)

total_summary <- coil_data %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

lot_summary <- coil_data %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups= 'keep')