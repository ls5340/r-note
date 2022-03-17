library(tidyverse)
library(gapminder)
library(janitor)

gapminder1 <- gapminder %>% 
  rename("life_exp" = lifeExp, "gdp_per_cap" = gdpPercap)
colnames(gapminder) <-  c("country", "continent", "year", "life_exp", "pop", "gdp_per_cap")

#gapminder::gapminder

clean_names(gapminder)

gap_dslabs <- read_csv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/main/datasets/gapminder_dslabs_subset_original_names.csv")

gapminder %>% 
  left_join(gap_dslabs, by = c("country", "year")) %>% 
  View()

gap_dslabs_cap <- gap_dslabs %>% 
  rename("Country" = country, "Year" = year)

gapminder %>% 
  left_join(gap_dslabs_cap, by = c("country" = "Country", "year" = "Year"))

gapminder %>% 
  filter(country == "Malawi", year > 1970)

top_fert <- gap_dslabs %>% 
  arrange(-fertility) %>% 
  head(10)

gapminder %>% 
  semi_join(top_fert)

unique(gapminder$country)

gapminder %>% 
  anti_join(gap_dslabs, by = "country") %>% 
  count(country)

gap_dslabs %>% 
  anti_join(gapminder, by = "country") %>% 
  count(country) #%>% 
  #View()
  #print(n = Inf)

cntry <- "Afghanistan"

gap_to_plot <- gapminder %>% 
  filter(country == cntry)

ggplot(data = gap_to_plot, aes(x = year, y = gdp_per_cap)) +
  geom_point() +
  labs(title = str_c(cntry, "GDP per capita", sep = " "))

ggsave(filename = str_c("~/Home/NTRES6100 r note/data/", cntry, "_gdp_per_cap.png", sep = ""), plot = my_plot)

---

dir.create("figures")

cntry <- "Afghanistan"
country_list <- c("Albania", " Canada", "Spain")
#country_list <- unique(gapminder$country)
#length(country_list)

gap_europe <- gapminder %>% 
  filter(continent = "Europe") %>% 
  mutate(gdp_tot = gdp_per_cap * pop)

country_list <-  unique(gap_europe$country)

for (cntry in country_list) {
  gap_to_plot <- gapminder %>% 
    filter(country == cntry)
  
  my_plot <- ggplot(data = gap_to_plot, aes(x = year, y = gdp_per_cap)) +
    geom_point() +
    labs(title = str_c(cntry, "GDP per capita", sep = " "))
  
  ggsave(filename = str_c("~/Home/NTRES6100 r note/data/", cntry, "_gdp_per_cap.png", sep = ""), plot = my_plot)}

for (i in seq(10)) {
  print(str_c("Part_", i, sep = ""))
}
for (i in seq_len(10)) {
  print(str_c("Part_", i, sep = ""))
}

#for (i in 1:10)}