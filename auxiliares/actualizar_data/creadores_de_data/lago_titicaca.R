## LAGO TITICACA

mx <- st_read("data/insumos/lago_titicaca/geo.shp")
mx_data <- select(as.data.frame(mx), DESCRIPCION = NOMBRE, PROVINCIA= PROVINCIA, DEPARTAMENTO = DPTO, PERIMETRO, SIGNACIONA, Shape_STAr, Shape_STLe)
mx_geom <- st_geometry(mx)
lago_titicaca <- st_sf(mx_data, geometry = mx_geom)
save(lago_titicaca, file = 'data/mapas/lago_titicaca.RData')