## DEMARCACION PAIS

mx <- st_read("data/insumos/demarcacion/pais/geo.shp")
mx_data <- select(as.data.frame(mx), DESCRIPCION=FILE)
mx_geom <- st_geometry(mx)
demarcacion_pais <- st_sf(mx_data, geometry = mx_geom)

## DEMARCACION POR DEPARTAMENTO

mx <- st_read("data/insumos/demarcacion/departamentos/geo.shp")
mx_data <- select(as.data.frame(mx), DEPARTAMENTO=DEPARTAMEN, CAPITAL)
mx_geom <- st_geometry(mx)
demarcacion_departamentos <- st_sf(mx_data, geometry = mx_geom)

## DEMARCACION POR PROVINCIA

mx <- st_read("data/insumos/demarcacion/provincias/geo.shp")
mx_data <- select(as.data.frame(mx), DEPARTAMENTO=DEPARTAMEN, PROVINCIA, CAPITAL)
mx_geom <- st_geometry(mx)
demarcacion_provincias <- st_sf(mx_data, geometry = mx_geom)

## DEMARCACION POR DISTRITO

mx <- st_read("data/insumos/demarcacion/distritos/geo.shp")
mx_data <- select(as.data.frame(mx), DEPARTAMENTO = NOMBDEP, PROVINCIA= NOMBPROV, DISTRITO = NOMBDIST)
mx_geom <- st_geometry(mx)
demarcacion_distritos <- st_sf(mx_data, geometry = mx_geom)

## DEMARCACION

save(
  demarcacion_pais,
  demarcacion_departamentos,
  demarcacion_provincias,
  demarcacion_distritos,
  file = "data/mapas/demarcacion.RData"
)

rm(
  mx, 
  mx_data, 
  mx_geom,
  demarcacion_pais,
  demarcacion_departamentos,
  demarcacion_provincias,
  demarcacion_distritos
)
