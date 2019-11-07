

# 이용주

#####################################
#           map exercise 2          #
#####################################

library(ggmap)
library(dplyr)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

library_list <- read.csv("./data/지역별장애인도서관정보.csv")
library_list$주소

gc <- geocode(enc2utf8(as.character(library_list$주소)))
View(gc)
df <- data.frame(name=library[2], lon=gc$lon, lat=gc$lat )

cen <- c(mean(df$lon)-0.05,mean(df$lat)+0.02)
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=11,
                     size=c(640,640))
ggmap(map)+
  geom_point(data=gc, aes(x=lon, y=lat), alpha=0.8, size=5, color="red")+
  geom_text(data=df, aes(x=lon, y=lat, label=도서관명, vjust=0, hjust=0))

ggsave("./data/library.png")
