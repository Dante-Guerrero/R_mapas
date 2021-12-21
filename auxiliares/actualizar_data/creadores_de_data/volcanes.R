## VOLCANES

mx <- st_read("data/insumos/volcanes/geo.shp")
mx_data <- select(
  as.data.frame(mx), 
  NOMBRE,
  CODIGO,
  CATEGORIA,
  TIPO,
  EDAD,
  DEPARTAMENTO = DEPARTAMEN,
  CUADRANGUL,
  ALTITUD,
  ELEVACION,
  DEPOSITO,
  CONO,
  CRATER,
  FLUJO,
  VOLUMEN,
  DESCRIPCION = DESCRIPCIO
)
mx_geom <- st_geometry(mx)
volcanes <- st_sf(mx_data, geometry = mx_geom)
save(volcanes, file = 'data/mapas/volcanes.RData')