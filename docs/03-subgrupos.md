---
output: html_document
---

# Subgrupos Cohesivos

En este capítulo, exploraremos algunos (pero no todos) métodos para hallar subgrupos cohesivos de actores dentro de una red social. Los subgrupos cohesivos son subconjuntos de actores entre los cuales existen lazos fuertes, por ello los métodos que utilizaremos formalizan la noción de un grupo social utilizando las propiedades estructurales de una red social [@Wasserman1994].

En esta breve introducción cubriremos componentes, núcleos, grupos Newman y grupos de Louvain. Para poner este nuevo conocimiento en práctica, el capitulo concluye con un ejercicio practico de como implementar estas medidas en Gephi.

## Componentes

Estos son la forma mas simple de subgrupos cohesivos en ARSo. Simplemente, representan subredes en las cuales los miembros están conectados los unos a los otros (directa o indirectamente) pero no a miembros de otras subredes [@Everton2012:171]. Los componentes pueden ser divididos en dos campos, fuertes o débiles. 

### Componentes Débiles

Los nodos en un grafo desconectado se pueden dividir en dos o mas subconjuntos de manera que no haya caminos entre los nodos en diferentes conjuntos [@Wasserman1994], estos subconjuntos del grafo se llaman componentes débiles. Localizar componentes débiles es apropiado para datos dirigidos o no dirigidos, puesto que el objetivo es localizar subconjuntos conectados. Tome por ejemplo la Figura \@ref(fig:weakcomp). En esta imagen, el color de los nodos denota el componente débil al que pertenecen. Como ve, encontramos tres componentes débiles en dicho gráfico, uno con cinco actores, una diada, y un aislado. 

<img src="03-subgrupos_files/figure-html/weakcomp-1.png" width="70%" style="display: block; margin: auto;" />

El detectar componentes débiles no solo sirve para colorear los grafos, de hecho, una de las aplicaciones mas comunes es el aislar componentes. Por ejemplo, la densidad de el grafo en la Figura \@ref(fig:weakcomp) es 0.25. Este índice sugiere una red escarza, sin embargo, de manera visual podemos ver que algunos componentes son más densos que otros. Por ejemplo, el componente principal, aquel de mayor tamaño en un conjunto de subcomponentes, aparenta ser mas denso. Es por ello que podemos aislar este componente principal y al ejecutar la medida de densidad, vemos un valor de 0.6. Otra manera de pensar en este proceso es que nos permiten enfocarnos en diferentes subconjuntos del grafo en nuestro análisis. 

### Componentes Fuertes

Este tipo de subgrupo solo es adecuado cuando los datos son dirigidos. @Easley2010 define los componentes fuertes en un grafo dirigido como subconjuntos de nodos en los cuales (A) que todos los nodos en el subconjunto pueden alcanzarse entre si y  (B) el subconjunto no es parte de un conjunto mayor con la propiedad de que todos los nodos pueden llegar a todos los demás [@Easley2010:388]. Este tipo de subgrupo solo es adecuado cuando los datos son dirigidos. Por ejemplo, en la Figura \@ref(fig:strongcomp) el color de los nodos nuevamente denota membresía a un subcomponente fuerte.

<img src="03-subgrupos_files/figure-html/strongcomp-1.png" width="70%" style="display: block; margin: auto;" />

Observe que en esta ocasión encontramos cuatro componentes fuertes, el primero se encuentra compuesto por un actor aislado {H}, el segundo es una diada reciproca {F, G}, el tercero es un solo actor {E}, y el cuarto sería el componente fuerte principal {A, B, C, D}. Es probable que se esté preguntando, ¿Por qué E no forma parte del componente fuerte principal? La razón la podemos encontrar en la definición de Easley y Kleinberg. Note que en el componente principal todos los nodos pueden alcanzarse entre sí, es decir, si cualquier nodo en el componente fuese a difundir alguna noticia atreves de sus contactos esta información podría retornar al originador. Esta dinámica se repite con la diada de los actores F y G. Sin embargo, E se encuentra en un componente único puesto que no alcanza a otros nodos.

