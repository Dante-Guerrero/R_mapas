# R_mapas

Auxiliar para trabajar con mapas.

## Estructura del repositorio (completo)

```markdown
R_mapas
.
+-- auxiliares
|   +-- actualizar_data
|   |    +-- creadores_de_data
|   |    |   +-- calles.R
|   |    |   +-- demarcacion.R
|   |    |   +-- lago_titicaca.R
|   |    |   +-- lagunas_glaciares.R
|   |    |   +-- ptar.R
|   |    |   +-- red_vial.R
|   |    |   +-- rios.R
|   |    |   +-- volcanes.R
|   |    |
|   |    +-- actualizar_insumos.R
|   |    +-- creador_de_data_desde_insumos.R
|   |    +-- descargar_insumos.R
|   |
|   +-- bibliotecas.R
|   +-- cargador_mapas.R
|   +-- comprobar_mapas.R
|   +-- variables_y_listas.R
|
+-- data
|   +-- insumos
|   |   +-- america_del_sur
|   |   +-- anp
|   |   +-- bosques_de_produccion_permanente
|   |   +-- calles
|   |   +-- demarcacion
|   |   +-- lago_titicaca
|   |   +-- lagunas_glaciares
|   |   +-- mundo
|   |   +-- oefa_od
|   |   +-- ptar
|   |   +-- red_vial
|   |   +-- rios
|   |   +-- volcanes
|   |
|   +-- mapas
|   |   +-- calles
|   |   |   +-- amazonas.RData 
|   |   |   +-- ancash.RData
|   |   |   +-- apurimac.RData
|   |   |   +-- arequipa.RData
|   |   |   +-- ayacucho.RData
|   |   |   +-- cajamarca.RData
|   |   |   +-- cusco.RData
|   |   |   +-- huancavelica.RData
|   |   |   +-- huanuco.RData
|   |   |   +-- ica.RData
|   |   |   +-- junin.RData
|   |   |   +-- lalibertad.RData
|   |   |   +-- lambayeque.RData
|   |   |   +-- lima.RData
|   |   |   +-- loreto.RData
|   |   |   +-- madrededios.RData
|   |   |   +-- moquegua.RData
|   |   |   +-- pasco.RData
|   |   |   +-- piura.RData
|   |   |   +-- puno.RData
|   |   |   +-- sanmartin.RData
|   |   |   +-- tacna.RData
|   |   |   +-- tumbes.RData
|   |   |   +-- ucayali.RData
|   |   |
|   |   +-- red_vial_departamental_lineas
|   |   |   +-- amazonas.RData 
|   |   |   +-- ancash.RData
|   |   |   +-- apurimac.RData
|   |   |   +-- arequipa.RData
|   |   |   +-- ayacucho.RData
|   |   |   +-- cajamarca.RData
|   |   |   +-- cusco.RData
|   |   |   +-- huancavelica.RData
|   |   |   +-- huanuco.RData
|   |   |   +-- ica.RData
|   |   |   +-- junin.RData
|   |   |   +-- lalibertad.RData
|   |   |   +-- lambayeque.RData
|   |   |   +-- lima.RData
|   |   |   +-- loreto.RData
|   |   |   +-- madrededios.RData
|   |   |   +-- moquegua.RData
|   |   |   +-- pasco.RData
|   |   |   +-- piura.RData
|   |   |   +-- puno.RData
|   |   |   +-- sanmartin.RData
|   |   |   +-- tacna.RData
|   |   |   +-- tumbes.RData
|   |   |   +-- ucayali.RData
|   |   |
|   |   +-- red_vial_vecina_lineas
|   |   |   +-- amazonas.RData 
|   |   |   +-- ancash.RData
|   |   |   +-- apurimac.RData
|   |   |   +-- arequipa.RData
|   |   |   +-- ayacucho.RData
|   |   |   +-- cajamarca.RData
|   |   |   +-- cusco.RData
|   |   |   +-- huancavelica.RData
|   |   |   +-- huanuco.RData
|   |   |   +-- ica.RData
|   |   |   +-- junin.RData
|   |   |   +-- lalibertad.RData
|   |   |   +-- lambayeque.RData
|   |   |   +-- lima.RData
|   |   |   +-- loreto.RData
|   |   |   +-- madrededios.RData
|   |   |   +-- moquegua.RData
|   |   |   +-- pasco.RData
|   |   |   +-- piura.RData
|   |   |   +-- puno.RData
|   |   |   +-- sanmartin.RData
|   |   |   +-- tacna.RData
|   |   |   +-- tumbes.RData
|   |   |   +-- ucayali.RData
|   |   |
|   |   +-- rios
|   |   |   +-- amazonas.RData 
|   |   |   +-- ancash.RData
|   |   |   +-- apurimac.RData
|   |   |   +-- arequipa.RData
|   |   |   +-- ayacucho.RData
|   |   |   +-- cajamarca.RData
|   |   |   +-- cusco.RData
|   |   |   +-- huancavelica.RData
|   |   |   +-- huanuco.RData
|   |   |   +-- ica.RData
|   |   |   +-- junin.RData
|   |   |   +-- lalibertad.RData
|   |   |   +-- lambayeque.RData
|   |   |   +-- lima.RData
|   |   |   +-- loreto.RData
|   |   |   +-- madrededios.RData
|   |   |   +-- moquegua.RData
|   |   |   +-- pasco.RData
|   |   |   +-- piura.RData
|   |   |   +-- puno.RData
|   |   |   +-- sanmartin.RData
|   |   |   +-- tacna.RData
|   |   |   +-- tumbes.RData
|   |   |   +-- ucayali.RData
|   |   |
|   |   +-- demarcacion.RData
|   |   +-- lago_titicaca.RData
|   |   +-- lagunas_glaciares.RData
|   |   +-- red_vial_departamental_puntos.RData
|   |   +-- red_vial_nacional.RData
|   |   +-- red_vial_trochas.RData
|   |   +-- red_vial_vecinal_puntos.RData
|   |   +-- volcanes.RData
|   |
|   +-- mapas.RData
|
+-- .gitignore
+-- actualizar_repositorio_en git_hub.sh
+-- README.md
+-- main.Rmd

```

