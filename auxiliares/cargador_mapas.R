###############
# BIBLIOTECAS #
###############

library(sf)
library(dplyr)
library(Hmisc)

##########################
# LISTA DE DEPARTAMENTOS #
##########################

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

######################
# CARGAR DEMARCACION #
######################

load('data/mapas/demarcacion.RData')

###############
# CARGAR RIOS #
###############

lista <- list()

for(i in departamentos){
  carpeta <- 'rios'
  ubicacion_de_archivo <- gsub(" ", "", paste('data/mapas/',carpeta, '/', i, '.RData'))
  load(ubicacion_de_archivo)
  data <- get(i)
  lista[[i]] <- data
}

rios <- dplyr::bind_rows(lista)

##########
# CALLES #
##########

lista <- list()

for(i in departamentos){
  carpeta <- 'calles'
  ubicacion_de_archivo <- gsub(" ", "", paste('data/mapas/',carpeta, '/', i, '.RData'))
  load(ubicacion_de_archivo)
  data <- get(i)
  lista[[i]] <- data
}

calles <- dplyr::bind_rows(lista)

#########
# OTROS #
#########

lista <- list()

for(i in departamentos){
  carpeta <- 'red_vial_vecinal_lineas'
  ubicacion_de_archivo <- gsub(" ", "", paste('data/mapas/',carpeta, '/', i, '.RData'))
  load(ubicacion_de_archivo)
  data <- get(i)
  lista[[i]] <- data
}

red_vial_vecinal_lineas <- dplyr::bind_rows(lista)

lista <- list()

for(i in departamentos){
  carpeta <- 'red_vial_departamental_lineas'
  ubicacion_de_archivo <- gsub(" ", "", paste('data/mapas/',carpeta, '/', i, '.RData'))
  load(ubicacion_de_archivo)
  data <- get(i)
  lista[[i]] <- data
}

red_vial_departamental_lineas <- dplyr::bind_rows(lista)


load('data/mapas/volcanes.RData')
load('data/mapas/red_vial_vecinal_puntos.RData')
load('data/mapas/red_vial_trochas.RData')
load('data/mapas/red_vial_nacional.RData')
load('data/mapas/red_vial_departamental_puntos.RData')
load('data/mapas/lagunas_glaciares.RData')
load('data/mapas/lago_titicaca.RData')

#################
# GENERAR LISTA #
#################

mapas <- list(
  'peru' = demarcacion_pais,
  'departamentos' = demarcacion_departamentos,
  'provincias' = demarcacion_provincias,
  'distritos' = demarcacion_distritos,
  'volcanes' = volcanes,
  'rios' = rios,
  'lagunas_glaciares' = lagunas_glaciares,
  'lago_titicaca' = lago_titicaca,
  'calles' = calles,
  'red_vial_nacional_lineas' = red_vial_nacional_lineas,
  'red_vial_nacional_puntos' = red_vial_nacional_puntos,
  'red_vial_departamental_lineas' = red_vial_departamental_lineas,
  'red_vial_departamental_puntos' = red_vial_departamental_puntos,
  'red_vial_vecinal_lineas' = red_vial_vecinal_lineas,
  'red_vial_vecinal_puntos' = red_vial_vecinal_puntos,
  'red_vial_trochas' = red_vial_trochas
)

######################
# ELIMINAR VARIABLES #
######################

rm(
  data,
  lista,
  carpeta,
  departamentos,
  i,
  ubicacion_de_archivo,
  amazonas,
  ancash,
  apurimac,
  arequipa,
  ayacucho,
  cajamarca,
  cusco,
  huancavelica,
  huanuco,
  ica,
  junin,
  lalibertad,
  lambayeque,
  lima,
  loreto,
  madrededios,
  moquegua,
  pasco,
  piura,
  puno,
  sanmartin,
  tacna,
  tumbes,
  ucayali,
  demarcacion_pais,
  demarcacion_departamentos,
  demarcacion_provincias,
  demarcacion_distritos,
  rios,
  lagunas_glaciares,
  lago_titicaca,
  calles,
  red_vial_nacional_lineas,
  red_vial_nacional_puntos,
  red_vial_departamental_lineas,
  red_vial_departamental_puntos,
  red_vial_vecinal_lineas,
  red_vial_vecinal_puntos,
  red_vial_trochas,
  volcanes
)

