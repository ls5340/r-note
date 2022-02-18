# Wrangling 2

# loading packages

library(tidyverse)
library(skimr)

coronavirus = read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')
View(coronavirus)

# Exercise 1

coronavirus %/%
  filter(type == "death", country %in% c("US","Canada","Mexico")) %>%
  select(country,data,cases)

# %in% is included in
# %>% forward a value or a result

# loading the vaccine data

vacc <- read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/covid19_vaccine.csv")

View(vacc)

max(vacc$date)

vacc %>%
  filter(date == max(vacc$date)) %>%
  select(country_region:people_fully_vaccinated, population) %>%
  mutate(vaxx_rate = people_fully_vaccinated / population, 1)
# mutate(vaxx_rate = people_fully_vaccinated / population, 2)

vacc %>%
  filter(date == max(vacc$date)) %>%
  select(country_region:people_fully_vaccinated, population) %>%
  mutate(doses_full = doses_admin / people_fully_vaccinated) %>%
  View()
  filter(!is.na(doses_full)) %>%
  View()

  
vacc_rate <- vacc %>%
  filter(date == max(vacc$date)) %>%
  select(country_region:people_fully_vaccinated, population) %>%
  mutate(vacc_rate = people_fully_vaccinated / population_fully_vaccinated) %>%
    filter(!is.na(doses_full)) %>%

!is.na(vacc_rate$vaxx_rate)

coronavirus %>%
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarize(sum = sum(cases))
  
coronavirus %>%
  filter(type == "confirmed") %>%
  group_by(country) %>%
  summarize(n=n())

coronavirus %>%
  group_by(country, type) %>%
  summarize(total = sum(cases))


  

