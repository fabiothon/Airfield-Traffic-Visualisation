# Libraries ----
library(readxl)
library(leaflet)
library(leaflet.extras)
library(dplyr)

# Data-Input ----
airport_data <- read_excel("/Users/fabiothon/Desktop/Code/flight_data.xlsx")
head(airport_data)

small_airfields <- airport_data %>%
  filter(type == "Flugfelder")

mid_airfields <- airport_data %>%
  filter(type == "Regionalflughäfen")

big_airfields <- airport_data %>%
  filter(type == "Landesflughäfen")

small_mid_airfields <- airport_data %>%
  filter(type %in% c("Flugfelder", "Regionalflughäfen"))

# Heatmap ---- 
small_mid_airfields %>%
  leaflet() %>%
  addTiles() %>%
  addHeatmap(lng = ~long, lat = ~lat, blur = 40, max = 30, radius = 40, 
             intensity = ~flights)

