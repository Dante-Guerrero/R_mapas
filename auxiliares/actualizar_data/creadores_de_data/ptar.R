## PTAR

mx <- st_read("data/insumos/ptar/geo.shp")
print(mx)
names(mx)
head(mx)
dim(mx)

mx_data <- select(
  as.data.frame(mx), 
  NOMCCPP,
  
)
mx_geom <- st_geometry(mx)
volcanes <- st_sf(mx_data, geometry = mx_geom)
save(volcanes, file = 'data/mapas/volcanes.RData')