# R_mapas

Este repositorio facilita la creación de mapas con paquetes y librerías de R como [`sf`](https://r-spatial.github.io/sf/), [`rayshadeR`](https://www.rayshader.com/) y [`ggplot2`](https://ggplot2.tidyverse.org/) (quizás pronto también [`spatstat`](https://spatstat.org/)). 

## Uso recomendado del repositorio

El repositorio ha sido diseñado para funcionar de acuerdo con lo siguiente:

- Se recomienda que el usuario trabaje desde el archivo `main.Rmd` u otros archivos .R ó .Rmd alojados en el directorio principal.
- Los scripts de apoyo -escritos en archivos .R- se alojan en la carpeta `auxiliares`.
- Las bases de datos y otros archivos que contengan información a ser procesada -como las colecciones .shp y los archivos .RData- son almacenados en la carpeta `data`.
- Existe un archivo `.gitignore` que evita que ciertos formatos se cuelen en el repositorio remoto. 
- Finalmente, para los usuarios de git, el archivo `actualizar_repositorio_en_git_hub.sh` permite actualizar fácilmente el repositorio.

## Scripts de mantenimiento

Uno de los aspectos más valiosos de este repositorio son los archivos .RData que se alojan en la carpeta `data\mapas` y que contienen tablas con información geográfica. Para salvaguardar la vigencia de esta información, el repositorio contiene archivos .R alojados en la carpeta `auxiliares\actualizar_data` que facilitan el mantenimiento de los archivos .RData. 

## Estructura del repositorio (completo)

Una vez que se ha corrido el archivo `auxiliares\actualizar_data\descargar_insumos.R`, la estructura del repositorio debería verse de la siguiente manera: 

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
|   |   |   +-- geo.cpg
|   |   |   +-- geo.dbf
|   |   |   +-- geo.prj
|   |   |   +-- geo.qpj
|   |   |   +-- geo.shp
|   |   |   +-- geo.shx
|   |   |   +-- geo.xml
|   |   |	
|   |   +-- anp
|   |   |   +-- anp_nacional 
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.lyr
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- areas_de_conservacion_privada
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.lyr
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- areas_de_conservacion_regional
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.lyr
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- grillas
|   |   |   +-- zonas_de_amortiguamiento
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.lyr
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- zonas_reservadas
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.lyr
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- zonificacion_de_ACP
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.lyr
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- zonificacion_de_ACR
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.lyr
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- zonificacion_de_ANP
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.lyr
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   +-- bosques_de_produccion_permanente
|   |   |   +-- geo.dbf
|   |   |   +-- geo.prj
|   |   |   +-- geo.qpj
|   |   |   +-- geo.shp
|   |   |   +-- geo.shx
|   |   |	
|   |   +-- calles
|   |   |   +-- amazonas
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- ancash
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- apurimac
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- arequipa
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- ayacucho
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- cajamarca
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- cusco
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- huancavelica
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- huanuco
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- ica
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- junin
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- lalibertad
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- lambayeque
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- lima
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- loreto
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- madrededios
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- moqueguas
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- pasco
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- piura
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- puno
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- sanmartin
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- tacna
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- tumbes
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- ucayali
|   |   |       +-- geo.cpg
|   |   |       +-- geo.dbf
|   |   |       +-- geo.prj
|   |   |       +-- geo.sbn
|   |   |       +-- geo.sbx
|   |   |       +-- geo.shp
|   |   |       +-- geo.shx
|   |   |       +-- geo.xml
|   |   |   
|   |   +-- demarcacion
|   |   |   +-- departamentos
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- distritos
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |
|   |   |   +-- pais
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |
|   |   |   +-- provincias
|   |   |       +-- geo.cpg
|   |   |       +-- geo.dbf
|   |   |       +-- geo.prj
|   |   |       +-- geo.shp
|   |   |       +-- geo.shx
|   |   |       +-- geo.xml
|   |   |	
|   |   +-- lago_titicaca
|   |   |   +-- geo.cpg
|   |   |   +-- geo.dbf
|   |   |   +-- geo.prj
|   |   |   +-- geo.qpj
|   |   |   +-- geo.shp
|   |   |   +-- geo.shx
|   |   |	
|   |   +-- lagunas_glaciares
|   |   |   +-- geo.cpg
|   |   |   +-- geo.dbf
|   |   |   +-- geo.prj
|   |   |   +-- geo.qpj
|   |   |   +-- geo.shp
|   |   |   +-- geo.shx
|   |   |   +-- geo.xml
|   |   |	
|   |   +-- mundo
|   |   +-- oefa_od
|   |   |   +-- geo.cpg
|   |   |   +-- geo.dbf
|   |   |   +-- geo.prj
|   |   |   +-- geo.sbn
|   |   |   +-- geo.sbx
|   |   |   +-- geo.shp
|   |   |   +-- geo.shx
|   |   |   +-- geo.xml
|   |   |	
|   |   +-- ptar
|   |   |   +-- geo.cpg
|   |   |   +-- geo.dbf
|   |   |   +-- geo.prj
|   |   |   +-- geo.qpj
|   |   |   +-- geo.shp
|   |   |   +-- geo.shx
|   |   |	
|   |   +-- red_vial
|   |   |   +-- red_vial_departamental
|   |   |   |   +--lineas
|   |   |   |   |  +-- geo.cpg
|   |   |   |   |  +-- geo.dbf
|   |   |   |   |  +-- geo.idx
|   |   |   |   |  +-- geo.prj
|   |   |   |   |  +-- geo.sbn
|   |   |   |   |  +-- geo.sbx
|   |   |   |   |  +-- geo.shp
|   |   |   |   |  +-- geo.shx
|   |   |   |   |  +-- geo.xml
|   |   |   |   |
|   |   |   |   +--puntos
|   |   |   |      +-- geo.cpg
|   |   |   |      +-- geo.dbf
|   |   |   |      +-- geo.prj
|   |   |   |      +-- geo.sbn
|   |   |   |      +-- geo.sbx
|   |   |   |      +-- geo.shp
|   |   |   |      +-- geo.shx
|   |   |   |      +-- geo.xml
|   |   |   |
|   |   |   +-- red_vial_nacional
|   |   |   |   +--lineas
|   |   |   |   |  +-- geo.cpg
|   |   |   |   |  +-- geo.dbf
|   |   |   |   |  +-- geo.idx
|   |   |   |   |  +-- geo.prj
|   |   |   |   |  +-- geo.sbn
|   |   |   |   |  +-- geo.sbx
|   |   |   |   |  +-- geo.shp
|   |   |   |   |  +-- geo.shp.xml
|   |   |   |   |  +-- geo.shx
|   |   |   |   |  +-- geo.xml
|   |   |   |   |
|   |   |   |   +--puntos
|   |   |   |      +-- geo.cpg
|   |   |   |      +-- geo.dbf
|   |   |   |      +-- geo.idx
|   |   |   |      +-- geo.prj
|   |   |   |      +-- geo.sbn
|   |   |   |      +-- geo.sbx
|   |   |   |      +-- geo.shp
|   |   |   |      +-- geo.shp.xml
|   |   |   |      +-- geo.shx
|   |   |   |
|   |   |   +-- red_vial_vecinal
|   |   |   |   +--lineas
|   |   |   |   |  +-- geo.cpg
|   |   |   |   |  +-- geo.dbf
|   |   |   |   |  +-- geo.prj
|   |   |   |   |  +-- geo.sbn
|   |   |   |   |  +-- geo.sbx
|   |   |   |   |  +-- geo.shp
|   |   |   |   |  +-- geo.shx
|   |   |   |   |  +-- geo.xml
|   |   |   |   |
|   |   |   |   +--puntos
|   |   |   |      +-- geo.cpg
|   |   |   |      +-- geo.dbf
|   |   |   |      +-- geo.prj
|   |   |   |      +-- geo.sbn
|   |   |   |      +-- geo.sbx
|   |   |   |      +-- geo.shp
|   |   |   |      +-- geo.shx
|   |   |   |      +-- geo.xml
|   |   |   |
|   |   |   +-- trochas
|   |   |       +--geo.cpg
|   |   |       +--geo.dbf
|   |   |       +--geo.prj
|   |   |       +--geo.qpj
|   |   |       +--geo.shp
|   |   |       +--geo.shx
|   |   |	
|   |   +-- rios
|   |   |   +-- amazonas
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- ancash
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- apurimac
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- arequipa
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- ayacucho
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- cajamarca
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- cusco
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- huancavelica
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- huanuco
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- ica
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- junin
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- lalibertad
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- lambayeque
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- lima
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- loreto
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- madrededios
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- moquegua
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- pasco
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- piura
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- puno
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- sanmartin
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- tacna
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- tumbes
|   |   |   |   +-- geo.cpg
|   |   |   |   +-- geo.dbf
|   |   |   |   +-- geo.prj
|   |   |   |   +-- geo.sbn
|   |   |   |   +-- geo.sbx
|   |   |   |   +-- geo.shp
|   |   |   |   +-- geo.shx
|   |   |   |   +-- geo.xml
|   |   |   |
|   |   |   +-- ucayali
|   |   |       +-- geo.cpg
|   |   |       +-- geo.dbf
|   |   |       +-- geo.prj
|   |   |       +-- geo.sbn
|   |   |       +-- geo.sbx
|   |   |       +-- geo.shp
|   |   |       +-- geo.shx
|   |   |       +-- geo.xml
|   |   |   
|   |   +-- volcanes
|   |       +-- geo.dbf
|   |       +-- geo.prj
|   |       +-- geo.qpj
|   |       +-- geo.shp
|   |       +-- geo.shx
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
+-- actualizar_repositorio_en_git_hub.sh
+-- README.md
+-- main.Rmd
```

