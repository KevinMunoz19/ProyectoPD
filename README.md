# Proyecto Product Development

La aplicación de shiny inició con la conexión de R con las tablas de SQL, después de importar las tres tablas se procedió a hacer el marge de los tres campos (casos confirmados, recuperados y letales), se utilizó como llaves las variables estado, país, fecha y las coordenadas (latitud y longitud).
Se cargó un shapefile que contiene la informacion espacial de los continentes, esto se realizó empleando el paquete sf, después de cargar el paquete inmediatamente se definió la proyección espacial de este archivo el cual es wgs 84, al cual le corresponde el CRS EPSG:4326, lo que se realizó enseguida fue la conversión de la data de los casos confirmados, casos recuperados y número de fallecidos a un archivo espacial, para luego hacer un intersección espacial con la capa de continentes y la de coordenadas, esto para asignar espacialmente a cada coordenada un continente. Después de lo anterior se carga un archivo espacial que contiene la extensión de cada país, esto es útil en la visualización del dashboard para mostrar el país o los países seleccionados.

En la parte visual se empleó un navbarpage para poder crear dos pestañas, una que corresponde al comportamiento temporal de los casos acumulados confirmados, recuperados y letales del covid-19, se definieron filtros reactivos que se actualizan en función de una selección anterior, se colocó la opción de filtrar por continente, por país y en caso de que el país presente datos por estado esto este filtro se pueda aplicar. Se colocó una caja de selección para poder elegir la o las variables a visualizar en una gráfica que muestra el comportamiento multitemporal de los casos confirmados, recuperados y letales, el ultimo input que se estableció fue la fecha bajo estudio, dando la posibilidad de ingresar la fecha de inicio y fecha final. Después de la gráfica se configuró un mapa que muestra el o los países filtrados para que finalmente se muestre un cuadro que resume el porcentaje de letalidad del covid por cada país, además del porcentaje de casos recuperados, dichos cálculos se realizaron empleando los valores máximos de cada país ya que estos están acumulados.

La segunda pestaña se le denominó resumen, en esta se muestran dos box-plots que permiten comparar los valores de porcentaje de casos recuperados de cada país, siendo agrupados por continente, esto permite por continente identificar los países que destacan más en el porcentaje de casos recuperados pero así mismo los países que no han reportado los casos recuperados o simplemente tienen un bajo porcentaje de recuperación. El segundo boxplot se planteó con la misma analogía pero con informacion del porcentaje de casos letales.

En la parte del server, para el caso de los filtros reactivos se definió por defecto que la selección sea de la región de Norte América, se emplea el input de la caja de selección para que mediante a condiciones poder responder a la solicitud de la variable a mostrar en la gráfica de comportamiento multitemporal dependiendo de que si se tiene una, dos o las tres variables bajo estudio.

En el apartado del mapa, la selección es coloreada en función al numero de casos confirmados por cada país, de tal forma que un color mas obscuro indica la presencia de mas casos confirmados, además del color se emplearon las coordenadas de los registros para poder mostrar el numero de casos puntuales de cada estado para los casos que están detallados o el numero total en caso de que no se cuente con ese detalle, el tamaño del punto está en función del nume3ro de casos confirmados.
El hacer clic sobre cualquier país se muestra la informacion de nombre de país, número de casos confirmados, número de casos recuperados y número de casos letales.
Finalmente el cuadro que resume el porcentaje de casos recuperados y porcentaje de casos letales, siendo calculados con los valores máximos de cada país 