Como puede ver, los componentes fuertes son mas restrictivos que los componentes débiles. Sin embargo, son utilices al trabajar con datos dirigidos puesto que permiten el análisis de subconjuntos donde todos los nodos pueden alcanzarse entre si tomando en cuenta la direccionalidad de vínculos dirigidos y el flujo potencial de información y/o recursos.

## K-cores

## Girvan-Newman

##Louvain

## Ejercicio Práctico

Los científicos sociales generalmente asumen que "la interacción social es la base de la solidaridad, las normas compartidas, la identidad y el comportamiento colectivo, por lo que es probable que las personas que interactúan intensamente se consideren parte de un grupo social". Por lo tanto, una herramienta principal del análisis de redes sociales es identificar grupos densos de actores "entre los cuales hay vínculos relativamente fuertes, directos, intensos y / o positivos". Por lo general, se denominan "subgrupos cohesivos", "subredes" o "subgrupos". Una forma de agrupar a los actores se basa en atributos compartidos (por ejemplo, raza, género, etc.). Otro es utilizar el patrón de vínculos entre actores. 

En un mundo ideal, habría un solo algoritmo para identificar subgrupos cohesivos, pero este no es un mundo ideal, por lo que los analistas de redes sociales han desarrollado una variedad de algoritmos para identificar subredes. No los consideraremos todos aquí; simplemente hay demasiados. En cambio, nos centraremos en algunos. En Gephi consideraremos componentes, k-cores y algoritmos de detección de comunidades; y en snExplorer veremos brevemente los recuentos de componentes, k-núcleos y camarillas.


### Antes de Empezar

Para este ejercicio vamos a necesitar el módulo *Newman-Girvan* clustering antes de comenzar Haga esto siguiendo los mismos pasos que utilizamos en para descargar el modulo *MultimodeNetworks Transformation* en ejercicio práctico en el capitulo [Derivando Datos Modo-Uno de Modo-Dos]. 

### Identificación de Subgrupos en Gephi

::::{.row}
::::{.lcolumn-20}
*[Gephi]*

*Archivo > Abrir* 
::::
::::{.rcolumn-80}
  1.	Abra Gephi y lea el archivo `Alive Trust Network.gephi`(**ADD DATA LINK HERE**). Comenzaremos explorando componentes, estos son subgrupos de actores que están conectados (ya sea directa o indirectamente) entre sí. En las redes dirigidas, puede identificar dos tipos de componentes: fuertes y débiles. Los componentes fuertes toman en cuenta la dirección de los lazos, mientras que los componentes débiles no. Con redes no dirigidas, solo puede identificar componentes débiles.
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Estadísticas > Componentes conexos > Ejecutar*
::::
::::{.rcolumn-80}
  2.	Para identificar componentes en Gephi, haga clic en *Ejecutar* junto a la función *Componentes conexos* en la pestaña *Estadísticas*. Aparecerá un cuadro de diálogo titulado *Parámetros de Componenetes Conectados* (no se muestra) que ofrece la opción de indicar si nuestros datos son *Dirigidos* o *No dirigidos*. Aquí, estamos trabajando con datos no dirigidos, así que elija esta opción y haga clic en *Aceptar*. Ahora deberá aparecer el informe *Connected Componenets Report* (Reporte de Componentes conectados) (Figura \@ref(fig:1)), que reporta los parámetros de la red, el número de componentes *Results* (Resultados) y un gráfico que indica el número y tamaño de cada uno de los componentes. Como puede ver, Gephi encontró 8 componentes, pero al comparar esta cifra con el gráfico de red, podemos ver que 7 de estos son nodos aislados. Igualmente podemos llegar a esta conclusión examinando el gráfico en el informe. Si observa verá que hay 7 componentes de tamaño 1 y un componente de un poco más grande que 60 (62 en realidad). Cierre la ventana del informe cuando haya terminado.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/03-09-01.png" alt="Reporte de Componentes Conectados en Gephi" width="70%" />
