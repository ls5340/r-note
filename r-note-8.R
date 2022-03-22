calc_shrub_vol <- function(length, width, height) {
  area <- length * width
  volume <- area * height
  return(volume)
  #print(volume)
}

#calc_shrub_vol(width=1.6, length=0.8, height=2.0)
calc_shrub_vol(0.8,1.6,2.0)

calc_shrub_vol <- function(length, width, height) {
  area <- length * width
  area * height
  #print(volume)
}

calc_shrub_vol(0.8,1.6,2.0)
#calc_shrub_vol(width=1.6, length=0.8, height=2.0)

convert_pounds_to_grams <- function(pounds) {
  grams <-  453.6 * pounds
  return(grams)
}
convert_pounds_to_grams(c(1,2,3))

shrub_measurements <- read_tsv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/main/datasets/shrub_dimensions.txt")
problems(shrub_measurements)

shrub_measurements %>% 
  mutate (grams = convert_pounds_to_grams(pounds))

calc_shrub_vol <- function(length, width, height=1) {
  area <- length * width
  volume <- area * height
  return(volume) 
  #print(volume)
}
calc_shrub_vol(0.8,1.6)
calc_shrub_vol(0.8,1.6,2.0)

calc_shrub_mass <- function(volume) {
  mass <-  2.65 * volume^0.9
  return(mass)
}

  shrub_volume <- calc_shrub_vol(0.8, 1.6, 2.0)
  shrub_mass <- calc_shrub_mass(shrub_volume)


calc_shrub_vol(0.8,1.6,2.0) %>% 
  calc_shrub_mass()

shrub_mass <- calc_shrub_mass(calc_shrub_vol(0.8, 1.6, 2.0))

# gapminder ---------------------------------------------------------------
