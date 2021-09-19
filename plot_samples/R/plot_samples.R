library(geojsonio)
library(sf)
library(tidyverse)
sf::sf_use_s2(FALSE)

indonesia_shp <- read_sf("geojson_shp_desa/indonesia_village.geojson", type = 4)

jawa_shp <- indonesia_shp %>% filter(province == "DKI JAKARTA" | province == "JAWA BARAT" | province == "JAWA TENGAH")

plot_village = ggplot(jawa_shp, aes(geometry = geometry, label = village)) + 
  geom_sf() + 
  coord_sf(ylim = c( -7.5873038, -5.9673038), xlim = c(106.7848745, 110.4848745)) +
  theme_bw()

ggsave(filename = "plot_samples/images/indonesia_village.png", plot = plot_village, width = 20, height = 10, units = "in", dpi = 300)



indonesia_kabupaten_shp <- read_sf("geojson_shp_kota_kabupaten/indonesia_kabupaten.geojson", type = 4)

jawa_shp <- indonesia_kabupaten_shp %>% filter(province == "DKI JAKARTA" | province == "JAWA BARAT" | province == "JAWA TENGAH")

plot_district = ggplot(jawa_shp, aes(geometry = geometry, label = district)) + 
  geom_sf() + 
  coord_sf(ylim = c( -7.5873038, -5.9673038), xlim = c(106.7848745, 110.4848745)) +
  theme_bw()

ggsave(filename = "plot_samples/images/indonesia_kabupaten.png", plot = plot_district, width = 20, height = 10, units = "in", dpi = 300)




library(jsonlite)
library(echarts4r)

json_propinsi <- jsonlite::read_json("https://github.com/feiferry/indonesia_geojson/raw/main/geojson_shp_provinsi/indonesia_province.geojson")
indonesia_propinsi_data <- read.csv("plot_samples/R/data_propinsi.csv")

indonesia_propinsi_data |>
  e_charts(province) |>
  e_map_register("propinsi_indonesia", json_propinsi) |>
  e_map(value, map = "propinsi_indonesia") |> 
  e_visual_map(value)
