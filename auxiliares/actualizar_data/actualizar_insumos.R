######################
#                    #
# ACTUALIZAR INSUMOS #
#                    #
######################

#####################################
# ELIMINAR INSUMOS.ZIP PREEXISTENTE #
#####################################

check = file.exists("data/insumos/insumos.zip")

if(check == TRUE){
  file.remove("data/insumos/insumos.zip")
}

######################################################
# GENERAR ARCHIVO ZIP CON DOCUMENTOS EN DATA/INSUMOS #
######################################################

main_directory <-  getwd()
setwd("data/insumos")
files2zip <- dir(full.names = TRUE)
zip(zipfile = "insumos.zip", files = files2zip)
setwd(main_directory)

###############################################################
# ELIMINAR ARCHIVO ANTERIOR EN GOOGLE DRIVE Y CARGAR EL NUEVO #
###############################################################

library("googledrive")
googledrive::drive_auth(email = "sefa@oefa.pe")

drive_rm("Shapefiles/geometrias.zip")

geometrias <- drive_upload(
  "data/insumos/insumos.zip",
  "Shapefiles/geometrias.zip"
  )

######################
# ELIMINAR ZIP LOCAL #
######################

file.remove("data/insumos/insumos.zip")

####################
# BORRAR VARIABLES #
####################

rm(list = ls())









