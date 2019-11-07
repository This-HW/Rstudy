

# 이용주

#####################################
#           map exercise 1          #
#####################################

library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

lon <- 127.047420
lat <- 37.547169
cen <- c(lon,lat)
mk <- data.frame(lon=lon, lat=lat)

sec <- substr(Sys.time(),18,19);sec
if(sec <=14){
  type<-"terrain"
  }else if(sec >14 & sec<=29){
    type <- "satellite"
    } else if((29<sec) & (sec<=44)){
      type <- "roadmap"
      }else {type <- "hybrid"}

map <- get_googlemap(center = cen , maptype=type,zoom=15, marker=mk)
ggmap(map)
ggsave("./data/mymap.png")




