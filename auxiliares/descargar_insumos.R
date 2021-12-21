#####################
#                   #
# DESCARGAR INSUMOS #
#                   #
#####################

library("googledrive")

check = file.exists("data/insumos")

if(check == FALSE){
  dir.create("data/insumos")
}

googledrive::drive_auth(email = "sefa@oefa.pe")

drive_download("geometrias.zip", path="data/insumos/insumos.zip", overwrite = TRUE)
unzip("data/insumos/insumos.zip", exdir = "data/insumos")
file.remove("data/insumos/insumos.zip")

####################
# BORRAR VARIABLES #
####################

rm(list = ls())

# Nota: Los documentos que se descargan de Google Drive fueron obtenidos de la siguiente URL: https://www.geogpsperu.com/p/descargas.html
