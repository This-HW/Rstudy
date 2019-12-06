

# 이용주

###########################################
#              Map exercise               #
###########################################


library(Kormaps)
DONG<-read.csv('./data/one.csv')
data(korpopmap3)
Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
korpopmap3@data<-korpopmap3@data#[c(67:81),]
korpopmap3@polygons<-korpopmap3@polygons#[c(67:81)]
korpopmap3@data$행정구역별_읍면동

korpopmap3@data$name<-gsub('·','',korpopmap3@data$name) 
colnames(DONG)<-c('district','name','일인가구')
DONG$district <- as.character(DONG$district)
dong<- DONG %>% filter( district =='강남구')

for(i in 1: length(korpopmap3)){
  # if()
}

korpopmap3@data<-merge(korpopmap3@data,dong, by.x='name',sort=FALSE, all=F)
korpopmap3@data<-merge(korpopmap3@polygons,dong, by.x='SP_ID',sort=FALSE, all=F)

View(korpopmap3@data)
View(korpopmap3@polygons)
name_list <- as.character(korpopmap3@data$SP_ID)

name_list

korpopmap3@polygons <- korpopmap3@polygons %>% filter(ID == name_list)

mymap <- korpopmap3@data
mypalette <- colorNumeric(palette ='RdYlBu' , domain = mymap$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',mymap$'일인가구')

map7 <- NULL
map7<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              smoothFactor = 0.2,
              fillOpacity = .8,
              popup = mypopup,
              color = ~mypalette(mymap$일인가구)) %>% 
  addLegend( values = ~mymap$일인가구,
             pal =mypalette ,
             title = '인구수',
             opacity = .1)
map7	

map7 <- NULL
map7<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              smoothFactor = 0.2,
              fillOpacity = .9,
              popup = mypopup,
              color = ~mypalette(mymap$일인가구)) %>% 
  addLegend( values = ~mymap$일인가구,
             pal =mypalette ,
             title = '인구수',
             opacity = 1)
map7	

