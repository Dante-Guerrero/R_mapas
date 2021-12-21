##################
##              ##
##   RED VIAL   ##
##              ##
##################

# RED VIAL NACIONAL

# LINEAS

mx <- st_read("data/insumos/red_vial/red_vial_nacional/lineas/geo.shp")
mx_data <- select(
  as.data.frame(mx),
  RUTA = cCodRuta,
  LONGITUD = dLongitud,
  SENTIDO = cSentido,
  SENTIDO2 = Sentido,
  SUPERFICIE = cSuperfici,
  RST_LBL,
  DEPARTAMENTO = NOMBDEP,
  PROVINCIA = NOMBPROV,
  DISTRITO = NOMBDIST
)
mx_geom <- st_geometry(mx)
red_vial_nacional_lineas <- st_sf(mx_data, geometry = mx_geom)

# PUNTOS

mx <- st_read("data/insumos/red_vial/red_vial_nacional/puntos/geo.shp")
mx_data <- select(
  as.data.frame(mx),
  COD_RUTA,
  NOMB_POB,
  DEPARTAMENTO = NOMBDEP,
  PROVINCIA = NOMBPROV,
  DISTRITO = NOMBDIST
)
mx_geom <- st_geometry(mx)
red_vial_nacional_puntos <- st_sf(mx_data, geometry = mx_geom)

# Grabar .RData

save(
  red_vial_nacional_lineas,
  red_vial_nacional_puntos,
  file = 'data/mapas/red_vial_nacional.RData'
)

## RED VIAL DEPARTAMENTAL

# LINEAS

mx <- st_read("data/insumos/red_vial/red_vial_departamental/lineas/geo.shp")
mx_data <- select(
  as.data.frame(mx),
  COD_DS11,
  COD_DS12,
  TRAY_DS12,
  TRAY_DS11,
  DEPARTAMENTO = DEP,
  PROVINCIA = PROV,
  LONGITUD = LONG_KM
)
mx_geom <- st_geometry(mx)
red_vial_departamental_lineas <- st_sf(mx_data, geometry = mx_geom)

separados <- split(red_vial_departamental_lineas, f = red_vial_departamental_lineas$DEPARTAMENTO)

carpeta <- 'red_vial_departamental_lineas'

amazonas <- separados$AMAZONAS
ancash <- separados$ANCASH
apurimac <- separados$APURIMAC
arequipa <- separados$AREQUIPA
ayacucho <- separados$AYACUCHO
cajamarca <- separados$CAJAMARCA
cusco <- separados$CUSCO
huancavelica <- separados$HUANCAVELICA
huanuco <- separados$HUANUCO
ica <- separados$ICA
junin <- separados$JUNIN
lalibertad <- separados$`LA LIBERTAD`
lambayeque <- separados$LAMBAYEQUE
lima <- separados$LIMA
loreto <- separados$LORETO
madrededios <- separados$`MADRE DE DIOS`
moquegua <- separados$MOQUEGUA
pasco <- separados$PASCO
piura <- separados$PIURA
puno <- separados$PUNO
sanmartin <- separados$`SAN MARTIN`
tacna <- separados$TACNA
tumbes <- separados$TUMBES
ucayali <- separados$UCAYALI

