#Script to estimate the model parameters using a linear approximation

library(dplyr)

growth_data <- read.csv("experiment1.csv")
head(growth_data)

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1600) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>1600)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
