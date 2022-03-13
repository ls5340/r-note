library(tidyverse)

table1

table1 %>% 
  mutate(rate = cases / population)

table1 %>% 
  summarize(year, counts = sum(cases))

table1 %>% 
  summarize(year, wt = cases)

table4a %>% 
  pivot_longer(c(`1999`,`2000`), names_to = "year", values_to = "cases")

table2 %>% 
  pivot_wider(names_from = type, values_from = count)

table3 %>% 
  separate(rate, into = c("cases","population"), convert = TRUE)

table3 %>% 
  separate(year, into = c("century", "year"), sep = 2) %>% 
  unite(fullyear, century, year, sep = "")


# LOTR --------------------------------------------------------------------


fship <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")
fship

ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")
ttow

rking <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")
rking

lotr_untidy <- bind_rows(fship, ttow, rking)

lotr_tidy <- lotr_untidy %>% 
  pivot_longer(c(Female, Male), names_to = "Gender", values_to = "Words")

lotr_wide <- lotr_tidy %>% 
  pivot_wider(names_from = Race, values_from = Words)
