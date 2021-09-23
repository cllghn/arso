---
output: html_document
bibliography: book.bib
always_allow_html: yes
---



# Múltiples Relaciones

Hasta este punto, solo hemos trabajado con un tipo (modo-uno o modo-dos) de relaciones a la vez. Sin embargo, en el mundo real los actores incrustados en redes sociales se encuentran entrelazados los unos con otros por múltiples relaciones [@Hanneman2005]. Visualice su red social, es decir, los círculos sociales en los que usted se encuentra involucrado. ¿Qué relaciones ha considerado? Es probable que incluya vínculos familiares, amistosos, profesionales, membresía ligas de deportes o clubes religiosos. El punto clave es que las redes sociales constan de múltiples tipos de relaciones que unen a los actores. 

Por consiguiente, los analistas de redes trabajan con múltiples relaciones para poder abarcar la gama de interacciones en un sistema social. En este capítulo, cubriéremos algunas técnicas utilizadas al trabajar con múltiples tipos de relaciones, tomando pauta para recalcar las ventajas y desventajas de diferentes enfoques. Concluiremos con un ejercicio práctico en Gephi que le dará la oportunidad de utilizar estos conceptos. 

## Matrices y Listas de Aristas

Empecemos por considerar como trabajar con múltiples relaciones utilizando matrices. Las matrices subsecuentes (\@ref(eq:mat1) y \@ref(eq:mat2)) representan dos relaciones diferentes, la matriz izquierda contiene relaciones familiares y la matriz derecha financieras. Por separado, cuentan una historia diferente de los miembros de la red.

:::: {.row}
:::: {.lcolumn-50}
\begin{matrix}
  & A & B & C & D & E & F \\
