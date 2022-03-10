library(tidyverse)
lotr <- read_csv(lotr <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv"))
View(lotr)

lotr %>% 
  ggplot() +
  geom_col(mapping = aes(x = Film, y = Words, fill = Race))