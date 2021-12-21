## RIOS

carpeta <- 'rios'

for(i in departamentos){
  ubicacion_de_archivo <- gsub(" ", "", paste('data/insumos/', carpeta, '/', i, '/geo.shp'))
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

