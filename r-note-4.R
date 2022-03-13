#vignettes()
#dput()
#https://cscu.cornell.edu/consulting/drop-ins/

#lotr <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv")
#lotr_space <-  read_delim("", delim = "\t")
#lotr_space

#write_csv(lotr, file = " .csv")
#write_tsv(lotr, file = " .tsv")

library(tidyverse)
library(janitor)

coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')
plot <- coronavirus %>% 
  filter(type == "confirmed") %>% 
  group_by(date) %>% 
  summarize(total_cases = sum(cases)) %>% 
  ggplot() +
  geom_line(aes(date,total_cases))
ggsave(plot, filename = "~/Home/NTRES6100 r note/data/totalcounts.jpg") 
#ggsave(plot, filename = "~/Home/NTRES6100 r note/data/totalcounts.png") 