save(amazonas, file = gsub(" ", "", paste('data/mapas/', carpeta, '/amazonas.RData')))
save(ancash, file = gsub(" ", "", paste('data/mapas/', carpeta, '/ancash.RData')))
save(apurimac, file = gsub(" ", "", paste('data/mapas/', carpeta, '/apurimac.RData')))
save(arequipa, file = gsub(" ", "", paste('data/mapas/', carpeta, '/arequipa.RData')))
save(ayacucho, file = gsub(" ", "", paste('data/mapas/', carpeta, '/ayacucho.RData')))
save(cajamarca, file = gsub(" ", "", paste('data/mapas/', carpeta, '/cajamarca.RData')))
save(cusco, file = gsub(" ", "", paste('data/mapas/', carpeta, '/cusco.RData')))
save(huancavelica, file = gsub(" ", "", paste('data/mapas/', carpeta, '/huancavelica.RData')))
save(huanuco, file = gsub(" ", "", paste('data/mapas/', carpeta, '/huanuco.RData')))
save(ica, file = gsub(" ", "", paste('data/mapas/', carpeta, '/ica.RData')))
save(junin, file = gsub(" ", "", paste('data/mapas/', carpeta, '/junin.RData')))
save(lalibertad, file = gsub(" ", "", paste('data/mapas/', carpeta, '/lalibertad.RData')))
save(lambayeque, file = gsub(" ", "", paste('data/mapas/', carpeta, '/lambayeque.RData')))
save(lima, file = gsub(" ", "", paste('data/mapas/', carpeta, '/lima.RData')))
save(loreto, file = gsub(" ", "", paste('data/mapas/', carpeta, '/loreto.RData')))
save(madrededios, file = gsub(" ", "", paste('data/mapas/', carpeta, '/madrededios.RData')))
save(moquegua, file = gsub(" ", "", paste('data/mapas/', carpeta, '/moquegua.RData')))
save(pasco, file = gsub(" ", "", paste('data/mapas/', carpeta, '/pasco.RData')))
save(piura, file = gsub(" ", "", paste('data/mapas/', carpeta, '/piura.RData')))
save(puno, file = gsub(" ", "", paste('data/mapas/', carpeta, '/puno.RData')))
save(sanmartin, file = gsub(" ", "", paste('data/mapas/', carpeta, '/sanmartin.RData')))
save(tacna, file = gsub(" ", "", paste('data/mapas/', carpeta, '/tacna.RData')))
save(tumbes, file = gsub(" ", "", paste('data/mapas/', carpeta, '/tumbes.RData')))
save(ucayali, file = gsub(" ", "", paste('data/mapas/', carpeta, '/ucayali.RData')))

# PUNTOS

mx <- st_read("data/insumos/red_vial/red_vial_departamental/puntos/geo.shp")
mx_data <- select(
  as.data.frame(mx),
  COD_RUTA,
  POSICION,
  PUNTO,
  TIPO,
  DEPARTAMENTO = DEP,
  PROVINCIA = PROV,
  DISTRITO = DIST
)
mx_geom <- st_geometry(mx)
red_vial_departamental_puntos <- st_sf(mx_data, geometry = mx_geom)

# Grabar .RData

save(red_vial_departamental_puntos, file = 'data/mapas/red_vial_departamental_puntos.RData')

## RED VIAL VECINAL

# LINEAS

mx <- st_read("data/insumos/red_vial/red_vial_vecinal/lineas/geo.shp")
mx_data <- select(
  as.data.frame(mx),
  COD_DS11,
  COD_DS12,
  TRAY_DS12,
  TRAY_DS11,
  DEPARTAMENTO = DEP,
  PROVINCIA = PROV,
  LONGITUD = LONG_KM
)
mx_geom <- st_geometry(mx)
red_vial_vecinal_lineas <- st_sf(mx_data, geometry = mx_geom)

separados <- split(red_vial_vecinal_lineas, f = red_vial_vecinal_lineas$DEPARTAMENTO)

carpeta <- 'red_vial_vecinal_lineas'

amazonas <- separados$AMAZONAS
ancash <- separados$ANCASH
apurimac <- separados$APURIMAC
arequipa <- separados$AREQUIPA
ayacucho <- separados$AYACUCHO
cajamarca <- separados$CAJAMARCA
cusco <- separados$CUSCO
huancavelica <- separados$HUANCAVELICA
huanuco <- separados$HUANUCO
ica <- separados$ICA
junin <- separados$JUNIN
lalibertad <- separados$`LA LIBERTAD`
lambayeque <- separados$LAMBAYEQUE
lima <- separados$LIMA
loreto <- separados$LORETO
madrededios <- separados$`MADRE DE DIOS`
moquegua <- separados$MOQUEGUA
pasco <- separados$PASCO
piura <- separados$PIURA
puno <- separados$PUNO
sanmartin <- separados$`SAN MARTIN`
tacna <- separados$TACNA
tumbes <- separados$TUMBES
ucayali <- separados$UCAYALI

