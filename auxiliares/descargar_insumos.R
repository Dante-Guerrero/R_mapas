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

# Nota: Los documentos que se descargan de Google Drive fueron obtenidos de la siguiente URL: https://www.geogpsperu.com/p/descargas.html
