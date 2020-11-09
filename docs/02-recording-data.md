---
output: html_document
bibliography: book.bib
---



# Grabación y Recopilación

Hasta este punto, hemos descrito los datos de red. En esta sección, nos tomaremos un tiempo para entender cómo codificar datos para importarlos a Gephi, estas estrategias igualmente funcionan con otras plataformas de software. Para ello comenzaremos describiendo sociomatrices, que vimos anteriormente. Después, veremos otra manera de codificar relaciones de manera eficiente como listas de aristas. Luego, exploramos cómo codificar características no relacionales en listas de nodos. Finalmente, tendrá la oportunidad de poner en práctica este conocimiento a través de un ejercicio práctico en Gephi.

## Matrices

### ¿Qué son?

Comenzamos con a la grabación de datos de red en una matriz. Como señala Hanneman, la forma más común de matriz en ARSo es una matriz cuadrada con tantas filas y columnas como actores en nuestro conjunto de datos, en este modelo los valores en las celdas de la matriz registran información sobre los vínculos entre cada par de actores [@Hanneman2005]. Por ejemplo, la matriz \@ref(eq:simple-matrix) representa la forma más simple y común de codificar datos relacionales en forma de matriz; es decir, en forma de matriz binaria. En este caso, vemos un uno si existe un vínculo, de lo contrario vemos un cero. 

$$
\begin{matrix}
  & A & B & C & D & E & F \\
