library(tidyverse)
lotr <- read_csv(lotr <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv"))
#View(lotr)

(lotr %>% 
  ggplot() +
  geom_col(mapping = aes(x = Film, y = Words, fill = Race)) ) 
ggsave(lotr, filename = "~/Home/NTRES6100 r note/data/wordcount.png")

lotr %>% 
  filter(Race %in% c("Elf", "Habbit")) %>% 
  ggplot() +
  geom_col(mapping = aes(x = Film, y = Words, fill = Race))

vector <- c(1,2,3,4,2,1)

lotr$Race
lotr$Race %in% c("Elf", "Habbit")

library(knitr)
select(lotr,Race) %>% 
  kable()

# r-binding ---------------------------------------------------------------

fship <- tribble(
  ~Film,    ~Race, ~Female, ~Male,
  "The Fellowship Of The Ring",    "Elf",    1229,   971,
  "The Fellowship Of The Ring", "Hobbit",      14,  3644,
  "The Fellowship Of The Ring",    "Man",       0,  1995
)
rking <- tribble(
  ~Film,    ~Race, ~Female, ~Male,
  "The Return Of The King",    "Elf",     183,   510,
  "The Return Of The King", "Hobbit",       2,  2673,
  "The Return Of The King",    "Man",     268,  2459
)
ttow <- tribble(
  ~Film,    ~Race, ~Female, ~Male,
  "The Two Towers",    "Elf",     331,   513,
  "The Two Towers", "Hobbit",       0,  2463,
  "The Two Towers",    "Man",     401,  3589
)

lotr_untidy <- bind_rows(fship, ttow, rking)
lotr_untidy <- rbind(fship, ttow, rking)

fship_nofemale <- fship %>% 
  select(-Female) <- fship %>%
  
rbind(fship_nofemale, ttow, rking)
bind_rows(ttow, fship_nofemale, rking)

fship_shuffled <-  
  select(Race, Female, Film, Male)
ttow

bind_rows(fship_shuffled, ttow, rking)
rbind(fship_shuffled, ttow, rking)


# join functions ----------------------------------------------------------

install.packages("nycflights13") 
library(nycflights13)
View(flights)

library(tidyverse)
flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)
flights2

planes %>% 
  count(tailnum) %>% 
  filter(n > 1)

weather %>% 
  count(year, month, day, hour, origin) %>% 
  filter(n > 1)

flights2 %>% 
  left_join(airlines, by = "carrier")

flights2 %>% 
  left_join(planes, by = "tailnum", suffix = c("_flightdate", "_manufacture"))

airports
flights %>% 
  left_join(airports, by = c("dest" = "faa")) %>% 
  left_join(airports, by = c("origin" = "faa"), suffix = c("_dest", "_origin")) %>% 
  View()