save(amazonas, file = gsub(" ", "", paste('data/mapas/', carpeta, '/amazonas.RData')))
save(ancash, file = gsub(" ", "", paste('data/mapas/', carpeta, '/ancash.RData')))
save(apurimac, file = gsub(" ", "", paste('data/mapas/', carpeta, '/apurimac.RData')))
save(arequipa, file = gsub(" ", "", paste('data/mapas/', carpeta, '/arequipa.RData')))
save(ayacucho, file = gsub(" ", "", paste('data/mapas/', carpeta, '/ayacucho.RData')))
save(cajamarca, file = gsub(" ", "", paste('data/mapas/', carpeta, '/cajamarca.RData')))
save(cusco, file = gsub(" ", "", paste('data/mapas/', carpeta, '/cusco.RData')))
save(huancavelica, file = gsub(" ", "", paste('data/mapas/', carpeta, '/huancavelica.RData')))
save(huanuco, file = gsub(" ", "", paste('data/mapas/', carpeta, '/huanuco.RData')))
save(ica, file = gsub(" ", "", paste('data/mapas/', carpeta, '/ica.RData')))
save(junin, file = gsub(" ", "", paste('data/mapas/', carpeta, '/junin.RData')))
save(lalibertad, file = gsub(" ", "", paste('data/mapas/', carpeta, '/lalibertad.RData')))
save(lambayeque, file = gsub(" ", "", paste('data/mapas/', carpeta, '/lambayeque.RData')))
save(lima, file = gsub(" ", "", paste('data/mapas/', carpeta, '/lima.RData')))
save(loreto, file = gsub(" ", "", paste('data/mapas/', carpeta, '/loreto.RData')))
save(madrededios, file = gsub(" ", "", paste('data/mapas/', carpeta, '/madrededios.RData')))
save(moquegua, file = gsub(" ", "", paste('data/mapas/', carpeta, '/moquegua.RData')))
save(pasco, file = gsub(" ", "", paste('data/mapas/', carpeta, '/pasco.RData')))
save(piura, file = gsub(" ", "", paste('data/mapas/', carpeta, '/piura.RData')))
save(puno, file = gsub(" ", "", paste('data/mapas/', carpeta, '/puno.RData')))
save(sanmartin, file = gsub(" ", "", paste('data/mapas/', carpeta, '/sanmartin.RData')))
save(tacna, file = gsub(" ", "", paste('data/mapas/', carpeta, '/tacna.RData')))
save(tumbes, file = gsub(" ", "", paste('data/mapas/', carpeta, '/tumbes.RData')))
save(ucayali, file = gsub(" ", "", paste('data/mapas/', carpeta, '/ucayali.RData')))

# PUNTOS

mx <- st_read("data/insumos/red_vial/red_vial_vecinal/puntos/geo.shp")
mx_data <- select(
  as.data.frame(mx),
  COD_RUTA,
  POSICION,
  PUNTO,
  TIPO,
  DEPARTAMENTO = DEP,
  PROVINCIA = PROV,
  DISTRITO = DIST
)
mx_geom <- st_geometry(mx)
red_vial_vecinal_puntos <- st_sf(mx_data, geometry = mx_geom)

# Grabar .RData

save(
  red_vial_vecinal_puntos,
  file = 'data/mapas/red_vial_vecinal_puntos.RData'
)

## TROCHAS

mx <- st_read("data/insumos/red_vial/trochas/geo.shp")
mx_data <- select(
  as.data.frame(mx),
  ESTADO = estado,
  DESCRIPCION = descrip,
  Shape_leng = shape_leng,
  St_length = st_length_,
  Shape_Le_1
)
mx_geom <- st_geometry(mx)
red_vial_trochas <- st_sf(mx_data, geometry = mx_geom)

save(red_vial_trochas, file = 'data/mapas/red_vial_trochas.RData')