A & - & 1 & 1 & 0 & 0 & 0 \\
B & 1 & - & 1 & 0 & 0 & 0 \\
C & 1 & 1 & - & 1 & 0 & 0 \\
D & 0 & 0 & 1 & - & 1 & 1 \\
E & 0 & 0 & 0 & 1 & - & 1 \\
F & 0 & 0 & 0 & 1 & 1 & - \\
(\#eq:simple-matrix)
\end{matrix}
$$
Como se ha de imaginar, las matrices no siempre son binarias. De hecho, es apropiado y común el recopilar datos de magnitud para un vínculo. Por ejemplo, se puede medir la fuerza de una relación a nivel ordinal o de intervalo. Igualmente, no es inapropiado el recaudar datos relacionales con números positivos y negativos donde los números positivos corresponden a relaciones positivas, el cero es un punto medio neutral y las relaciones negativas tienen valores menores a cero. 

Recuerde que como habíamos visto previamente, los datos codificados en matrices pueden ser simétricos o asimétricos, dirigidos o no dirigidos. Por consiguiente, tradicionalmente es de buena educación ser explicito al mencionar el tipo de matriz que se esta trabajando; por ejemplo, “matriz simétrica binaria modo-uno” o “matriz asimétrica ponderada modo-uno”.

En esta sección, nos enfocamos en matrices modo-uno por su simplicidad, pero cabe recalcar que las matrices pueden ser de modo-dos. Adicionalmente, la mayoría de los analistas de redes trabajan con relaciones de modo-uno, aun si estas han sido derivadas de una relación modo-dos. Es por ello que retornaremos a las matrices modo-dos cuando toquemos el tema de derivar relaciones modo-uno de modo-dos.

### ¿Por qué usarlas o no?

Las matrices tienen múltiples ventajas en ARSo. Primero, son simples de entender. Sin embargo, la razón clave por la cual se utilizan habitualmente es porque se pueden realizar cálculos matemáticos con estas para resumir la información de lar red e ilustrar patrones relacióneles [@Borgatti2018].

Por ejemplo, al trabajar con múltiples matrices de modo-uno con las mismas dimensiones, podemos producir una tercera matriz con el mismo número de dimensiones utilizado el producto Hadamard (operación por elementos). Por ejemplo, tomemos dos matrices con el mismo número de dimensiones una representando amistades y los otros vínculos de negocios. Podemos producir una tercera relación con las mismas dimensiones que podemos nombrar “amigos en negocios”, la ecuación \@ref(eq:mat-op1) ilustra esta operación de matrices por elemento.


\begin{equation}
\begin{matrix}
  & A & B & C \\
A & 0 & 1 & 0 \\
B & 1 & 0 & 1 \\
C & 0 & 1 & 0 \\
\end{matrix}

\enspace \circ \enspace

\begin{matrix}
  & A & B & C \\
A & 0 & 1 & 1 \\
B & 1 & 0 & 0 \\
C & 1 & 0 & 0 \\
\end{matrix}

\enspace = \enspace

\begin{matrix}
  & A   & B   & C \\
A & 0x0 & 1x1 & 0x1 \\
B & 1x1 & 0x0 & 0x0 \\
C & 0x1 & 1x0 & 0x0 \\
\end{matrix}

\enspace = \enspace

\begin{matrix}
  & A & B & C \\
A & 0 & 1 & 0 \\
B & 1 & 0 & 0 \\
C & 0 & 0 & 0 \\
\end{matrix}
(\#eq:mat-op1)
\end{equation}

Adicionalmente, podemos multiplicar matrices “conformables”, es decir el numero de filas en la primera matriz es igual a el numero de columnas en la segunda. Las matrices cuadradas de modo-uno son conformables puesto que tienen el mismo numero de filas y columnas, por lo cual las podemos multiplicar [@Hanneman2005]. A diferencia de el producto Hadamard, en la multiplicación de matrices el orden de estas impacta los resultados. Es decir, supongamos que trabajamos con dos matrices de modo-uno ($A$ y $B$), si multiplico $AxB$ el producto no es equivalente a $BxA$ ($AxB \neq BxA$). La ecuación \@ref(eq:mat-op2) illustra el proceso de multiplicar matrices $AxB$. Empezamos con la parte superior izquierda de la primera matriz y multiplicamos cada valor en la primera fila por los valores de la primera columna de la segunda matriz. Terminamos por sumar los resultados de estas multiplicaciones. 


\begin{equation}
\begin{matrix}
  & A & B & C \\
A & 0 & 1 & 0 \\
B & 1 & 0 & 1 \\
C & 0 & 1 & 0 \\
\end{matrix}

\enspace \times \enspace

\begin{matrix}
  & A & B & C \\
A & 0 & 1 & 1 \\
B & 1 & 0 & 0 \\
C & 1 & 0 & 0 \\
\end{matrix}

\enspace = \enspace

\begin{matrix}
  & A & B & C \\
A & 1 & 0 & 0 \\
B & 1 & 1 & 1 \\
C & 1 & 0 & 0 \\
\end{matrix}

\\
\\
\\

\begin{matrix}
  & A                 & B                 & C                 \\
A & (0x0)+(1x1)+(0x1) & (0x1)+(1x0)+(0x0) & (0x1)+(1x0)+(0x0) \\
B & (1x0)+(0x1)+(1x1) & (1x1)+(0x0)+(1x0) & (1x1)+(0x0)+(1x0) \\
C & (0x0)+(1x1)+(0x1) & (0x1)+(1x0)+(0x0) & (0x1)+(1x0)+(0x0) \\
\end{matrix}
(\#eq:mat-op2)
\end{equation}

El proceso de multiplicar $BxA$ es similar, pero los resultados son diferentes \@ref(eq:mat-op3). 

\begin{equation}
\begin{matrix}
  & A & B & C \\
A & 0 & 1 & 1 \\
B & 1 & 0 & 0 \\
C & 1 & 0 & 0 \\
\end{matrix}

\enspace \times \enspace

\begin{matrix}
  & A & B & C \\
A & 0 & 1 & 0 \\
B & 1 & 0 & 1 \\
C & 0 & 1 & 0 \\
\end{matrix}


\enspace = \enspace

\begin{matrix}
  & A & B & C \\
A & 1 & 1 & 1 \\
B & 0 & 1 & 0 \\
C & 0 & 1 & 0 \\
\end{matrix}

\\
\\
\\


\begin{matrix}
  & A                 & B                 & C                 \\
A & (0x0)+(1x1)+(1x0) & (0x1)+(1x0)+(1x1) & (0x0)+(1x1)+(1x0) \\
B & (1x0)+(0x1)+(0x0) & (1x1)+(0x0)+(0x1) & (1x0)+(0x1)+(0x0) \\
C & (1x0)+(0x1)+(0x0) & (1x1)+(0x0)+(0x1) & (1x0)+(0x1)+(0x0) \\
\end{matrix}
(\#eq:mat-op3)
\end{equation}

En términos prácticos, @Borgatti2018 presentan el siguiente ejemplo, supongamos que $A$ es una matriz de adyacencia que representa la 'relación de amistad' y $B$ es la relación de 'jefe de'. Entonces si tengo una relación $AxB$ con un nodo, este es el jefe de al menos uno de mis amigos . En contraste, si tengo una relación de $BxA$ con un nodo, entonces este es amigo de mi jefe [@Borgatti2018]. Como puede ver, estas son relaciones muy diferentes producidas al multiplicar las mismas matrices.


Ya que hemos recalcado las ventajas de utilizar matrices, es esencial entender algunas de las desventajas. Por ejemplo, las matrices sufren de tres desventajas principales:

  - Cada matriz representa un solo tipo de relación. Supongamos que el análisis requiere el combinar relaciones familiares y financieras. Para lograr esto, requerimos codificar dos matrices antes de manipularlas. Además, el formato de matriz no permite el agregar metadata sobre las relaciones, por ejemplo: procedencia de un dato, fecha en que ha ocurrido, entre otros.
  - El mantener una o múltiples matrices requiere mantener todas las células. Por ejemplo, en una red de 100 nodos, el analista debe mantener 10,000 células (100 x 100) aun cuando la mayoría de estas estén vacías (sin relación).
  - Además de requerir un alto grado de atención para mantener una matriz, resulta que esta estructura no es la manera más eficiente de guardar datos en una computadora. Específicamente, cada 0 que representa la ausencia de una relación tiene un costo en forma de memoria.

Como puede ver, las matrices (como todas las estructuras de recopilación de datos) tienen ventajas y desventajas. El algebra de matrices es la fundación de la mayoría de los algoritmos utilizados por analistas de redes, por consiguiente, es esencial entender estas estructuras. Sin embargo, las desventajas mencionadas previamente son la razón por la cual los analistas de redes tienen a mantener sus datos relacionales en otros formatos más eficientes y permisibles. En la siguiente sección cubriremos uno de estos formatos llamado lista de aristas.

## Lista de Aristas

### ¿Qué son?

Una de las estructuras más económicas en la recopilación de datos, las listas de aristas solo consideran los vínculos existentes y excluyen lo demás. Por ejemplo, la matriz \@ref(eq:mat) puede ser colapsada como lista de aristas \@ref(eq:el).

::::{.row}
:::: {.lcolumn-50}
\begin{matrix}
  & A & B & C & D & E & F \\
A & - & 1 & 1 & 0 & 0 & 0 \\
B & 1 & - & 1 & 0 & 0 & 0 \\
C & 1 & 1 & - & 1 & 0 & 0 \\
D & 0 & 0 & 1 & - & 1 & 1 \\
E & 0 & 0 & 0 & 1 & - & 1 \\
F & 0 & 0 & 0 & 1 & 1 & - \\
(\#eq:mat)
\end{matrix}
::::

:::: {.rcolumn-50}
\begin{matrix}
Origen & Destino \\
A      & B       \\
A      & C       \\
B      & A       \\
B      & C       \\
C      & A       \\
C      & B       \\
C      & D       \\
D      & C       \\
D      & E       \\
D      & F       \\
E      & D       \\
E      & F       \\
F      & D       \\
F      & E      \\
(\#eq:el)
\end{matrix}
::::
::::

Esencialmente, una lista de aristas es un rectángulo con un mínimo de dos columnas, cada fila representa una combinación de nodos vinculados. @Cunningham2016 mencionan que aunque las listas de aristas pueden ser dirigidas o no dirigidas, es decir contienen arcos o bordes,  las columnas denotan un actor que “envía” el enlace y otro que “recibe” el enlace [@Cunningham2016]. En Gephi, el software denota estas posiciones con nombres obligatorios; es decir, que en términos de Gephi, la columna de “envía” siempre aparecerá nombrada “Origen” (o “Source” en Ingles). Similarmente, la columna “recibe” siempre aparecerá como “Destino” (o “Target” en Ingles”). Es importante recalcar que estos nombres son obligatorios en el proceso de importación de listas de aristas en Gephi. 

Tradicionalmente, los analistas de ARSo tienden a mantener sus listas de aristas en software como Microsoft Excel. Sin embargo, es posible integrar tablas de bases de datos (por ejemplo, SQL) como precursores. 

### ¿Por qué usarlas o no?

Las listas de aristas son comúnmente utilizadas por su simplicidad, eficiencia y versatilidad. Son eficientes pues no incluyen espacios vacíos para vínculos faltantes. Asimismo, el mantenerlas es simple pues cada fila representa una relación.  Adicionalmente so versátiles pues proveen flexibilidad en el numero y tipo de características de un vinculo que se pueden incluir. Como se ha mencionado previamente, el formato básico de una lista de aristas incluye dos columnas, sin embargo, no hay limite a la cantidad de variables que podemos agregar para describir cada vinculo, por ejemplo: dirigido/no dirigido, fecha, intensidad, tipo, peso, fuente de procedencia, etc.

Las Figuras \@ref(fig:el1), \@ref(fig:el2) y \@ref(fig:el3) son ejemplos de listas de aristas. La primera lista de aristas, Figura \@ref(fig:el1), contiene los elementos mínimos requeridos; es decir, dos columnas nombradas que representan los dos vértices conectados por un vínculo relacional. Cada fila representa una relación, sin embargo, no hay manera de diferenciar si estas relaciones son dirigidas/no dirigidas o si ambos vínculos representan el mismo tipo de relaciones (por ejemplo, familiares, financieras, románticas, etc.). Es por ello por lo que la segunda lista, Figura \@ref(fig:el2), expande sobre la primera al agregar un par de variables. En este ejemplo, las nuevas columnas permiten diferenciar el tipo de relación e incluso agregan información temporal y pesos a cada enlace. El último ejemplo, Figura \@ref(fig:el3), continúa expandiendo la lista de aristas y presenta una lista con múltiples tipos de relaciones y multimodo. Es decir, algunas relaciones son modo-uno, mientras que otras son modo-dos. 

<div class="figure" style="text-align: center">
<!--html_preserve--><div id="htmlwidget-ac96cb3ee4656e2e9ec3" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-ac96cb3ee4656e2e9ec3">{"x":{"filter":"none","data":[["A","B"],["B","C"]],"container":"<table class=\"cell-border stripe\">\n  <thead>\n    <tr>\n      <th>Origen<\/th>\n      <th>Destino<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"t","order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:el1)Lista de Aristas Básica</p>
</div>


<div class="figure" style="text-align: center">
<!--html_preserve--><div id="htmlwidget-e5c8c404fe174e4c81bd" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-e5c8c404fe174e4c81bd">{"x":{"filter":"none","data":[["A","B"],["B","C"],["Comunicación","Financiera"],["No dirigido","Dirigido"],["2020-11-03","2020-11-03"],[5,10]],"container":"<table class=\"cell-border stripe\">\n  <thead>\n    <tr>\n      <th>Origen<\/th>\n      <th>Destino<\/th>\n      <th>Relación<\/th>\n      <th>Tipo<\/th>\n      <th>Fecha<\/th>\n      <th>Peso<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"t","columnDefs":[{"className":"dt-right","targets":5}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:el2)Lista de Aristas Expandida</p>
</div>


<div class="figure" style="text-align: center">
<!--html_preserve--><div id="htmlwidget-36aa3d2a04d42bbc2145" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-36aa3d2a04d42bbc2145">{"x":{"filter":"none","data":[["A","B","A"],["B","C","1"],["Comunicación","Financiera","Afiliación"],["No dirigido","Dirigido","No dirigido"],["2020-11-03","2020-11-03","2020-11-03"],[5,10,7]],"container":"<table class=\"cell-border stripe\">\n  <thead>\n    <tr>\n      <th>Origen<\/th>\n      <th>Destino<\/th>\n      <th>Relación<\/th>\n      <th>Tipo<\/th>\n      <th>Fecha<\/th>\n      <th>Peso<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"t","columnDefs":[{"className":"dt-right","targets":5}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
<p class="caption">(\#fig:el3)Lista de Aristas Expandida y Multimodo</p>
</div>

## Lista de Nodos

La lista de nodos, a diferencia de la lista de aristas, contiene los datos no relacionales de cada nodo en un sociograma. Por consiguiente, es común que ambas listas sean mantenidas de manera independiente. 

Es decir, en una lista de aristas es probable que un nodo aparezca de manera repetida, es común que cada actor en una red este atado a múltiples otros. En contraste, en una lista de nodos es común (y recomendable) el tener a un solo registro por actor. Por ejemplo, en la lista de aristas \ref(eq:el4) vemos cuatro nodos {A, B, C, D} conectados por tres diferentes tipos de relaciones. La lista de nodos correspondiente \ref(eq:nl1) incluye información de estos nodos como género o edad, estas son características no relacionales de aquellos nodos en la red. Aunque podemos repetir el registro de cada actor, no es necesario normalmente el software solo toma en cuenta un solo registro, normalmente el último en la lista. 

:::: {.row}
:::: {.lcolumn-50}
\begin{matrix}
Origen & Destino & Relación \\
A      & B       & Amistad  \\
A      & C       & Familia  \\
A      & D       & Finanzas \\
(\#eq:el4)
\end{matrix}
::::

:::: {.rcolumn-50}
\begin{matrix}
Id & Género    & Edad \\
A  & Masculino & 20 \\
B  & Femenino  & 20 \\
C  & Femenino  & 20 \\
D  & Masculino & 29 \\
(\#eq:nl1)
\end{matrix}
::::
::::

Por su parte, Gephi es capaz de ingerir listas de nodos. Para ello, requiere que esta tabla contenga el nombre de columna `Id`. Esta variable representa la columna que el software tomara en cuenta como fuente de identificadores únicos para los nodos en una red. Por ejemplo, en la lista de aristas \ref(eq:nl1) vemos entradas correspondientes a los identificadores de cada nodo en la lista de aristas.


## Ejercicio Práctico

Este ejercicio tiene dos propósitos: 

  1. Proporcionarle práctica en recopilar datos
  2. Importar y manipular datos de modo-uno a Gephi
  
Las redes de modo-uno consisten de un conjunto único de actores, estos pueden ser personas, grupos, organizaciones, corporaciones, naciones, etc. Los lazos entre estos pueden ser lazos de amistad o parentesco, transacciones materiales (por ejemplo, transacciones comerciales), redes de comunicación (por ejemplo, él envió o la recepción de mensajes), etc. Para este ejercicio utilizaremos los datos recopilados por Stuart Koschade de la célula terrorista Jemaah Islamiyah (JI) responsable del atentado en Bali en el 2002. 

En esta actividad nos centraremos en las visualizaciones de red. Estas son importantes porque pueden ayudarnos a rastrear y detectar patrones de relaciones en una red social determinada. Sin embargo, puesto que el ojo humano puede ser engañado fácilmente, los analistas de redes sociales confían en algoritmos de dibujo de gráficos que colocan sistemáticamente a los actores en el “espacio social”. 

### Preparar y Visualizar Redes de Modo-Uno en Gephi

Localice el artículo de Stuart Koschade. La única versión disponible es en inglés, por consiguiente, no es requerido que lea el texto. Utilizando Excel (u otro programa con hojas de cálculo) registre los datos de redes sociales que figuran en la Tabla 2 en el artículo de Koschade. Su matriz debe ser similar a la Figura \@ref(fig:koschade) a continuación. 

<div class="figure" style="text-align: center">
<img src="images/02-Fig_1_Matrix_Excel.png" alt="Hoja de cálculo de Excel que muestra la matriz de datos en Koschade" width="100%" />
<p class="caption">(\#fig:koschade)Hoja de cálculo de Excel que muestra la matriz de datos en Koschade</p>
</div>

::::{.row}
::::{.lcolumn-20}
*[Vista general] > Nuevo Projecto*
::::
::::{.rcolumn-80}
  1. Abra Gephi y seleccione la opción *Nuevo proyecto* en la pantalla de “Bienvenido a Gephi” (no se muestra en este documento). Asegúrese de estar en la ventana “Vista general” en la esquina superior izquierda de la interfaz. Una vez allí, su interfaz deberá parecerse a la Figura \@ref(fig:gv). 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-Fig_2_General_View.png" alt="Ventana 'Vista general' en Gephi" width="100%" />
<p class="caption">(\#fig:gv)Ventana 'Vista general' en Gephi</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Archivo > Abrir…*
::::
::::{.rcolumn-80}
  2. Primero debemos importar los datos de recopilados en el primer paso a Gephi. Para hacer esto, use el comando *Archivo>Abrir…* Esto abrirá un cuadro de dialogo (no mostrado) desde el cual puede ubicar y seleccionar el archivo de Excel que creo anteriormente. Una vez que haya hecho esto, haga clic en *Abrir* y aparecerá un nuevo cuadro de dialogo, similar a la Figura \@ref(fig:import) Tenga en cuenta que, en la esquina superior derecha, tiene la opción de importa la hoja de cálculo en varios formatos. Como registramos los datos en matriz, utilizaremos la opción *Matriz*. Haga clic en *Siguiente*, en el siguiente cuadro de dialogo, haga clic en *Terminar* (puesto que no tenemos información de tiempo asociada con estos datos).
::::
::::
  
<div class="figure" style="text-align: center">
<img src="images/02-Fig_3_Importing_Gephi.png" alt="Ventana de Importación en Gephi" width="70%" />
<p class="caption">(\#fig:import)Ventana de Importación en Gephi</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Tipo de grafo > No dirigido*
 
*Mas opciones… > Estrategias para combinar aristas>Mínimo*
::::
::::{.rcolumn-80}
  3. Gephi produce un *Informe de importación* (ver Figura \@ref(fig:import-report)), que proporciona varios tipos de información, por ejemplo, si ocurrió algún error durante la importación, numero de nodos (actores) en la red, la cantidad de bordes (aristas), y así sucesivamente. Ahora, necesitamos decirle a Gephi que esta es una red no dirigida utilizando el menú desplegable *Tipo de grafico* (el tipo predeterminado es *Mixto*). A continuación, haga clic en el enlace *Mas opciones…*, y luego en el menú desplegable *Estrategia para combinar aristas* seleccione *Mínimo*. Este último paso asegura que los pesos de los bordes no se dupliquen. Ahora, haga clic en *Aceptar*.
::::
::::
  
<div class="figure" style="text-align: center">
<img src="images/02-Fig_4_Importing_Report.png" alt="Reporte de Importación Gephi" width="70%" />
<p class="caption">(\#fig:import-report)Reporte de Importación Gephi</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Apariencia > Nodos > Único*
::::
::::{.rcolumn-80}
  4. Su red ahora deberá estar cargada, pero probablemente no se vea bien. Comencemos cambiando el color de los nodos. En la esquina superior izquierda de la interfaz vera un pestana *Apariencia* (consulte la Figura \@ref(fig:apariencia)). Allí, seleccione la pestaña *Nodos* y el icono de paleta de color (que es el icono más a la izquierda). Debajo de la pestaña *Nodos* vera un rango de opciones, si no está seleccionada la pestaña *Único*, haga clic en esta. Debajo de esta opción, note un cuadro gris (a la izquierda de `#c0c0c0`); clic manténgalo presionado para seleccionar un nuevo color, luego seleccione *Aplicar*). 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-Fig-5_apariencia.png" alt="Pestaña de Apariencia " width="50%" />
<p class="caption">(\#fig:apariencia)Pestaña de Apariencia </p>
</div>


::::{.row}
::::{.lcolumn-20}
*Distribuicion>Fruchterman Reingold, Force Atlas, Expansion, Yifan Hu*
::::
::::{.rcolumn-80}
  5. Justo debajo de la pestaña *Apariencia* encontraraá otra de nombre *Distribución* (consulte la Figura \@ref(fig:diseno)). Gephi ofrece varias opciones de distribución de nodos, sobre las cuales poder aprender en la página de tutoriales de [Gephi](https://gephi.org/users/tutorial-layouts/).  En esta actividad solo exploraremos unos pocos. Utilizando el menú desplegable, primero seleccione el algoritmo de nombre *Fruchterman Reigold* y haga clic en el botón *Ejecutar*.   Dependiendo de la red, es posible que este algoritmo no sea el adecuado. Pruebe otros, por ejemplo *Force Atlas*. Al principio parecerá que los nodos han colapsado unos sobre otros, pero esto es engañoso. Para ver porque, elija la opción *Expansion* y haga clic repetidamente en el botón *Ejecutar* hasta que el grafico sea los suficientemente grande para poder distinguir las conexiones entre nodos. Finalmente. Pruebe el algoritmo *Yifan Hu*, el cual, al menos con la red de Koschade, produce el grafico más adecuado. Es decir, los subgrupos son fáciles de detectar y los nodos no se encuentran apilados unos sobre los otros. 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-Fig_6_Layout.png" alt="Pestaña de Diseño" width="50%" />
<p class="caption">(\#fig:diseno)Pestaña de Diseño</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Grafo*
::::
::::{.rcolumn-80}
  6. Estas manipulaciones deben crear un gráfico similar a la Figura ## (similar pues usted ha elegido el color de los nodos). Ahora, note lo diferentes botones al costado de la ventana del *Grafo* (ver Figura ##), estos nos permiten hacer algunos ajustes rápidos al grafo. Por ejemplo, el botón 1 centra el grafico, el 2 activa y desactiva las etiquetas, o puede controlar el tamaño de las etiquetas con la barra deslizante demarcada con el número 5. El botón 3 alterna el color de los nodos. Por último, note la flecha pequeña en la esquina inferior derecha (numero 6), en el siguiente paso y otros laboratorios utilizaremos esta opción.
::::
::::  
  

```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  7.	Al darle clic a la pequeña flecha (número 6 en la Figura ##), se debe levantar un panel con controles adicionales para manipular la red. El menú que debe es el de controles *Globales* (Figura ##). En este, quizás el control más útil es la barra deslizante de zoom (etiqueta 2), que controla el tamaño del gráfico. En la imagen de abajo he aumentado el tamaño de la red y he centrado la imagen presionando el botón derecho del ratón y arrastrando el gráfico hacia el centro de la ventana. Además de modificar la dimensión del gráfico, puede cambiar el fondo dando clic en el cuadro en la esquina inferior izquierda (etiqueta 1).
::::
::::  


```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```


```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  8.	En la Figura ## he seleccionado el panel de control de aristas, proceda haciendo lo mismo. Ahora, cambie el color de las aristas a gris (vea etiqueta 1 en la Figura ##) y use la barra deslizante (etiqueta 2) para reducir el ancho de cada línea. Finalmente, en la Figura 10 a continuación, seleccione la pestaña de etiquetas en el panel de control. Aquí, haga clic en el cuadro a un lado de *Nodos* (etiqueta 1 en la Figura 10) para activar las etiquetas de los nodos en el gráfico. Como verá estas serán inicialmente un poco grandes. Para ajustar estas cambie el tamaño estas utilizando la barra deslizante (etiqueta 3 en Figura 10). En Gephi siempre hay un par de maneras de hacer lo mismo. Por ejemplo, si selecciona el botón a un lado de “Fuentes” (etiqueta 2) note que puede cambiar múltiples propiedades de las etiquetas de cada nodo. El análisis de redes depende de gráficos claros y concisos. Tomo un par de minutos para modificar estas etiquetas a su gusto y cuando termine cierre el panel dando clic a la flecha (etiqueta 4) a mano derecha (ahora apuntando hacia abajo). 
::::
::::


```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  9.	Limpiemos el gráfico. Para esto, seleccione la pestaña de *Distribución* y seleccione la opción *Ajuste de etiquetas* y haga clic en *Ejecutar*. Este algoritmo de diseño moverá los nodos ligeramente para que las etiquetas no se superpongan. Ahora, seleccione la opción *Noverlap*, y nuevamente de clic en *Ejecutar*. Vera que nuevamente los nodos deberán moverse, creando una distancia entre ellos para que sean más fáciles de discernir. Ahora, observe el grafo. **¿Surge patrones? ¿Hay algún grupo distinto? Si es así, ¿alguna persona actúa como intermediario entre los distintos grupos? ¿Alguno de los individuos parece estas más aislado socialmente que otros? ¿Cómo se comparan los dibujos con la Figura 1 en el artículo de Koschade?**
::::
::::
 
::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  10.	Ahora, desplace el cursor sobre uno de los nodos, al hacer esto Gephi debe resaltar un nodo a la vez y los enlaces a otros nodos. En la Figura \@ref(fig:ego), presentamos el nodo de Patek resaltado, este tiene vínculos con varias personas dentro de su propia esfera de influencia, además algunos de estos nodos vecinos están conectados entre ellos. Sin embargo, note que los vecinos de Patek no están enlazados con Samudra. Utilizando esta herramienta (resaltar nodos) en su propio gráfico, **¿saltan patrones que no haya notado antes?** Finalmente, tome una captura de pantalla de su grafico dando clic en el icono de la cámara en la esquina inferior de la ventanilla del gráfico.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-Fig_10_Patek_Ego.png" alt="Red con Patek Resaltado" width="75%" />
<p class="caption">(\#fig:ego)Red con Patek Resaltado</p>
</div>

::::{.row}
::::{.lcolumn-20}
*[Laboratorio de datos]*

*Tabla de datos > Nodos*
::::
::::{.rcolumn-80}
  11.	Echemos un vistazo a los datos de la red. Para esto, seleccione el botón *Laboratorio de datos*. Notará que en la esquina superior izquierda hay una pestaña *Tabla de datos* con dos subpestañas , *Nodos* y *Aristas*. Haga clic primero en la pestaña *Nodos* y deberá ver una lista de los identificadores (`Id`) y etiquetas de los nodos (actores) en la red.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-Fig_11_Gephi_Edge_List.png" alt="Lista de Aristas en la Table de Datos" width="75%" />
<p class="caption">(\#fig:edges-table)Lista de Aristas en la Table de Datos</p>
</div>


::::{.row}
::::{.lcolumn-20}
*[Laboratorio de datos]*

*Tabla de datos > Aristas*
::::
::::{.rcolumn-80}
  12.	Ahora, haga clic en la pestaña *Aristas* y obtendrá una lista de todos los vínculos entre todos los actores (Figura \@ref(fig:edges-table)). Tenga en cuenta que esta información no se presenta en formato de matriz. En cambio, este formato llamaremos lista de bordes o lista de aristas. Estas enumeran un nodo de `Origen` (actor) y un nodo de `Destino` (actor), independientemente de si el enlace es dirigido o no. 
::::
::::

### Guardar Gráfico de Red en Gephi

::::{.row}
::::{.lcolumn-20}
*[Previsualización]*
::::
::::{.rcolumn-80}
  1. Ahora, veamos como guardar nuestro grafico de red. Para esto haga clic en el botón *Previsualización* para cambiar de espacio en Gephi. Al principio no ha de ver nada relevante, así que haga clic en el botón *Refrescar* en la parte inferior de la ventana. Esto resultara en un gráfico de red similar a la Figura \@ref(fig:preview).
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-Fig-12_preview.png" alt="Ventana de Previsualización" width="75%" />
<p class="caption">(\#fig:preview)Ventana de Previsualización</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Etiquetas de nodos > Mostrar etiquetas, Tamaño proporcional, Fuente*
::::
::::{.rcolumn-80}
  2. Definitivamente debemos hacer algunos ajustes en el panel izquierdo de la ventana. Comencemos seleccionando primero la opción *Mostrar etiquetas* y deseleccionar la opción *Tamaño proporcional* (esta reducirá el tamaño de las etiquetas) en la subsección “Etiquetas de nodo”. Una vez más haga clic en *Refrescar* para ver el efecto de los cambios. Si cree que las etiquetas siguen siendo demasiado grandes, haga clic en la opción *Fuente* (en la misma subsección) y podrá reducir el tamaño de la fuente. Nuevamente, deberá hacer clic en *Refrescar* para ver el efecto de los cambios.  
::::
::::

::::{.row}
::::{.lcolumn-20}
*Aristas > Mostrar aristas, Reescalar pesos*
::::
::::{.rcolumn-80}
  3. Ahora cambiemos las propiedades de las aristas. Haga clic en la opción *Mostrar aristas* (si no está autoseleccionada) en la subsección de *Aristas*. Además, seleccione la opción *Reescalar pesos*, esto reducirá el grosor de los enlaces. Tenga en cuenta que justo debajo de la opción *Reescalar pesos* están los valores predeterminado para la escalación de pesos. Si desea, puede modificar estos valores para el mínimo sea 0.2 y el máximo 2.0. Una vez más, seleccione *Refrescar*.
::::
::::

::::{.row}
::::{.lcolumn-20}
*Aristas > Color*
::::
::::{.rcolumn-80}
  4.	Por último, haga clic en el cuadro de opción de *Color* en la subsección de *Aristas*. Esto abrirá un cuadro de dialogo que permite elegir el color de los bordes. Elija la opción de color *Especifico* que abierta una paleta de colores de la cual usted puede elegir su propio color al gusto. Una vez que haya seleccionado un color, no olvide darle clic a *Refrescar*. 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-Fig-13_preview.png" alt="Ventana de Previsualización con Ajustes" width="75%" />
<p class="caption">(\#fig:preview2)Ventana de Previsualización con Ajustes</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Archivo > Guardar como*
::::
::::{.rcolumn-80}
  5. Ahora, guardemos nuestro gráfico. Gephi ofrece tres opciones de formato: SVG, PDF, y PNG. En la ventana de *Previsualización* de clic en el botón *SVG/PDF/PNG* a un lado de la etiqueta *Exportar* en la parte inferior izquierda de la ventana. Por ahora, exporte su grafico en `PNG`. Para hacer esto, elija *Archivos PNG (*.png)* en el menú desplegable. Adicionalmente, haga clic en el botón de “Opciones” en la parte inferior derecha. Esta opción abre otro cuadro de dialogo que permite aumentar el número de pixeles y la calidad de la imagen en el archivo producido. Seleccione *OK* sin cambiar las dimensiones de la imagen, cambie el nombre el archivo a producir, y guárdelo en su escritorio. Antes de pasar al siguiente paso guarde su trabajo con el comando *Archivo > Guardar como*.
::::
::::

### Importación de Listas de Aristas Modo-Uno

::::{.row}
::::{.lcolumn-20}
*[Vista General]*

*Archivo > Abrir*
::::
::::{.rcolumn-80}
  1. Ahora, veamos como importar una lista de aristas. Hemos preparado una para este ejercicio (**PLEASE PUT LINK TO DATA HERE**). Ábrala en Excel y examínela. Para importar vamos a repetir algunos pasos anteriores, use el comando *Archivo > Abrir* para abrir un cuadro de dialogo desde el cual puede importar el archivo de csv. Haga clic en *Abrir* y aparecerá un nuevo cuadro de dialogo, similar a la Figura ##. Tenga en cuenta que, una vez más, tenemos la opción de importar varias estructuras de datos, pero Gephi ha auto detectado que el archivo es una lista de aristas, de clic en *Siguiente*. En la siguiente venta, Gephi ofrece opciones para indicar que tipo de datos se incluirán, por ejemplo, la columna `Peso`. Ya que los valores predeterminados son adecuados, haga clic en *Finalizar*.
::::
::::
  

```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

::::{.row}
::::{.lcolumn-20}
*[Laboratorio de datos]*

*Tabla de datos > Nodos*
::::
::::{.rcolumn-80}
  2.	Ahora, deberá ver un cuadro de informe de importación de Gephi (parecido a la Figura 4). Dígale a Gephi que la red no es dirigida, seleccione la estrategia *Mínima* de combinación de aristas y haga clic en *Aceptar*. Ahora que hemos terminado de importar, cambie la ventana a *Laboratorio de datos* y haga clic en *Tabla de datos>Nodos*. Tenga en cuenta que no hasta ahora no hay etiquetas adjuntas a los nodos, solo identificadores (`Id`). 
::::
::::

::::{.row}
::::{.lcolumn-20}
*Copiar dataos a otra columna > Id*

*Label > Ok*
::::
::::{.rcolumn-80}
  3.	Para agregar etiquetas a estos nodos vamos a copiar los identificadores de cada nodo a la columna de etiquetas (`Label`). Seleccione la función *Copiar datos a otra columna* (botón ubicado en la parte inferior de la ventana) y seleccione `Id`. En el cuadro de dialogo que aparecerá, seleccione `Label` y haga clic en *Ok*. 
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Archivo > Abrir*
::::
::::{.rcolumn-80}
  4.	Ahora, importemos los datos de atributos, específicamente `roles`. Seleccione el comando *Archivo > Abrir* y localice el archivo (**PLEASE PUT LINK TO DATA HERE**). En el cuadro de dialogo, indique que es una *Tabla de nodos* en la opción *Importar como:* y de clic en *Siguiente*. Acepte los valores predeterminados de Gephi y de clic en *Finalizar*. Acepte los valores predeterminados, excepto que esta vez en *Informe de importación* cambie la opción de *Nuevo espacio de trabajo* a *Anadir al espacio de trabajo existente* y de clic en *Aceptar*.
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Laboratorio de datos]*
::::
::::{.rcolumn-80}
  5.	Los nuevos atributos deben aparecer en la bajo la pestaña de *Nodos* en el *Laboratorio de datos*. Allí deberá ver una nueva columna de `Role`, que contiene una serie de números indicativos de los diferentes roles de los actores en la red: 
  
  -	1 = Equipo de Comando
  -	2 = Fabricantes de Bombas
  -	3 = Asistente Operacionales
  -	4 = Equipo Lima
  -	5 = Bombarderos Suicidas
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Apariencia*
*Nodos > Partición > Color > --Escoge un atributo > role*
::::
::::{.rcolumn-80}
  6.	Cambie a la ventana de *Vista general* y modifique el grafico como lo hizo anteriormente. Esta vez coloree los nodos según los nodos de los actores. Para hacer esto, primero seleccione *Nodos > Partición > Color* en la ventanilla de *Apariencia*. Utilizando el menú desplegable *Elija un atributo*, seleccione `rol` y haga clic en *Aplicar* (consulte la Figura ##). De forma predeterminada, el color de los arcos reflejara el color del actor de origen. Noten que puede cambiar el color de todas las aristas en el menú de *Aristas* a un lado de *Nodos*.
::::
::::

::::{.row}
::::{.lcolumn-20}
*Archivo>Guardar como…*

*Archivo > Exportar > Archivo de grafo…*
::::
::::{.rcolumn-80}
  7.	Antes de pasar a la última parte de este ejercicio, guarde su trabajo utilizando los comandos *Archivo > Guardar como…*, y luego expórtelo como un archivo Pajek con *Archivo > Exportar > Archivo de grafo…* (en la siguiente ventana asegúrese de guardar el archivo como tipo *Archivos NET (Pajek) (.net)*). En esta clase no vamos a utilizar el software Pajek, pero el formato `.net` es un estándar en ARSo y es comúnmente utilizado por diferentes herramientas de software. Por esto, utilizaremos este tipo de archivo como un método conveniente para mover datos entre programas. 
::::
::::


```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

