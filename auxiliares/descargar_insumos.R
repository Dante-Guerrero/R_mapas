#####################
#                   #
# DESCARGAR INSUMOS #
#                   #
#####################

library("googledrive")

googledrive::drive_auth(email = "sefa@oefa.pe")
drive_download("geometrias.zip", path="insumos/insumos.zip", overwrite = TRUE)
unzip("insumos/insumos.zip", exdir = "insumos")
file.remove("insumos/insumos.zip")
