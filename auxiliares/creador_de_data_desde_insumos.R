#########################################
##-------------------------------------##
#|                                     |#
#| CREADOR DE .RDATA DESDE LOS INSUMOS |#
#|                                     |#
##-------------------------------------##
#########################################

######################
# CARGAR BIBLIOTECAS #
######################

source("auxiliares/bibliotecas.R")

#########################################
# CARGAR VARIABLES Y LISTAS RECURRENTES #
#########################################

source("auxiliares/variables_y_listas.R")

############################
# CORRER CREADORES_DE_DATA #
############################

source("auxiliares/creadores_de_data/demarcacion.R")
source("auxiliares/creadores_de_data/volcanes.R")
source("auxiliares/creadores_de_data/lagunas_glaciares.R")
source("auxiliares/creadores_de_data/lago_titicaca.R")
source("auxiliares/creadores_de_data/rios.R")
source("auxiliares/creadores_de_data/calles.R")
source("auxiliares/creadores_de_data/red_vial.R")

####################
# BORRAR VARIABLES #
####################

rm(list = ls())




