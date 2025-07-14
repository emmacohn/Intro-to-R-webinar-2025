# Loading a library 
library(tidyverse)
library(here)
library(openxlsx2)

# Storing values in a variable
random_variable <- c(1, 3, 5, 7, 9) 

# Importing a csv 
counties_income <- read.csv(here("input/counties_per_capita_income.csv"))

# Executing line by line commands 
summarize(counties_income, inc_median = median(household_income), n=n(), .by = states)

ranked_income <- mutate(counties_income, rank = rank(-pci))

# Executing a multi-line command using pipes 
cleaned_data <- counties_income |>
    filter(statefips == c(36, 6, 37)) |>
    summarize(inc_mean = mean(household_income), 
              n = n(), .by = states)

# Writing a csv to a path
write.csv(cleaned_data, here("output/state_incomes.csv"))
