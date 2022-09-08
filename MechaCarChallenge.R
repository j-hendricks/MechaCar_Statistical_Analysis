library(dplyr)
mpg_data <- read.csv("data/MechaCar_mpg.csv", stringsAsFactors = F)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_data))