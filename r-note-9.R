library(tidyverse)
library(dplyr)
library(gapminder)
library(gridExtra) #install.packages("gridExtra")

x1 <- c("Dec", "Apr", "Jan"," Jun")
x2 <- c("Dec", " Apr", "Jan"," Jun")

sort(x1)

month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

x1 <- c("Dec", "Apr", "Jan"," Jun")
x2 <- c("Dec", " Apr", "Jan"," Jun")

y1 <- factor(x1, levels = month_levels)
sort(y1)

y2 <- factor(x2, levels = month_levels)
sort(y1)

gapminder
str(gapminder$country)
levels(gapminder$continent)
nlevels(gapminder$continent)
class(gapminder$continent)

as.numeric(gapminder$continent)

gapminder %>% 
  count(continent)

fct_count(gapminder$continent)
nlevels(gapminder$country)
h_countries <- c("Egypt", "Haiti", "Romania", "Thailand", "Venezuela")

h_gap <- gapminder %>% 
  filter(country %in% h_countries)
  
dim(h_gap)
dim(gapminder)

nlevels(h_gap$country)
nlevels(h_gap$continent)

h_gap_dropped <- h_gap %>% 
droplevels()

nlevels(h_gap_dropped$country)
nlevels(h_gap_dropped$continent)

h_gap$country %>% 
  fct_drop() %>% 
  levels()

small_gap <- gapminder %>% 
  filter(pop < 250000) %>% 
  mutate(country = fct_drop(country), 
         continent = fct_drop(continent)) %>% 
  droplevels()

nlevels(small_gap$country)
nlevels(small_gap$continent)

gapminder %>% 
  count(continent)

gapminder$continent %>% 
  fct_infreq() %>% 
  fct_rev() %>% 
  levels()

p1 <- gapminder %>% 
  ggplot(aes(x = continent)) +
  geom_bar()

p2 <- gapminder %>% 
  mutate(continent = fct_infreq(continent)) %>% 
  ggplot(aes(x = fct_infreq(continent))) +
  geom_bar()

grid.arrange(p1, p2, nrow = 1)

gap_asia_2007 <- gapminder %>% 
  filter(continent == "Asia", year == "2007")

p1 <- gap_asia_2007 %>% 
  ggplot(aes(x = lifeExp, y = country)) +
  geom_point()

p1 <- gap_asia_2007 %>% 
  ggplot(aes(x = lifeExp, y = fct_reorder(country, lifeExp))) +
  geom_point()

p2 <- h_gap %>% 
  mutate(country = fct_reorder2(country, year, lifeExp)) %>% 
  ggplot(aes(x = year, y = lifeExp,
                        color = country)) +
  geom_line()

grid.arrange(p1, p2, nrow = 1)

h_countries
h_gap <- gapminder %>% 
  filter(country %in% h_countries)
levels(h_gap$country)

p1 <- ggplot(h_gap, aes(x = year, y = lifeExp, color = country))
p1 <- ggplot()

h_gap$country %>% 
  droplevels() %>% 
  fct_relevel("Romania", "Thailand") %>% 
  levels()

gap_asia_2007 %>% 
  mutate(country = fct_reorder(country,  gdpPercap)) %>% 
  ggplot(aes(x = fct_relevel(country, "Thailand"), y = gdpPercap)) +
  geom_point() +
  coord_flip()

i_gap <- gapminder %>% 
  filter(country %in% c("United States", "Sweden", "Australia")) %>% 
  droplevels()

i_gap$country %>% 
  fct_recode("USA" = "United States", "Oz" = "Australia") %>% 
  levels()