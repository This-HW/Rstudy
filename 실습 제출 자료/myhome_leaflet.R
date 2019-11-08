# install.packages("leaflet")
library(leaflet)
library(ggmap)
library(htmlwidgets)


register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
lonlat <- geocode("뚝섬역")

msg <- '<strong><a href="hppt://naver.com" style="text-decoration:none" >YJ Hoome</a></strong><hr>취준생이 살고있는 곳'
home <- leaflet() %>% setView(lng = lonlat$lon, lat = lonlat$lat, zoom = 16) %>% addTiles() %>% addCircles(lng = lonlat$lon, lat = lonlat$lat, color='green', popup = msg )
home

saveWidget(home, "mymap.html")
