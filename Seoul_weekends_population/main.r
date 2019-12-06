library(Kormaps)
library(tmap)
library(raster)

p1 <- qtm(kormap2)
?qtm
kormap2@data

kormap1@data


tm_shape(korpopmap1) +
  tm_fill("총인구_명", thres.poly = 0) +
  tm_facets("name", free.coords=TRUE, drop.units = TRUE) +
  tm_layout(legend.show = FALSE, title.position = c("center", "center"), title.size = "AppleGothic")

tm_shape(korpopmap1) +
  tm_fill("총인구_명", thres.poly = 0) +
  tm_facets("name", free.coords=TRUE, drop.shapes=TRUE) +
  tm_layout(legend.show = FALSE, title.position = c("center", "center"), title.size = 2,fontfamily="AppleGothic")

