

# 이용주

###########################################
#              Map exercise               #
###########################################





library(Kormaps)
library(leaflet)
library(dplyr)
library(ggmap)


DONG<-read.csv('data/one.csv')
data(korpopmap3)
Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
gangnam_dong <- c('개포1동', '개포2동', '개포4동', '논현1동',
                  '논현2동', '대치1동', '대치2동', '대치4동',
                  '도곡1동', '도곡2동', '삼성1동', '삼성2동',
                  '세곡동', '수서동', '신사동', '압구정동',
                  '역삼1동', '역삼2동', '일원1동',
                  '일원2동', '일원본동', '청담동')

#강남의 동들의 행번호를 찾고 그것을 이용하여 다시 subseting
gangnam_num <- NULL
for (i in 1:length(gangnam_dong)){
  x <- which(korpopmap3@data$name==gangnam_dong[i])
  gangnam_num <- append(gangnam_num,x)
  
}
korpopmap3@data<-korpopmap3@data[gangnam_num,]
korpopmap3@polygons<-korpopmap3@polygons[gangnam_num]

#신사동이 2개이므로 강남구가 아닌 신사동을 제거
korpopmap3@data<-korpopmap3@data[-15,]
korpopmap3@polygons<-korpopmap3@polygons[-15]


colnames(DONG)<-c('구별','name','일인가구')
dong<- DONG %>%filter(구별=='강남구')

korpopmap3@data<-merge(korpopmap3@data,dong,by.x='name',sort=FALSE)
mymap <- korpopmap3@data
mypalette <- colorNumeric(palette ='RdYlBu' , domain = mymap$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',mymap$'일인가구')

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
seoul_lonlat <- geocode("서울특별시 강남구")

map7 <- NULL
map7<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=seoul_lonlat$lat-0.02, lng=seoul_lonlat$lon+0.02, zoom=12) %>%
  addPolygons(stroke =FALSE,
              smoothFactor = 1,
              fillOpacity = .9,
              popup = mypopup,
              color = ~mypalette(mymap$일인가구)) %>% 
  addLegend( values = ~mymap$일인가구,
             pal =mypalette ,
             title = '인구수',
             opacity = 1)
map7	
saveWidget(map7, file="oneMap.html")


