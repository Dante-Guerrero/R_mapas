#########################################
##-------------------------------------##
#|                                     |#
#| CREADOR DE .RDATA DESDE LOS INSUMOS |#
#|                                     |#
##-------------------------------------##
#########################################

## BIBLIOTECAS

library(sf)
library(dplyr)
library(Hmisc)

## LISTA DE DEPARTAMENTOS

departamentos <- c(
  'amazonas',
  'ancash',
  'apurimac',
  'arequipa',
  'ayacucho',
  'cajamarca',
  'cusco',
  'huancavelica',
  'huanuco',
  'ica',
  'junin',
  'lalibertad',
  'lambayeque',
  'lima',
  'loreto',
  'madrededios',
  'moquegua',
  'pasco',
  'piura',
  'puno',
  'sanmartin',
  'tacna',
  'tumbes',
  'ucayali'
)

source("auxiliares/creadores_de_data/demarcacion.R")

## VOLCANES

mx <- st_read("insumos/volcanes/geo.shp")
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

## LAGUNAS Y GLACIARES

mx <- st_read("insumos/lagunas_glaciares/geo.shp")
mx_data <- select(as.data.frame(mx), NOMBRE = nom_final, CUENCA = cuenca, CORDILLERA = cordillera, AREA_m2 = area_m2, anchomax, largomax, altitud, cod_lag, Shape_Leng, Shape_Area)
mx_geom <- st_geometry(mx)
lagunas_glaciares <- st_sf(mx_data, geometry = mx_geom)
save(lagunas_glaciares, file = 'data/mapas/lagunas_glaciares.RData')

## LAGO TITICACA

mx <- st_read("insumos/lago_titicaca/geo.shp")
mx_data <- select(as.data.frame(mx), DESCRIPCION = NOMBRE, PROVINCIA= PROVINCIA, DEPARTAMENTO = DPTO, PERIMETRO, SIGNACIONA, Shape_STAr, Shape_STLe)
mx_geom <- st_geometry(mx)
lago_titicaca <- st_sf(mx_data, geometry = mx_geom)
save(lago_titicaca, file = 'data/mapas/lago_titicaca.RData')

## RIOS

carpeta <- 'rios'

for(i in departamentos){
  ubicacion_de_archivo <- gsub(" ", "", paste('insumos/', carpeta, '/', i, '/geo.shp'))
  mx <- st_read(ubicacion_de_archivo)
  mx_data <- select(
    as.data.frame(mx), 
    ID = OBJECTID,
    NOMBRE, 
    TIPO=Tipo, 
    DEPARTAMENTO=NOMDEP, 
    PROVINCIA=NOMPROV, 
    DISTRITO=NOMDIST, 
    Shape_STLe, 
    Shape_Leng
  )
  mx_geom <- st_geometry(mx)
  mx <- st_sf(mx_data, geometry = mx_geom)
  assign(i, mx)
}

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

## CALLES

carpeta <- 'calles'

for(i in departamentos){
  ubicacion_de_archivo <- gsub(" ", "", paste('insumos/', carpeta, '/', i, '/geo.shp'))
  mx <- st_read(ubicacion_de_archivo)
  mx_data <- select(
    as.data.frame(mx), 
    ID=IDCCPP,
    NOMBRE_CCPP=NOM_CCPP,
    VIA=NOM_VIA_C,
    CATEGORIA_VIA=CATVIAL_C,
    DEPARTAMENTO=NOM_DPTO, 
    PROVINCIA=NOM_PROV, 
    DISTRITO=NOM_DIST, 
    Shape_Leng
  )
  mx_geom <- st_geometry(mx)
  mx <- st_sf(mx_data, geometry = mx_geom)
  assign(i, mx)
}

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

## RED VIAL 

# RED VIAL NACIONAL

# LINEAS

mx <- st_read("insumos/red_vial/red_vial_nacional/lineas/geo.shp")
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

mx <- st_read("insumos/red_vial/red_vial_nacional/puntos/geo.shp")
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

mx <- st_read("insumos/red_vial/red_vial_departamental/lineas/geo.shp")
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

mx <- st_read("insumos/red_vial/red_vial_departamental/puntos/geo.shp")
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

mx <- st_read("insumos/red_vial/red_vial_vecinal/lineas/geo.shp")
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

mx <- st_read("insumos/red_vial/red_vial_vecinal/puntos/geo.shp")
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

mx <- st_read("insumos/red_vial/trochas/geo.shp")
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

####################
# BORRAR VARIABLES #
####################

rm(list = ls())




