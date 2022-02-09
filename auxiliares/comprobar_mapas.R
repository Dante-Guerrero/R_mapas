#####################################
##---------------------------------##
#|                                 |#
#| COMPROBAR SI MAPAS.RDATA EXISTE |#
#|                                 |#
##---------------------------------##
#####################################

check = file.exists("data/mapas.RData")

if(check == FALSE){
  source("auxiliares/cargador_mapas.R")
}
rm(list = ls())

load('data/mapas.RData')