A & 0 & 1 & 1 & 0 & 0 & 0 \\
B & 1 & 0 & 1 & 0 & 0 & 0 \\
C & 1 & 1 & 0 & 0 & 0 & 0 \\
D & 0 & 0 & 0 & 0 & 1 & 1 \\
E & 0 & 0 & 0 & 1 & 0 & 1 \\
F & 0 & 0 & 0 & 1 & 1 & 0 \\
(\#eq:mat1)
\end{matrix}
::::

:::: {.rcolumn-50}
\begin{matrix}
  & A & B & C & D & E & F \\
A & 0 & 0 & 0 & 0 & 0 & 0 \\
B & 0 & 0 & 0 & 0 & 0 & 0 \\
C & 0 & 0 & 0 & 1 & 0 & 0 \\
D & 0 & 0 & 1 & 0 & 0 & 0 \\
E & 0 & 0 & 0 & 0 & 0 & 0 \\
F & 0 & 0 & 0 & 0 & 0 & 0 \\
(\#eq:mat2)
\end{matrix}
::::
::::

El objetivo es analizar la combinación de estas relaciones de manera que podamos identificar los límites de la red. La Figura \@ref(fig:combined) es una representación de los datos descritos previamente en formato de sociomatriz. El grafo incluye dos triadas cerradas que consisten de miembros familiares, los cuales se unen por una relación financiera. 

<div class="figure" style="text-align: center">
<img src="02-multiple-networks_files/figure-html/combined-1.png" alt="Múltiples Relaciones" width="70%" />
<p class="caption">(\#fig:combined)Múltiples Relaciones</p>
</div>

Como hemos mencionado previamente, el recopilar información en sociomatrices es laborioso e ineficiente. Por consíguete, al recopilar múltiples tipos de relaciones es sugerible utilizar una lista de aristas, el formato básico de dos columnas puede ser expandido para incluir una columna clasificando el tipo de vínculo. Recuerde que en una lista de aristas cada fila representa un vínculo, por lo tanto, es posible apilar relaciones de la siguiente manera:


```{=html}
<div id="htmlwidget-38a41005a5865268ad45" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-38a41005a5865268ad45">{"x":{"filter":"none","vertical":false,"data":[["A","A","B","D","D","E","C"],["B","C","C","E","F","F","D"],["Familiar","Familiar","Familiar","Familiar","Familiar","Familiar","Financiera"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>Origen<\/th>\n      <th>Destino<\/th>\n      <th>Relación<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"t","order":[],"autoWidth":false,"orderClasses":false,"rowCallback":"function(row, data, displayNum, displayIndex, dataIndex) {\nvar value=data[2]; $(row).css({'background-color':value == \"Familiar\" ? \"#e41a1c\" : value == \"Financiera\" ? \"#018571\" : null});\n}"}},"evals":["options.rowCallback"],"jsHooks":[]}</script>
```

El incorporar múltiples relaciones en una sola lista con una variable categórica, permite la importación de datos de manera efectiva. Sin embargo, es común encontrar analistas que mantienen sus relaciones en múltiples archivos por propósitos de manipulación de datos. 

## Combinar

El combinar datos relacionales en ARSo se puede lograr mediante differentes métodos. @Cunningham2016 proponen tres técnicas: apilar, agregar y recombinar. En esta sección discutiremos las tres. 

### Apilar

El apilar es una técnica comúnmente utilizada por analistas para mantener y utilizar múltiples relaciones de manera independiente [@Cunningham2016]. La mantener e incorporar estos archivos varia con base a la herramienta de software. Por ejemplo, las matrices subsecuentes (\@ref(eq:mat3) y \@ref(eq:mat4)) contienen relaciones de manera independiente, al apilarlas podemos crear un gráfico (ver Figura \@ref(fig:apiladas)) que incorpora ambas sin tener que unir estos datos; por consiguiente, todos los datos se mantienen íntegros.

:::: {.row}
:::: {.lcolumn-50}
\begin{matrix}
  & A & B & C & D & E & F \\
A & 0 & 1 & 1 & 0 & 0 & 0 \\
B & 1 & 0 & 1 & 0 & 0 & 0 \\
C & 1 & 1 & 0 & 0 & 0 & 0 \\
D & 0 & 0 & 0 & 0 & 1 & 1 \\
E & 0 & 0 & 0 & 1 & 0 & 1 \\
F & 0 & 0 & 0 & 1 & 1 & 0 \\
(\#eq:mat3)
\end{matrix}
::::

:::: {.rcolumn-50}
\begin{matrix}
  & A & B & C & D & E & F \\
A & 0 & 0 & 0 & 0 & 0 & 0 \\
B & 0 & 0 & 0 & 0 & 1 & 0 \\
C & 0 & 0 & 0 & 1 & 0 & 0 \\
D & 0 & 0 & 1 & 0 & 0 & 0 \\
E & 0 & 1 & 0 & 0 & 0 & 0 \\
F & 0 & 0 & 0 & 0 & 0 & 0 \\
(\#eq:mat4)
\end{matrix}
::::
::::

<div class="figure" style="text-align: center">
<img src="02-multiple-networks_files/figure-html/apiladas-1.png" alt="Relaciones Apiladas" width="70%" />
<p class="caption">(\#fig:apiladas)Relaciones Apiladas</p>
</div>

El objetivo de apilar es el poder agregar o remover datos al análisis con base en las necesidades del analista. Algunas plataformas de software tratan datos apilados como separados y por consiguiente calculan las medidas de cada matriz de manera independiente. Por ejemplo, el contar vínculos de las matrices  apiladas previamente (\@ref(eq:mat3) y \@ref(eq:mat4)) produce dos valores, 6 y 2. Es por ello, que usualmente el apilar relaciones solo se utiliza como una herramienta visual.

### Agregar

Como lo sugiere el nombre, agregar es una técnica que consiste en crear una nueva red de un conjunto de relaciones; usualmente, sumando las relaciones en un nuevo producto [@Cunningham2016]. Nuevamente, el proceso de agregar relaciones varia con base al programa de software. Sin embargo, podemos visualizar el proceso utilizando una sumación de matrices. Por ejemplo, las matrices \@ref(eq:mat5) y \@ref(eq:mat6) representan dos tipos de relaciones asimétricas. Note que ambas matrices constan del mismo número de filas y columnas, lo cual es requerido para sumar matrices.

:::: {.row}
:::: {.lcolumn-50}
\begin{matrix}
  & A & B & C & D \\
A & 0 & 1 & 1 & 0 \\
B & 1 & 0 & 1 & 0 \\
C & 1 & 1 & 0 & 0 \\
D & 0 & 0 & 0 & 0 \\
E & 0 & 0 & 0 & 1 \\
F & 0 & 0 & 0 & 1 \\
(\#eq:mat5)
\end{matrix}
::::

:::: {.rcolumn-50}
\begin{matrix}
  & A & B & C & D \\
A & 0 & 0 & 0 & 0 \\
B & 0 & 0 & 0 & 0 \\
C & 0 & 0 & 0 & 1 \\
D & 0 & 0 & 1 & 0 \\
E & 0 & 1 & 0 & 0 \\
F & 0 & 0 & 0 & 0 \\
(\#eq:mat6)
\end{matrix}
::::
::::

El proceso en este ejemplo es simple, se suman las entradas correspondientes (ver \@ref(eq:matsum)) y genera una nueva matriz producto. Aquí el producto de la suma se representa en la Figura \@ref(fig:agregadas). Sin embargo, diferentes herramientas de software incluyen modificaciones de esta operación como el tomar un promedio de valores correspondientes, o solo incluir el valor mínimo o máximo, etc.

\begin{equation}
\begin{matrix}
  & A & B & C & D \\
A & 0 & 1 & 1 & 0 \\
B & 1 & 0 & 1 & 0 \\
C & 1 & 0 & 0 & 0 \\
D & 0 & 0 & 1 & 0
\end{matrix}

\enspace + \enspace

\begin{matrix}
  & A & B & C & D \\
A & 0 & 1 & 0 & 0 \\
B & 0 & 0 & 0 & 0 \\
C & 0 & 0 & 0 & 1 \\
D & 0 & 0 & 1 & 0
\end{matrix}

\enspace = \enspace

\begin{matrix}
  & A & B & C & D \\
A & 0 & 2 & 1 & 0 \\
B & 1 & 0 & 1 & 0 \\
C & 1 & 0 & 0 & 2 \\
D & 0 & 0 & 1 & 0
\end{matrix}
(\#eq:matsum)
\end{equation}


<div class="figure" style="text-align: center">
<img src="02-multiple-networks_files/figure-html/agregadas-1.png" alt="Relaciones Agregadas" width="70%" />
<p class="caption">(\#fig:agregadas)Relaciones Agregadas</p>
</div>

El agregar redes tiene ventajas y desventajas. Permite consolidar datos antes de ejecutar medidas. Sin embargo, al consolidarlos perdemos información acerca del tipo de vínculo. Por ejemplo, en la matriz producto anterior vemos algunos valores de “2”, los cuales corresponden a la presencia de vínculos precursores en ambas matrices. Sin embargo, para los vínculos con un valor de “1” es imposible determinar a qué categoría o matriz precursora pertenece dicho vínculo sin evaluar las entradas correspondientes. Por consiguiente, los analistas de redes tienden a agregar datos y retener los conjuntos precursores.

### Recombinar

Ocasionalmente al trabajar con datos de redes encontraremos situaciones en las cuales es necesario evaluar si la presencia de un enlace es suficiente evidencia para determinar la conexión entre dos actores. Particularmente al trabajar con redes oscuras donde las actividades se mantienen encubiertas, el triangular una relación a menudo requiere utilizar umbrales o filtros para confirmar una conexión entre actores [@Cunningham2016]. 

@Cunningham2016 da un ejemplo práctico de recombinación redes. Supongamos que tenemos dos redes modo-dos. La primera (ver \@ref(eq:mat7)) vincula a personas con ubicaciones. La segunda (ver \@ref(eq:mat8)) vincula personas con roles operacionales. 

:::: {.row}
:::: {.lcolumn-50}
\begin{matrix}
  & Lima & Cusco & Arequipa \\
A & 0    & 0     & 1        \\
B & 0    & 0     & 1        \\
C & 1    & 0     & 0        \\
D & 0    & 1     & 0        \\
E & 0    & 1     & 0        \\
F & 0    & 1     & 0        \\
G & 0    & 1     & 0        \\
H & 0    & 1     & 0        \\
I & 1    & 0     & 0        \\
J & 1    & 0     & 0        \\
K & 0    & 0     & 1        \\
(\#eq:mat7)
\end{matrix}
::::

:::: {.rcolumn-50}
\begin{matrix}
  & Finanza & Logística & Operativo \\
A & 1        & 0         & 0         \\
B & 1        & 0         & 0         \\
C & 1        & 0         & 0         \\
D & 0        & 1         & 0         \\
E & 0        & 1         & 0         \\
F & 0        & 0         & 1         \\
G & 0        & 0         & 1         \\
H & 1        & 0         & 0         \\
I & 0        & 1         & 0         \\
J & 1        & 0         & 0         \\
K & 1        & 0         & 0         \\
(\#eq:mat8)     
\end{matrix}
::::
::::

El vincular a todas las personas en una ubicación no siempre es adecuado, por ejemplo, en una ciudad de millones de habitantes es probable que dos personas que residen en dicha ciudad no se conozcan. Similarmente, el hecho de que dos personas compartan el mismo rol operacional en una organización no significa que estas estén enlazadas. Sin embargo, podemos recombinar nuestros datos para generar una sociomatriz donde actores en la misma ubicación y con el mismo rol operacional comparten un vínculo mutuo. Para ello, utilizamos los siguientes pasos:

\begin{equation}

\begin{matrix}
  & Lima & Cusco & Arequipa \\
A & 0    & 0     & 1        \\
B & 0    & 0     & 1        \\
C & 1    & 0     & 0        \\
D & 0    & 1     & 0        \\
E & 0    & 1     & 0        \\
F & 0    & 1     & 0        \\
G & 0    & 1     & 0        \\
H & 0    & 1     & 0        \\
I & 1    & 0     & 0        \\
J & 1    & 0     & 0        \\
K & 0    & 0     & 1        \\
\end{matrix}

\enspace \times \enspace

\begin{matrix}
         & A & B & C & D & E & F & G & H & I & J & K \\
Lima     & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 & 1 & 1 & 0 \\
Cusco    & 0 & 0 & 0 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 \\
Arequipa & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1
\end{matrix}

\\
\\
\\
\\
\enspace \circ \enspace
\\
\\
\\
\\

\begin{matrix}
  & Finanza & Logística & Operativo \\
A & 1        & 0         & 0         \\
B & 1        & 0         & 0         \\
C & 1        & 0         & 0         \\
D & 0        & 1         & 0         \\
E & 0        & 1         & 0         \\
F & 0        & 0         & 1         \\
G & 0        & 0         & 1         \\
H & 1        & 0         & 0         \\
I & 0        & 1         & 0         \\
J & 1        & 0         & 0         \\
K & 1        & 0         & 0         \\
\end{matrix}

\enspace \times \enspace

\begin{matrix}
          & A & B & C & D & E & F & G & H & I & J & K \\
Finanza   & 1 & 1 & 1 & 0 & 0 & 0 & 0 & 1 & 0 & 1 & 1 \\
Logística & 0 & 0 & 0 & 1 & 1 & 0 & 0 & 0 & 1 & 0 & 0 \\
Operativo & 0 & 0 & 0 & 0 & 0 & 1 & 1 & 0 & 0 & 0 & 0
\end{matrix}

\end{equation}

El proceso es simple, primero cada matriz de incidencia (\@ref(eq:mat7) y \@ref(eq:mat8)) para recombinar se debe multiplicar por su matriz equivalente transpuesta, como se presento en la sección de [Proyección]. Puesto que el objetivo es recombinar los enlaces, el siguiente paso es multiplicar las matrices resultantes utilizando el producto Hadamard (operación por elementos) que vimos previamente. Esta última operación genera una sociomatriz modo-uno donde los nodos se encuentran enlazados si viven en la misma ubicación y comparten el mismo rol operacional (ver \@ref(eq:hadd) y \@ref(fig:recombinar)).

\begin{matrix}
  & A & B & C & D & E & F & G & H & I & J & K \\
A & - & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 \\
B & 1 & - & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1 \\
C & 0 & 0 & - & 0 & 0 & 0 & 0 & 0 & 0 & 1 & 0 \\
D & 0 & 0 & 0 & - & 1 & 0 & 0 & 0 & 0 & 0 & 0 \\
E & 0 & 0 & 0 & 1 & - & 0 & 0 & 0 & 0 & 0 & 0 \\
F & 0 & 0 & 0 & 0 & 0 & - & 1 & 0 & 0 & 0 & 0 \\
G & 0 & 0 & 0 & 0 & 0 & 1 & - & 0 & 0 & 0 & 0 \\
H & 0 & 0 & 0 & 0 & 0 & 0 & 0 & - & 0 & 0 & 0 \\
I & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & - & 0 & 0 \\
J & 0 & 0 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & - & 0 \\
K & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & - \\
(\#eq:hadd) 
\end{matrix}

<div class="figure" style="text-align: center">
<img src="02-multiple-networks_files/figure-html/recombinar-1.png" alt="Relaciones Recombinar" width="70%" />
<p class="caption">(\#fig:recombinar)Relaciones Recombinar</p>
</div>

Además de multiplicaciones de matriz, existen múltiples otras estrategias para recombinar relaciones. Sin embargo, esta discusión será continuada más adelante. Por ahora, solo nos enfocaremos en familiarízalo con el concepto de recombinación. 

## Ejercicio Práctico

Los datos que utilizaremos son los datos de la red del Monasterio Sampson recopilados por Samuel Sampson, quien registró las interacciones sociales entre un grupo de hombres preparándose para unirse a una orden monástica. Grabó cuatro tipos de "lazos" entre estos actores: gusto (en tres períodos de tiempo diferentes) y disgusto (un período de tiempo); alta y baja estima; influencia positiva y negativa; alabanza y culpa. Es decir, este conjunto de datos tiene nominaciones positivas y negativas. Cada novicio clasificó sus tres preferencias para cada tipo de enlace, donde 3 indica su primera opción, 2 la segunda y 1 la tercera. Por ello, los vínculos son ponderados.

Durante el período de observación de Sampson, ocurrió una "crisis en el claustro" en respuesta a algunos de los cambios propuestos por el Concilio Vaticano II. Esto condujo a la expulsión de cuatro novicios y la partida voluntaria de varios otros. Según sus observaciones, Sampson dividió (es decir, ordenó y clasifico) a los novatos en cuatro grupos: (1) los jóvenes turcos, (2) la oposición leal, (3) los marginados y (4) los neutrales. Los jóvenes turcos llegaron más tarde y cuestionaron las prácticas del monasterio, a diferencia de la oposición leal que defendieron estas prácticas. Los marginados eran novatos que no fueron aceptados en el grupo principal, mientras que los neutrales fueron aquellos que no tomaron partido en el debate sobre las prácticas del monasterio. La mayor parte de la oposición leal había asistido a un seminario, "Cloisterville", antes de su llegada al monasterio.

### Importar múltiples redes a Gephi

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Archivo > Abrir*
*Importar como > Tabla de nodos*
*Separador > Coma* 
::::
::::{.rcolumn-80}
  1.	Para "apilar" redes en Gephi, cargaremos redes por separado. Por esto, encontramos nuestros datos de red en formato de tablas de nodos y de aristas.  Comience importando la tabla de nodos de Sampson, que puede descargar [aquí](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/sampson_nodes.csv). Para hacerlo, use el comando *Archivo > Abrir*. Asegúrese de que Gephi reconozca que la hoja de cálculo como una tabla de nodos y separada por comas. Dado que esta hoja de cálculo solo consta de nodos y sus atributos, en el informe de importación no tiene que preocuparse por las opciones. Sin embargo, debemos ser un poco más selectivos cuando importamos las listas de borde. Después de importar la tabla de nodos, examine brevemente los datos en la ventana *Laboratorio de datos*. 
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Archivo > Abrir*
*Importar como > Tabla de aristas*
*Separador > Coma* 
::::
::::{.rcolumn-80}
  2.	Use el comando *Archivo > Abrir* para importar el archivo `Liking 1.csv`, que puede descargar [aquí](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/liking_1.csv) . En el primer cuadro de diálogo (Figura \@ref(fig:aristas)), asegúrese de que Gephi sepa que es una tabla de aristas y que los datos están separados por comas. Haga clic en *Siguiente* y en el siguiente cuadro de diálogo (no se muestra) acepte los valores predeterminados de Gephi y haga clic en *Terminar*. En el *Informe de importación* (Figura \@ref(fig:importacion)), indique que los datos no son dirigidos, no desea mezclar los bordes, pero sí desea agregar los datos al espacio de trabajo existente. Luego haga clic en *Aceptar*.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-06-01_aristas.png" alt="Importar lista de aristas" width="70%" />
<p class="caption">(\#fig:aristas)Importar lista de aristas</p>
</div>

<div class="figure" style="text-align: center">
<img src="images/02-06-02_reporte.png" alt="Reporte de Importación" width="70%" />
<p class="caption">(\#fig:importacion)Reporte de Importación</p>
</div>

::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  3.	Repita el proceso para importar las nueve listas de aristas restantes (descarguelas individualmente: [`blame.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/blame.csv), [`dislike.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/dislike.csv), [`high_esteem.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/dislike.csv), [`liking_2.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/liking_2.csv), [`linking_3.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/liking_3.csv), [`low_esteem.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/low_esteem.csv), [`negative_influence.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/negative_influence.csv), [`positive_influence.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/positive_influence.csv), y [`praise.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/multiple_networks/praise.csv)). **Tenga cuidado al importar cada archivo, fijese en importar cada relación al espacio de trabajo existente.** Note que en el *Informe de importación* para cada lista de aristas, Gephi mantendrá seleccionadas la mayoría de las opciones anteriores, pero no *Nuevo espacio de trabajo*. Cada vez que importe un nuevo conjunto de vínculos, el gráfico parecerá cada vez más denso. Esto se debe a que cada vez que importa una nueva relación, agrega vínculos a la red. Si seleciona la *Tabla de bordes* en la ventana *Laboratorio de datos* y luego se desplaza hacia abajo, verá que cada conjunto de vínculos (relaciones) se apilan unos sobre otros.
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Appearance > Edges*
*Color > Partición*
*--Escoge un atribute > relation > Apply*

*Paleta... > Generar*
::::
::::{.rcolumn-80}
  4.	En la ventana *Vista general*, ubique la pestaña *Apariencia* y luego haga clic en la pestaña *Aristas*, luego en el ícono de la paleta de colores, luego en *Partición* y luego con el menú desplegable *--Escoge un atributo*, seleccione *relation* (en español: relación) y haga clic en *Aplicar*. Recuerde que el número predeterminado de colores de partición de Gephi es ocho, pero aquí tenemos 10 tipos de vínculos (relaciones). Por lo tanto, haga clic en el enlace *Paleta ...*, y en el cuadro de diálogo, seleccione *Generar*, al igual que nosotros hizo anteriormente, cambie el número de colores a 10 y genere un nuevo conjunto de colores. Una vez más, haga clic en *Aplicar*. El gráfico de red probablemente se verá un poco colorido (Figura \@ref(fig:apilada)). Esto se debe a que cada conjunto de bordes está coloreado por una sola clasificación.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-06-03_apilada.png" alt="Red apilada de datos Monasterio de Sampson" width="70%" />
<p class="caption">(\#fig:apilada)Red apilada de datos Monasterio de Sampson</p>
</div>


::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  5.	Ahora podríamos aplicar uno de los algoritmos de diseño para hacer el gráfico más atractivo, pero por la combinación de vínculos positivos y negativos, el gráfico podría ser engañoso. **¿Por qué?** En las siguientes secciones extraeremos diferentes conjuntos de relaciones y las examinares por separado. Antes de esto, guarde su trabajo en un archivo de Gephi.
::::
::::

### Extrayendo y visualizando múltiples lazos en Gephi

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Filtros > Atributos > Partición*

*Consultas > Partición > Filtrar > Exportar gráfico filtrado a un nuevo espacio de trabajo*

::::
::::{.rcolumn-80}
  1.	Extraer múltiples relaciones en Gephi es similar a extraer un subconjunto de red basado en atributos de nodo, que hemos hecho previamente. En esta sección, separaremos los enlaces positivos de la red apilada. En la pestaña *Filtros* a la derecha, primero seleccione *Atributos*, luego *Partición*. Arrastre la partición *relation* a la sección *Consultas*. En el cuadro debajo de la sección Consultas, seleccione `Liking 3` (Me gusta 3), `Positive Influence` (Influencia positiva), `High Esteem` (Alta estima) y `Praise` (Elogio). Luego haga clic en *Filtar* y use el botón *Exportar gráfico filtrado a un nuevo espacio de trabajo*.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-06-04_positivos.png" alt="Enlaces positivos de la red Monasterio de Sampson" width="70%" />
<p class="caption">(\#fig:positivos)Enlaces positivos de la red Monasterio de Sampson</p>
</div>


::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Espacio de Trabajo > Renombrar*
*Diseño > Yifan Hu*
::::
::::{.rcolumn-80}
2.	En el nuevo espacio de trabajo, que puede renombrar `Vínculos positivos`, aplique el algoritmo de diseño Yifan Hu. Los nodos probablemente estarán demasiado apegados y será difícil distinguir cualquier patrón. Para rectificar esto, en el cuadro debajo del menú desplegable del algoritmo de diseño, cambie la *Distancia óptima* de 100 a 600 y haga clic en *Ejecutar*. Usando algunas de las otras técnicas discutidas en ejercicios practicos anteriores, termine de modificar la red de lazos positivos en la red del Monasterio Sampson. La Figura \@ref(fig:positivos) es un ejemplo. Como antes, el color de los lazos refleja varios tipos de relaciones. Si no le gusta el color que heredaron cuando exportó el gráfico a este espacio de trabajo, puede volver a la pestaña *Apariencia*, hacer clic en *Aristas*, luego en el icono de la paleta de colores, luego en la opción *Particiones*, y luego con el menú desplegable *Elegir un atributo*, seleccione *relation* y haga clic en *Aplicar*. Exporte su grafico de relaciones positivas con etiquetas. **¿Qué patrones observa? ¿Qué nodos son centrales? ¿Qué significa ser central en esta red? (Tome en cuenta los tipos de enlaces).**
::::
::::
