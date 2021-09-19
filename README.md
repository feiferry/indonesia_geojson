# indonesia_geojson_shp

## Indonesia geojson and shape file
The maps here contains several levels administrative border:
- Village (Desa/Kelurahan)
- Sub District (Kecamatan)
- District (Kota/Kabupaten)
- Province (Propinsi)


## Peta wilayah Indonesia dalam format geojson dan .shp file
Peta ini terdiri atas beberapa tingkat wilayah:
- Desa / Kelurahan (village)
- Kecamatan (Sub-district)
- Kota / Kabupate (District)
- Propinsi (Province)

### code and plot sample

```r
library(geojsonio)
library(sf)
library(tidyverse)

indonesia_shp <- read_sf("geojson_shp_desa/indonesia_village.geojson", type = 4)

jawa_shp <- indonesia_shp %>% filter(province == "DKI JAKARTA" | province == "JAWA BARAT" | province == "JAWA TENGAH")

plot_village = ggplot(jawa_shp, aes(geometry = geometry, label = village)) + 
  geom_sf() + 
  coord_sf(ylim = c( -7.5873038, -5.9673038), xlim = c(106.7848745, 110.4848745)) +
  theme_bw()

plot_village %>%  ggsave("plot_samples/image/indonesia_village.png", width = 2048, height = 1080, units = "px")
```

![village plot](plot_samples/images/indonesia_village.png)


