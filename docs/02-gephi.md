---
output: html_document
bibliography: book.bib
---

# Trabajando con Gephi


## Introducción

> [El ARSo] es una colección de teorías y métodos que suponen que el comportamiento de los actores (por ejemplo, individuos, grupos u organizaciones) se ve profundamente afectado por sus vínculos con otros y las redes en las que están incrustados -- [@Everton2012]

Como puede ver en el pasaje y los capítulos previos, ARSo se basa en algoritmos gráficos y matemáticos complejos. Esto no quiere decir “software”, si bien las semillas de este campo de estudio empezaron a madurar mucho antes del desarrolló de computadoras modernas.

Hoy en día existen múltiples paquetes de software desarrollados para asistir al analistas de ARSo en sus iniciativas laborales o académicas. Por consiguiente, sería ilógico presentarle métodos para trabajar con datos de redes sociales “a mano”. Sin embargo, el enfoque de este documento no es darle una presentación completa de las herramientas de software disponibles en este campo, para ello consulte [CITA] o [CITA]. Nuestro objetivo es mucho más limitado, presentarle métodos para grabar, manipular y visualizar datos de redes y asimismo presentarle la aplicación de estas técnicas y métodos en la plataforma de software Gephi.


## Gephi

De acuerdo con los autores de Gephi, la plataforma es “una herramienta para analistas de datos y científicos interesados en explorar y comprender gráficos. Como Photoshop ™, pero para los datos de grafo, el usuario interactúa con la representación, manipula las estructuras, formas y colores para revelar patrones ocultos. El objetivo es ayudar a los analistas de datos a hacer hipótesis, descubrir patrones intuitivamente, aislar singularidades o fallas de estructura durante la recopilación de datos” [@gephi]. Para nuestros propósitos utilizaremos esta interfaz para complementar el material y facilitar nuestro un análisis exploratorio. Antes de comenzar los siguientes capítulos, descargue gratuitamente la herramienta desde [el sitio web de Gephi.](https://gephi.org/)

Como todas las herramientas de software, esta tiene ventajas y desventajas. Es importante el explicar por qué hemos elegido esta herramienta sobre algunas de las demás. Nos gustaría recalcar cuatro:
  
  1. Es una [herramienta de fuente abierta](https://github.com/gephi/gephi), por consiguiente, podemos descargar y utilizarla libre de costo. 
  2. Incluye una gran variedad de herramientas de visualización, algoritmos gráficos y matemáticos complejos, capacidades para ingerir y manipular varios formatos de datos y es extensible utilizando docenas de complementos creados por la comunidad abierta de usuarios que amplían las funcionalidades del software. 
  3. Existe una gran comunidad de usuarios y desarrolladores quienes activamente contribuyen al [crecimiento de la plataforma](https://github.com/gephi/gephi/issues), [manuales de usuario](https://gephi.org/users/), [tutoriales](https://www.youtube.com/watch?v=2FqM4gKeNO4) y publican artículos utilizando esta herramienta (por ejemplo, @chaudhary).  
  4. Este manual está diseñado para hispanohablantes, la interfaz de Gephi se puede configurar en español.

En las siguientes secciones continuaremos introduciendo este programa, sus interfaces, características, capacidades de visualización, fortalezas, debilidades, etc. 

## Gephi 101

Las siguientes subsecciones le brindaran una breve introducción a la plataforma Gephi y sus tres secciones principales. Esta no es la única vez que cubriremos algunos de los conceptos básicos de Gephi; como tal, esta sección está diseñada para ser una descripción general de alto nivel.

### Antes de Empezar

Primero, descargue e instale el software en su computadora. Como se había mencionado previamente el software es gratuito y [distribuido abiertamente](https://gephi.org/users/download/). Gephi es una aplicación multiplataforma desarrollada en Java, por lo que requiere una instalación previa de Java versión o posterior, la cual puede obtener libremente [en línea](https://www.java.com/en/download/). Para computadoras Mac OS X, Java se incluye con la aplicación, por lo que no es necesario instalarlo por separado. En Windows y Linus, el sistema debe estar equipado con Java.

Si bien no hay requisitos mínimos de hardware, el rendimiento es una función de la memoria. Además, se requiere una tarjeta gráfica compatible para ejecutar Gephi.

### Inicie Gephi

Empiece por localizar y abrir el programa. Lo primero que vera es una ventanilla de Bienvenida, vea la Figura \@ref(fig:bienvenida). 

<div class="figure" style="text-align: center">
<img src="images/01-gephi.png" alt="Menú de Bienvenida en Gephi" width="100%" />
<p class="caption">(\#fig:bienvenida)Menú de Bienvenida en Gephi</p>
</div>

Para esta breve instrucción al software, vamos a usar uno de los conjuntos de datos proporcionados por el software, `Les Misrables.gexf` [@Knuth1993]. Localice este con que puedo localizar en la parte inferior derecha de la ventanilla de bienvenida. Al seleccionar esta opción aparecerá una nueva ventanilla, en el futuro explicaremos más acerca de la opción en este espacio, por ahora seleccione el botón *Aceptar*. ¡Listo! Con el conjunto de datos cargado (Figura Figura \@ref(fig:les-mis)), podemos empezar a explorar Gephi.

<div class="figure" style="text-align: center">
<img src="images/01-lesmis.png" alt="Datos Les Misrables Cargados" width="100%" />
<p class="caption">(\#fig:les-mis)Datos Les Misrables Cargados</p>
</div>

### Vista General

Esta es la ventana que utilizará más a menudo, ver Figura \@ref(fig:overview). Aquí podrá tomar diferentes acciones para manipular la aparencia sus gráficos, filtrar información y calcular medidas de red, arista, o nodo.

<div class="figure" style="text-align: center">
<img src="images/01-overview.png" alt="Gephi: Vista General" width="100%" />
<p class="caption">(\#fig:overview)Gephi: Vista General</p>
</div>

La característica más obvia de esta ventana es el gráfico prominente en el centro; sin embargo, hay varias ventanillas relevantes; aquí, las cubriremos en orden alfabético.

#### Apariencia

El cuadro de apariencia le permite cambiar las características visuales de los nodos, aristas y etiquetas [@kateto2016]. Las opciones se bifurcan para trabajar en la apariencia de nodos aristas, accesibles a través de las pestañas correspondientes (*Nodos* y *Aristas*). Para editar nodos o aristas se le presenta una serie de opcionesen el lado derecho de este cuadro, divididas de tal manera (ver Figura \@ref(fig:apariencia)):

  - *Nodos*:
    - *Color* (1): Modificar el color de los nodos
    - *Tamaño* (2): Modificar el tamaño de cada nodo
    - *Color de etiqueta* (3): Modificar el color de las etiquetas de los nodos
    - *Tamaño de etiqueta* (4): Modificar el color de las etiquetas de los nodos
  
  - *Aristas*:
    - *Color* (5): Modificar el color de los nodo
    - *Color de etiqueta* (6): Modificar el color de las etiquetas de los aristas
    - *Tamaño de etiqueta* (7): Modificar el tamaño de las etiquetas de los aristas

<div class="figure" style="text-align: center">
<img src="images/01-apariencia.png" alt="Gephi: Apariencia" width="100%" />
<p class="caption">(\#fig:apariencia)Gephi: Apariencia</p>
</div>

Cada sección contendrá de dos a tres pestañas: *Único*, *Partición* y *Ranking*. Veamos como funcionan con utilizando el software:

::::{.row}
::::{.lcolumn-20}
*Nodos > Color > Único > Clic sostenido sobre el cuadro de color > Seleccionar color > Aplicar*

*Aristas > Color > Único > Clic sostenido sobre el cuadro de color > Seleccionar color > Aplicar*
::::
::::{.rcolumn-80}
 *Único* cambia los elementos de manera uniforme por color o tamaño seleccionado. Por consiguiente, para modificar el tamaño color de los nodos en gráfico, proceda a seleccionar *Nodos > Color > Único > Clic sostenido sobre el cuadro de color > Seleccionar color > Aplicar*. Si desea modificar el color de las aristas para que reflejen un valor único, seleccione *Nodos > Color > Único > Clic sostenido sobre el cuadro de color > Seleccionar color > Aplicar*. En la Figura \@ref(fig:color-unique) los nodos han sido coloreados de negro (`#000000`) y las aristas de gris (`#adadad`), que Gephi define colores utilizando una combinación hexademicial de números y letras definida por su mezcla de rojo, verde y azul.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/01-color_unique.png" alt="Nodos y Aristas con Colores Únicos" width="100%" />
<p class="caption">(\#fig:color-unique)Nodos y Aristas con Colores Únicos</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Nodos > Tamaño > Único > 20 > Aplicar*
::::
::::{.rcolumn-80}
Para modificar el tamaño de los nodos, igualmente usaremos la opción Único. Sin embargo, en esta secuencia modificaremos la característica a cambiar de la siguiente manera: *Nodos > Tamaño > Único > 20 > Aplicar*. Como vera en la Figura \@ref(fig:size-unique) todos los nodos en el grafico aparecen con el mismo tamaño. 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/01-size_unique.png" alt="Nodos con Tamaño Único" width="100%" />
<p class="caption">(\#fig:size-unique)Nodos con Tamaño Único</p>
</div>


::::{.row}
::::{.lcolumn-20}
*Nodos > Color > Partición > --Escoge un atributo > Modularity Class > Aplicar*
::::
::::{.rcolumn-80}
La *Partición* cambia todos los elementos visibles utilizando valores de atributos categóricos. Por ejemplo, el conjunto de datos que seleccionamos tiene un atributo categórico, `modularidad`, que representa el subgrupo al que pertenece cada nodo. Usando ese atributo podemos cambiar el color de los nodos seleccionando *Nodos > Color > Partición > --Escoge un atributo > Modularity Class > Aplicar*. Una vez aplicado, los colores de los nodos deberían permitirle entender qué nodos pertenecen a las misma comunidades. De manera similar, podríamos intentar cambiar los colores de las aristas basándonos en un atributo categórico; sin embargo, el conjunto de datos de ejemplo no incluye dicho tipo de variable.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/01-color_partition.png" alt="Nodos Coloreados por Atributos Categoriales." width="100%" />
<p class="caption">(\#fig:color-partition)Nodos Coloreados por Atributos Categoriales.</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Nodos > Tamaño > Ranking > --Escoge un atributo > Grado > Aplicar*
::::
::::{.rcolumn-80}
El *Ranking* cambia todos los elementos visibles utilizando valores de atributos continuos. Por ejemplo, el conjunto de datos que seleccionamos tiene un atributo continuo, `grado`, que representa el numero de enlaces que tiene cada nodo. Usando ese atributo podemos cambiar el tamaño de los nodos seleccionando *Nodos > Tamaño > Ranking > --Escoge un atributo > Grado > Aplicar*. Ahora deberá ver que algunos nodos aparecen mucho más grandes que otros, esto se debe a que algunos tienen más conexiones. Más adelante en el libro ampliaremos el significado de esta medida y presentaremos otras. Quizás se este preguntando, ¿es posible cambiar el grosor de las aristas en función de una variable continua? La respuesta es sí, pero hacerlo requiere un menú diferente, por lo que abordaremos esto más adelante.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/01-size-ranking.png" alt="Nodos Dimensionados por Variable Continua." width="100%" />
<p class="caption">(\#fig:size-ranking)Nodos Dimensionados por Variable Continua.</p>
</div>


#### Contexto

Esta sección proporciona información sobre las propiedades básicas del gráfico; específicamente, el número de nodos y aristas y si el gráfico es dirigido o no.

#### Distribuición

ARSo depende en gran medida de la exploración de datos a través de buena visualización. Esta es una de las características clave de Gephi, contiene una buena cantidad de algoritmos de diseño de gráficos y los ejecuta bastante rápido (todo dependiendo de la potencia de su procesador). La ventana *Distribuición* le permite al usuario seleccionar entre una serie de algoritmos de diseño de gráficos y modificar los parámetros preestablecidos según sea necesario. En esta sección exploraremos algunos de los algoritmos gráficos más notables incluidos con la instalación base de Gephi.


::::{.row}
::::{.lcolumn-20}
*Elije una distribuición > Force Atlas > Ejecutar*
::::
::::{.rcolumn-80}
*Force Atlas* y *Force Atlas 2* son algoritmos de diseño dirigidos por fuerza, producido por los desarrolladores de Gephi, que permite visualizar efectivamente gráficos de tamaño pequeño a mediano [@Jacomy2011]. Estos son algoritmos continuos, es decir que el permiten que el analista edite al gráfico mientras el algoritmo dibuja; asimismo, significa que además de *Ejecutar* el algoritmo hay que seleccionar *Parar* cuando uno este satisfecho con el diseño. Veamos como funciona este algoritmo, para ello en la sección de Distribución seleccione *Elije una distribuición > Force Atlas > Ejecutar*. Después de un par de minutos, recuerde en dar clic sobre el botón *Parar*. Como puede ver, el algoritmo a contraído los nodos. Esta es una característica de los algoritmos dirigidos por fuerza donde los nodos vinculados se atraen entre si y los nodos no vinculados se repelen.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/01-force_atlas.PNG" alt="Gráfico dibujado con Force Atlas" width="100%" />
<p class="caption">(\#fig:force-atlas)Gráfico dibujado con Force Atlas</p>
</div>


::::{.row}
::::{.lcolumn-20}
*Elije una distribuición > Expansión  > Ejecutar*

*Elije una distribuición > Contracción  > Ejecutar*
::::
::::{.rcolumn-80}
Uno de los algoritmos de diseño más útiles es *Expansión*, el cual aumenta el tamaño de la red pero mantiene la ubicación relativa de los nodos constante. Tenga en cuenta que la opción Contracción que nos permitirá volver a introducir una red si se expande demasiado. El polo opuesto de esta opción es *Contracción*, que permite compactar la red manteniendo la ubicación relativa de los nodos. Ambas opciones so ejecutadas de manera instantánea, por consiguiente, no hay que detener el algoritmo.

Por ejemplo, la Figura \@ref(fig:expansion) es una versión expandida de a Figura \@ref(fig:force-atlas). Sin embargo, podría decirse que es más fácil observar los patrones en este gráfico editado. Para expandir el gráfico seleccione *Elije una distribuición > Expansión  > Ejecutar*. De clic en *Ejecutar* un par de veces, si sobrepasa el punto deseado seleccione *Elije una distribuición > Contracción  > Ejecutar* para contraer el gráfico. 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/01-expansion.PNG" alt="Gráfico dibujado con Force Atlas y Expandido" width="100%" />
<p class="caption">(\#fig:expansion)Gráfico dibujado con Force Atlas y Expandido</p>
</div>

Por ahora, solo cubriremos estas tres opciones de diseño. Más adelante utilizaremos algoritmos de diseño de manera orgánica. Sin embargo, le recomendamos que juegue con otras opciones, eche un vistazo a cómo se ven los gráficos resultantes, pero tenga en cuenta que algunos algoritmos no se detendrán por sí mismos, por lo que es posible que deba detenerlos manualmente.

#### Estadísticas

Además de utilizar visualizaciones, los analistas de ARSo depende a menudo de medidas estadísticas utilizadas para comprender las características estructurales de la red a fondo. Gephi proporciona una cantidad limitada, pero suficiente de medidas estadísticas al descargar el software. La pestaña de *Estadísticas* es la ubicación principal en Gephi para encontrar dichas medidas. Localícela a mano derecha del *Grafo*, es posible que tenga que seleccionar la pestaña puesto que comparte el mismo espacio con *Filtros*.


::::{.row}
::::{.lcolumn-20}
*Visión general de la red > Grado medio > Ejecutar*
::::
::::{.rcolumn-80}
Para ejecutar una medida, seleccione el botón *Ejecutar* a un lado de dicha medida. En capítulos futuros explicaremos la gran mayoría de las medidas presentes, por ahora, revisitemos la medida de grado. Esta se refiere al número de aristas adjuntas al nodo. Para calcular esta medida, seleccione *Visión general de la red > Grado medio > Ejecutar*.

Esta selección debe generar un informe HTML que muestre la distribución de grados del gráfico, consulte la Figura \@ref(fig:degree). Además de este reporte, esta acción agregara valores de centralidad de grado a cada nodo en la tabla de aristas situada en el *Laboratorio de Datos*. Proceda a cerrar este cuadro de diálogo, si desea volver a abrirlo repita los pasos presentados previamente. 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/01-degree.PNG" alt="Ejecutando Estadística de Grado" width="100%" />
<p class="caption">(\#fig:degree)Ejecutando Estadística de Grado</p>
</div>

#### Filtros

A menudo tendremos que modificar nuestros datos en Gephi, dentro de la Vista General encontrara la pestaña de *Filtros*. Esta contiene una variedad de parámetros para filtrar los datos presentados con base a características (variables continuas o categóricas) de los nodos o las aristas. Puede aplicar uno o varios filtros a un gráfico para descubrir características ocultas o refinar la cantidad de información que se muestra en un gráfico.


::::{.row}
::::{.lcolumn-20}
*Arrastrar a Consultas > Rango (Grado) Configuración = 2-36 > Filtrar*
::::
::::{.rcolumn-80}
Para filtrar grafo en base a el numero de enlaces, por ejemplo, remover los nodos pendientes, en *Biblioteca* de filtros localice *Atributos > Rango > Grado*, arrastre el filtro de rango a la parte inferior de este cuadro, específicamente la sección de *Consultas*. Al agregar el filtro en *Consultas* notará que en la parte inferior del cuadro aparecerá un rango de `1` a `36`. Modifique el rango para que el mínimo numero de enlaces sea 2 y su rango lea de `2` a `36`. Otra manera de decir esto es filtraremos los nodos de manera que solo aquellos con 2 o más enlaces permanezcan en la red. Por último, de clic en el botón *Filtrar*. Note los cambios en las ventanillas de *Grafo* y *Contexto*, deberá ver un menor numero de nodos y aristas.

Si desea remover el filtro, presione el botón *Auto aplicar* en la parte inferior derecha (que solía leer *Filtrar*). Al hacer esto, sus datos deben volver a aparecer. 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/01-filter.PNG" alt="Filtrando por Grado" width="100%" />
<p class="caption">(\#fig:filter)Filtrando por Grado</p>
</div>

#### Grafo

La última sección que cubriremos en esta esta introducción a la *Vista General* es el *Grafo* y algunas de las funciones asociadas con esta ventanilla. En el lado derecho e inferior del panel, encontrará las herramientas básicas para interactuar manualmente con el gráfico y editar algunos de los atributos visuales de su gráfico. En esta breve introducción, los definiremos con fines de conciencia general, pero no entraremos en demasiados detalles, ya que los usaremos más adelante en el libro según sea necesario.


<div class="figure" style="text-align: center">
<img src="images/01-grafo.png" alt="Ventanilla de Grafo" width="100%" />
<p class="caption">(\#fig:grafo)Ventanilla de Grafo</p>
</div>


Lo que sigue es una lista de nombres de comandos y funciones en orden secuencial, ver Figura \@ref(fig:grafo):

 1.	*Selección directa* – elegir un nodo a la vez
 2.	*Selección rectangular* – elegir uno o múltiples nodos en un área rectangular
 3.	*Desplazar* – moverse sin seleccionar
 4.	*Pincel* – colorea los nodos presionando el botón derecho del ratón
 5.	*Dar tamaño* – cambia el tamaño de los nodos presionando con el boto derecho y arrastrando el ratón  verticalmente
 6.	*Brocha* – como el pincel, da color a los nodos, pero da la opción de difundir el color a los vecinos,  vecinos de vecinos, predecesores y sucesores.
 7.	*Lápiz de nodos* – añade un nuevo nodo al grafo
 8.	*Lápiz de aristas* – añade una nueva arista al grafo
 9.	*Camino más corto* – muestra el camino más corto entre dos nodos seleccionados
 10.	*Mapa de calor* – establece la intensidad del color el base a distancia de vecinos
 11.	*Editor* – editar atributos del nodo
 12.	*Centrar el grafo* – retorna el grafo al centro
 13.	*Reestablecer colores* - devolver los colores a la configuración predeterminada
 14.	*Reestablecer colores de etiquetas* - devolver el color de las etiquetas a la configuración  predeterminada
 15.	*Reestablecer visibilidad de las etiquetas* 
 16.	*Color de fondo* – cambiar el color de fondo
 17.	*Captura de pantalla* – capturar y guardar el grafico en pantalla
 18.	*Mostar etiquetas de los nodos* – mostrar las etiquetas correspondientes de a cada nodo
 19.	*Mostrar aristas* – encender o apagar las aristas 
 20.	*Las aristas tienen el color del nodo origen*
 21.	*Mostar etiquetas de las aristas*
 22.	*Escala del peso de las aristas* – incrementar o disminuir el grosor de las aristas
 23.  *Modo de tamaño* – seleccionar modo de tamaño para las etiquetas
 24.	*Modo de color* – seleccionar modo de color para las etiquetas
 25.	*Fuente* – seleccionar fuente para las etiquetas
 26.	*Escala de la fuente* – incrementar o reducir el tamaño de las etiquetas
 27.	*Color por defecto* – elegir el color de las etiquetas
 28.	*Atributos* – configurar los atributos de las etiquetas para nodos o aristas
 29.	*Expandir* – añadir opciones para editar la apariencia *Global*, de *Aristas*, o *Etiquetas*.
 

### Laboratorio de Datos

El *Laboratorio de datos* contiene tablas de los datos de nodos (Figura \@ref(fig:data-lab) izquireda) y aristas (Figura \@ref(fig:data-lab) derecha). Estas tablas permiten a los analistas interactuar con la información y editar valores directamente o mediante la serie de comandos en la parte inferior de la pantalla (Figura \@ref(fig:data-lab) abajo). Esta es una descripción muy simplificada de las capacidades de esta sección. Sin embargo, nos centraremos en estas características clave en esta introducción de alto nivel.

<div class="figure" style="text-align: center">
<img src="images/01-data_lab.png" alt="Laboratorio de datos, a la izquierda la Tabla de Nodos y a la derecha la Tabla de Aristas" width="100%" />
<p class="caption">(\#fig:data-lab)Laboratorio de datos, a la izquierda la Tabla de Nodos y a la derecha la Tabla de Aristas</p>
</div>

#### Tabla de Datos: Nodos

La tabla de nodos contiene un identificador único para cada nodo en el gráfico (generalmente ubicado en la columna más a la izquierda como `Id`). Además, note la columna `Label` directamente a la derecha, esta es digna de mención ya que sirve como receptáculo para las etiquetas de los nodos, es decir, los valores en esta columna aparecerán una etiqueta de nodos en el gráfico cuando se especifique. 

<div class="figure" style="text-align: center">
<img src="images/01-nodes_table.png" alt="Laboratorio de datos, Tabla de Nodos" width="100%" />
<p class="caption">(\#fig:nodes-table)Laboratorio de datos, Tabla de Nodos</p>
</div>

A medida que se agregan atributos de nodo al gráfico, en esta tabla deberán aparecer nuevas columnas con estos valores. De manera similar, dentro de Gephi, los analistas a menudo ejecutan diferentes métricas a nivel nodo, estos valores se agregarán a cada registro (fila) en una nueva variable (columna).

#### Tabla de Datos: Aristas

Al igual que la tabla de nodos, la tabla de bordes incluye información clave en el gráfico de red; específicamente, los datos relacionales. Esta información está codificada en siete columnas. Lo que sigue es una breve explicación de estas columnas:

  - `Origen` y `Destino` -  Todas las relaciones en ARSo vinculan un nodo inicial y un nodo final. Por ejemplo, si el nodo A está vinculado al nodo B, tendríamos que dibujar un vínculo del nodo A o B al nodo complementario. Gephi codifica esto en dos columnas `Origen` y `Destino`, por lo que para el mismo ejemplo, si A y B están conectados, podríamos poner A en la columna `Origen` y B en la columna `Destino` o viceversa.
  -` Tipo` - Denota el tipo de relación entre los nodos en las columnas `Origen` y `Destino`. Los valores pueden ser `Dirigida` o` No dirigida`. Si el tipo es `Dirigida` la relación es un arco o arista, de lo contrario, si es tipo `No Dirigida` el vínculo es un borde.
  - `Id` - Un identificador único para el vínculo. Usualmente asignado por Gephi al importar datos.
  - `Label` - Etiqueta del vínculo. 
  - `Interval` - Para vínculos en una secuencia, esta es la columna donde encontrara los valores de tiempo.  
  - `Weight` - Denota el peso para vínculos ponderados. 

<div class="figure" style="text-align: center">
<img src="images/01-edges_table.png" alt="Laboratorio de datos, Tabla de Aristas" width="100%" />
<p class="caption">(\#fig:edges-table)Laboratorio de datos, Tabla de Aristas</p>
</div>

#### Menu Inferior

Esta última sección permite a los usuarios agregar, borrar o eliminar columnas, fusionar valores de varias columnas, copiar datos de una columna a otra, entre otras opciones. A lo largo de este libro, ampliaremos el uso de estos comandos según sea necesario.

<div class="figure" style="text-align: center">
<img src="images/01-lower_bar.png" alt="Laboratorio de datos, Opciones" width="100%" />
<p class="caption">(\#fig:lower-bar)Laboratorio de datos, Opciones</p>
</div>

### Previsualización

*Previsualización* es donde se pule la visualización para fines de exportación. Esta sección es diferente de la *Vista General* en que uno no puede interactuar dinámicamente con los datos a través de filtros, colores o diseño. El valor agregado de esta sección es enfocar la atención del analista en generar gráficos de calidad de publicación y para ello las opciones (en el lado izquierdo) serán mucho más limitadas.

Aquí nos centraremos en 4 secciones clave (indicadas en la Figura \@ref(fig:preview)):

  -	Configuración de Previsualización (1) - Proporciona un conjunto de configuraciones de gráficos preestablecidos y permite al usuario guardar los ajustes preestablecidos para uso futuro.
  -	Parámetros (2) – Ajuste la configuración de visualización como:
    - Color de nodo, ancho, bordes, etiquetas, etc.
    - Muestra los bordes, ajusta el ancho, el color, la curvatura, las etiquetas, las flechas, etc.
  -	Opciones Adicionales (3) – Ajuste las propiedades para la previsualización, exporte el gráfico y aplique las ediciones de la sección *Parámetros*.
  -	Ventanilla de Previsualización (4) – Proporciona una vista del gráfico terminado.

<div class="figure" style="text-align: center">
<img src="images/01-preview.png" alt="Previsualización" width="100%" />
<p class="caption">(\#fig:preview)Previsualización</p>
</div>

### Errores Comunes

Es normal que los usuarios de software se encuentren con problemas conocidos. Esta sección incluye una lista breve (y creciente) de problemas notificados que pueden crear un poco de confusión. Sin embargo, Gephi es un software de código abierto, por lo que puede encontrar errores desconocidos. Cuando esto suceda, [infórmelo a los desarrolladores](https://github.com/gephi/gephi/issues/new) después de leer las reglas de la comunidad e [investigar el problema](http://forum-gephi.org/).

  - Intenta abrir Gephi pero se encuentra con el siguiente error: "Error: Cannot fing Java 1.8 or higher": 
    1. Primero cheque que ha instalado Java 1.8 o posterior. Si no lo ha hecho, ese es el primer problema.
    2. Si ha instalado Java, es probable (pero no necesario) que este viendo el error en una computadora con Windows. Vaya a la carpeta de Gephi (en Windows cheque `C:\Program Files (x86)\Gephi-0.9.1\bin\`). En teoría vera dos versiones de Gephi en esta carpeta, probablemente tituladas `gephi.exe` y `gephi64.exe`. Intente abrir una a la vez. Una deberá funcionar, cree un atajo a este archivo. 
    
  - Ha desaparecido el gráfico/ventanilla/pestaña: En Gephi hay una gran cantidad de pequeñas ventanas y pestañas y todo se puede mover, minimizar y cerrar. Esto puede dar como resultado algunas situaciones en las que lo estropea todo y ya no puede encontrar las ventanas que necesita. Si eso sucede en el menú Ventana, hay una opción para Restablecer ventanas que establecerá todas las pestañas y demás a los valores predeterminados. Por ello es posible que en algunas situaciones usted accidentalmente modifique, minimice o cierre alguna ventana que necesita. Si esto sucede, no se frustre, localice el menú *Ventana* en la parte superior, allí podrá restablecer todas las ventanas a la configuración inicial (*Restablecer Ventanas*) o si lo desea activar una ventanilla a la vez. 
