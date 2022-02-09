###################################
##-------------------------------##
#|                               |#
#| CARGAR MAPAS DESDE LOS .RDATA |#
#|                               |#
##-------------------------------##
###################################

######################
# CARGAR BIBLIOTECAS #
######################

source("auxiliares/bibliotecas.R")

#########################################
# CARGAR VARIABLES Y LISTAS RECURRENTES #
#########################################

source("auxiliares/variables_y_listas.R")

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
  'od' = demarcacion_od,
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

save(mapas, file = 'data/mapas.RData')

####################
# BORRAR VARIABLES #
####################

rm(list = ls())


