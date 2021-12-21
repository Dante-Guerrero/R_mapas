## LAGUNAS Y GLACIARES

mx <- st_read("insumos/lagunas_glaciares/geo.shp")
mx_data <- select(as.data.frame(mx), NOMBRE = nom_final, CUENCA = cuenca, CORDILLERA = cordillera, AREA_m2 = area_m2, anchomax, largomax, altitud, cod_lag, Shape_Leng, Shape_Area)
mx_geom <- st_geometry(mx)
lagunas_glaciares <- st_sf(mx_data, geometry = mx_geom)
save(lagunas_glaciares, file = 'data/mapas/lagunas_glaciares.RData')