library(rgdal)
library(here)

filelist <- dir(path = here("Data", "Spatial"), pattern = ".shp")

filelist <- gsub(pattern = ".xml", replacement = "", filelist)
filelist <- gsub(pattern = ".shp", replacement = "", filelist)
filelist <- unique(filelist)

for(f in filelist){
  fn <- paste0(f, ".geojson")
  if(!file.exists(here("Data", "Spatial", fn))){
    shape <- readOGR(here("Data", "Spatial"),f, stringsAsFactors = FALSE)
    writeOGR(shape, here("Data", "Spatial", fn), layer=f, driver="GeoJSON",overwrite_layer=T)
  }
}