<p class="caption">(\#fig:1)Reporte de Componentes Conectados en Gephi</p>
</div>

<div class="figure" style="text-align: center">
<img src="images/03-09-02.png" alt="Red de confianza con actores vivos, color por componente" width="70%" />
<p class="caption">(\#fig:2)Red de confianza con actores vivos, color por componente</p>
</div>


::::{.row}
::::{.lcolumn-20}
*[Laboratorio de datos]*

*Tabla de datos > Nodos*

*[Vista general]*

*Apariencia > Nodos > Color > Partición > --Escoge un atributo > Component ID > Aplicar*
::::
::::{.rcolumn-80}
  3.	También puede ver los resultados navegando al *Laboratorio de datos* y buscando una nueva columna (partición) en la sección *Nodos* denominada *Component ID* (identificación del componente). Gephi genera una serie de números, comenzando con 0, que identifican los componentes respectivos de cada actor. También podemos usar esta variable categórica para visualizar la red, seleccionando primero la opción *Nodos> Color> Partición* en la pestaña *Apariencia*, y luego con el menú desplegable *--Escoge un atributo*, seleccione *Component ID* y de clic en *Aplicar*. El resultado no es muy interesante (Figura \@ref(fig:2)) ya que cada nodo aislado posee un color diferente, mientras que los actores conectados en el componente más grande (llamado componente principal) son todos del mismo color. 
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Filtros > Atributos > Partición > Queries > Partition > Filter > Export filtered graph to a new workspace*

::::
::::{.rcolumn-80}
  4.	No obstante, puede que algunas ocasiones sea útil identificar el componente principal. De hecho, no es raro que los investigadores extraigan el componente principal y lo analicen por separado. Por lo tanto, exportaremos el componente principal a un espacio de trabajo separado donde lo analizaremos por separado. Para hacer esto, en la pestaña *Filtros* a la derecha de la ventana *Vista general*, primero seleccione *Atributos* y luego *Partición*. A continuación, arrastre la partición *Component ID* a *Consultas*. En las opciones abajo, haga clic en el cuadro que tiene el mayor porcentaje de nodos (probablemente `0`), haga clic en *Filtrar* y luego use el botón *Exportar el grafo filtrado en un nuevo espacio de trabajo* (Figura \@ref(fig:3)). **¿Cuál es el tamaño del componente principal? ¿Cuál es su densidad? ¿Grado medio?**
::::
::::

<div class="figure" style="text-align: center">
<img src="images/03-09-03.png" alt="Red de confianza con actores vivos, componente principal" width="70%" />
<p class="caption">(\#fig:3)Red de confianza con actores vivos, componente principal</p>
</div>


::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  5.	Veamos si identificar *k-cores* es una mejor estrategia para identificar subgrupos cohesivos para esta red en particular. La "k" en k-core indica el número mínimo de vínculos de cada actor dentro del núcleo (“core”); por ejemplo, un núcleo 2 incluye a todos los actores que tienen dos o más conexiones con otros actores dentro del núcleo, y un núcleo 3 incluye todos los actores que tienen tres o más vínculos con otros actores dentro de un núcleo. Es importante tener en cuenta que el k-core más alto de una red no corresponde necesariamente al puntaje de centralidad de grado más alto obtenido por un actor en la red. Más bien, es el subgrupo en el que cada actor comparte el mayor número de vínculos. Imagínese una red en la que un actor tiene seis vínculos, pero nadie más tiene más de cuatro. El k-core más alto no sería un 6-core porque todos los demás en el subgrupo también necesitarían tener seis enlaces.
::::
::::

::::{.row}
::::{.lcolumn-20}
*Filtros > Topología > K-core*
::::
::::{.rcolumn-80}
  6.	Regrese a la pestaña *Alive Trust Network*. Una vez más usaremos un filtro para encontrar k-cores. Esta vez, arrastre la opción *K-core* que se encuentra sección de *Topología* en la pestaña *Filtro* a *Consultas*. Hacia la parte inferior de la pestaña *Filtros*, debería ver un cuadro *K-core Configuración* que estará predeterminado en *1*. Haga clic en el botón *Filtrar* y los aislados deberán desaparecer. Aumente la configuración a *2* y no debería haber ningún cambio. Eso es porque Gephi aparentemente cuenta los lazos dos veces, para reflejar las dos direcciones de un enlace aunque, en este caso, Gephi sabe (o debería saber) que se trata de una red no dirigida. Por lo tanto, el filtro de 1 y 2 capturan el primer núcleo (k = 1), 3 y 4 capturan el segundo núcleo (k =2), y así sucesivamente. Si sigue aumentando la configuración, todos los nodos desaparecen al llegar a quince, lo que significa que el núcleo k más alto de la red es el séptimo núcleo (14/2). Vea la Figura \@ref(fig:4). Exporte el 7-core a un nuevo espacio de trabajo. **¿Qué actores parecen ser los más centrales en la red del séptimo núcleo (k = 7)?**
::::
::::

<div class="figure" style="text-align: center">
<img src="images/03-09-04.png" alt="Red de confianza con actores vivos, 7-core" width="70%" />
<p class="caption">(\#fig:4)Red de confianza con actores vivos, 7-core</p>
</div>

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Estadísticas > Girvan-Newman Clustering > Ejecutar*
::::
::::{.rcolumn-80}
  7.	Ahora consideremos otro método para identificar subgrupos: algoritmos de detección de comunidades. Consideraremos dos: Girvan-Newman y Louvain. El segundo estará implementado automaticamente en Gephi, pero Girvan-Newman no, por lo que deberá descargar e instalar el módulo Newman-Girvan Clustering, si aún no lo ha hecho. En la pestaña *Estadísticas* de Alive Trust Network, haga clic en el botón *Ejecutar* a un lado de función *Girvan-Newman Clustering*. Esto abrirá un cuadro de diálogo (no se muestra). Acepte sus valores predeterminados y haga clic en "*Aceptar*. Esto producirá un informe (no se muestra) que indica el número de comunidades que detectó y la modularidad. **¿Cuántas comunidades encontró el algoritmo?** 
::::
::::

::::{.row}
::::{.lcolumn-20}
*Apariencia > Nodos > Color > Partición > --Escoge un atributo > Cluter-ID > Aplicar*
::::
::::{.rcolumn-80}
  8.	Asimismo, coloree los nodos según la partición creada por el algoritmo (Cluter-ID). Note que el algoritmo Girvan-Newman ha asignado cada uno de los aislados a una comunidad separada. No todos los algoritmos de detección de comunidades tratan los aislamientos de esta manera, por lo que cuando compare los resultados de dos o más de ellos, tenga esto en cuenta.
::::
::::

::::{.row}
::::{.lcolumn-20}
*Estadísticas > Modularidad > Ejecutar*
::::
::::{.rcolumn-80}
  9.	Ahora, repitamos el proceso con el algoritmo de Louvain, que se implementa mediante la función *Modularidad* en la pestaña *Estadísticas*. Esto abrirá un cuadro de diálogo (no se muestra). Tenga en cuenta que incluye un parámetro de ajuste (*Resolución*), que le permite ajustar si desea obtener menos o más comunidades. Por ahora, haga clic en *Aceptar*. Esto produce un informe (no se muestra). **¿Cuántas comunidades encontró el algoritmo? ¿Qué es la modularidad?¿Cómo se compara esto con los resultados de Girvan-Newman?**
::::
::::

::::{.row}
::::{.lcolumn-20}
*Apariencia > Nodos > Color>Partición > --Escoge un atributo >Modularity Class > Aplicar*
::::
::::{.rcolumn-80}
10.	Coloree los nodos usando la partición creada por el algoritmo de Louvain (*Clase de modularidad*). Debido a que hay más de ~8 comunidades, deberá ajustar la paleta de colores como hicimos en laboratorios anteriores. **¿Louvain asigna a cada aislado en una comunidad separada?** 
::::
::::

::::{.row}
::::{.lcolumn-20}
*Generate groups by partition*
::::
::::{.rcolumn-80}
  11.	Ahora colapse la red usando la herramienta *Generate groups by partition* (Generar grupos por partición). Asegúrese de decirle a Gephi que cree un nuevo espacio de trabajo. Recuerde que los atributos son aspectos no relacionales de las redes. Pueden ser previamente dados (por ejemplo, rol, género, nacionalidad) o pueden ser generados por nuestro análisis de una red. Los algoritmos de agrupación, como los núcleos k y los de detección de comunicación, clasifican actores en varios subgrupos, y la partición de "pertenencia" del subgrupo es un atributo de actor.
::::
::::

::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
12.	Visualice la red reducida. **¿Aparece algún subgrupo (o subgrupos) más central que otros?**
::::
::::
