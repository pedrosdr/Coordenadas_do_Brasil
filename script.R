library(leaflet)
library(dplyr)

data = read.csv('coordenadas.csv', sep = ',', encoding = 'utf-8')
s = data %>% filter(municipio %in% c('LORENA', 'SÃO PAULO', 'RIBEIRÃO PRETO', 'BELO HORIZONTE'))

map <- leaflet() %>%
  addTiles() %>%
  setView(lng = -47.80548, lat = -21.184835, zoom = 4)
  
for(i in 1:nrow(s)) {
  map = map %>%
    addMarkers(
      lat = s$latitude[i], lng = s$longitude[i],
      popup = s$municipio[i]
    )
}

map


