library(tidyverse)
install.packages("readxl")
library(readxl)
install.packages("googlesheets4")
library(googlesheets4)
install.packages("janitor")
library(janitor)

lotr <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv")

write_csv(lotr, file = "data/lotr.csv")

lotr_disk <- read_csv("./data/lotr.csv", skip = 1)
lotr_disk <- read_csv("./data/lotr.csv", comment = "#")
lotr_disk <- read_csv("./data/lotr.csv", comment = "#", na = c("NA"), col_types = cols(Words = col_integer()))
lotr_disk <- read_csv("./data/lotr.csv", col_names= FALSE)

lotr_disk
problems(lotr_disk)

lotr_disk %>% 
  mutate(Words = parse_integer(Words))

#lotr_xl <- read_xlsx("data/LOTR.xlsx, sheet = "FOTR")

gs4_deauth()

#lotr_gs <- read_sheet("https://docs.google.com/spreadsheets/d/1X98JobRtA3JGBFacs_JSjiX-4DPQ0vZYtNl_ozqF6IE/edit#gid=754443596")

parse_double("1.23")
parse_double("1,23", locale = locale(decimal_mark = ","))
parse_number("123.456.224", locale = locale(grouping_mark = "."))
parse_number("$100")
parse_number("20%")
parse_number("It cost $123.45")
parse_number("$123,456,789")
parse_number("123.456.789", locale = locale(grouping_mark = "."))
parse_number("123'456'789", locale = locale(grouping_mark = "'"))
parse_number("It costs $20")

mess = read_tsv("https://raw.githubusercontent.com/nt246/NTRES6940-data-science/master/datasets/messy_data.tsv", locale = locale(decimal_mark = ","))

mess %>% 
  mutate(price = parse_number(price))

