---
output: html_document
bibliography: book.bib
---



# Extraer y Simplificar Redes

Antes de concluir esta sección sobre técnicas de manipulación de datos, tocaremos los temas de simplificación y extracción de subredes. @Everton2012 menciona que a menudo al trabajar con redes sociales grandes es difícil apreciar los patrones de interacciones por el volumen de información; por esto, los analistas utilizan un conjunto de técnicas para encoger la red o extraer subconjuntos de datos con características relevantes [@Everton2012]. El objetivo de esta sección es presentarle herramientas comúnmente utilizadas para reimaginar redes con propósito de localizar patrones emergentes. Para mantener claridad, en esta sección tocaremos cada técnica de manera individual. Antes concluir, tendrá la oportunidad de practicar el uso de estas herramientas en Gephi.


## Extraer

El extraer es una técnica utilizada para aislar porciones de una red con base a un conjunto de características. Estas pueden ser características de los nodos o las aristas. Por ejemplo, la en una red de pandilleros tenemos miembros de esta organización atados por diferentes tipos de enlaces. Adicionalmente, algunos de los miembros de esta organización se encuentran libres y vivos, vivos y en busqueda, y encarcelados/detenidos. La Figura \@ref(fig:pandilleros) es una representación gráfica de este ejemplo. En ella los nodos libres y vivos están coloreados de negro, los vivos y en búsqueda en gris, y los encarcelados/detenidos en blanco. Por su parte los enlaces rojos son familiares, los verdes financieros, rosados representan amistosos, y azul son de superior-subordinado.

<div class="figure" style="text-align: center">
<img src="02-extract-simplify_files/figure-html/pandilleros-1.png" alt="Red de Pandilleros" width="70%" />
<p class="caption">(\#fig:pandilleros)Red de Pandilleros</p>
</div>

Podemos enfocarnos en las características de los nodos y extraer una subred con base a estos atributos. Por ejemplo, si el enfoque del análisis es localizar a los nodos vivos y libres más activos, es importante extraer de la red solo nodos libres o en busqueda. La Figure \@ref(fig:vivos) solo incluye nodos vivos y libres, por ello re han removido seis nodos de el conjunto de datos original.

<div class="figure" style="text-align: center">
<img src="02-extract-simplify_files/figure-html/vivos-1.png" alt="Red de Pandilleros Vivos y Libres" width="70%" />
<p class="caption">(\#fig:vivos)Red de Pandilleros Vivos y Libres</p>
</div>

Similarmente, podemos extraer subredes con base en los patrones o tipos de relaciones. Supongamos que el objetivo es aislar nodos enlazados únicamente por vínculos financieros, la Figura \@ref(fig:fin) representa la subred de nodos exclusivamente conectados por vínculos de finanzas. 

<div class="figure" style="text-align: center">
<img src="02-extract-simplify_files/figure-html/fin-1.png" alt="Red de Pandilleros con Lazos Financieros" width="70%" />
<p class="caption">(\#fig:fin)Red de Pandilleros con Lazos Financieros</p>
</div>

## Simplificar

El simplificar, a veces llamado colapsar, es una estrategia que permite el colapsar múltiples nodos con un atributo compartido en un conjunto de datos a uno solo nodo. Como sugiere @Everton2012, esta estrategia es valiosa si el objetivo del análisis es examinar los patrones de enlaces entre tipos de nodos y no entre nodos individuales [@Everton2012].  

Una vez más, retornemos a la red de pandilleros. Esta vez, los nodos han sido coloreados con base a la afiliación de cada miembro a pandillas, Figura \@ref(fig:pos).

<div class="figure" style="text-align: center">
<img src="02-extract-simplify_files/figure-html/pos-1.png" alt="Red de Pandilleros con Nodos Coloreados por Pandilla" width="70%" />
<p class="caption">(\#fig:pos)Red de Pandilleros con Nodos Coloreados por Pandilla</p>
</div>

Utilizando estas categorías, podemos colapsar la red. Por ejemplo, la Figura \@ref(fig:collapsed) es una representación de la red donde cada nodo representa una categoría. Cada vínculo entre estas categorías simboliza la presencia de una relación entre dos personas con afiliaciones a dicho grupo.

<div class="figure" style="text-align: center">
<img src="02-extract-simplify_files/figure-html/collapsed-1.png" alt="Pandilleros, Collapsados por Grupo Ilícito" width="70%" />
<p class="caption">(\#fig:collapsed)Pandilleros, Collapsados por Grupo Ilícito</p>
</div>


## Ejercicio Práctico

En este laboratorio, veremos técnicas para combinar datos relacionales con datos de atributos. Estos son útiles para resaltar diferentes aspectos de la red o para simplificar las redes. En este ejercicio utilizaremos un subconjunto de los datos principales de Noordin: “Red Operativa Noordin (agregada)”(**ADD DATA LINK HERE**), junto con los atributos asociados. 

### Antes de empezar

Para poder manipular los datos adecuadamente es necesario descargar e instalar un módulo adicional de software, *Grupos by partition* ó *Grupos por partición*. Haga esto siguiendo los mismos pasos que utilizamos en para descargar el modulo *MultimodeNetworks Transformation* en ejercicio práctico en el capitulo [Derivando Datos Modo-Uno de Modo-Dos]. 


Recuerde que deberá reiniciar Gephi.

### Importar redes y atributos en Gephi

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Archivo > Abrir*
*Importar como > Tabla de nodos*
::::
::::{.rcolumn-80}
  1.	Comenzaremos importando la red operacional junto con sus atributos en Gephi. Primero, abra el archivo `Attributes (Nodes Table).csv` utilizando el comando *Archivo > Abrir* en Gephi. Este archivo contiene una lista de los nodos de red y sus atributos correspondientes. Gephi debe detectar el tipo de archivo que esta importando, pero mantenga en mente que a veces no funciona correctamente. En el cuadro de diálogo  de importación (Figura \@ref(fig:importacion)), asegúrese de indicar que el *Separador* sean comas y de importar el archivo como una *Tabla de Nodos*. Luego haga clic en *Siguiente*. 
::::
::::

::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  2.	En la siguiente pantalla de importación (Figura \@ref(fig:importacion2)) vera que se han detectado una serie de atributos: `Education Level`, `Contact with People`, `Current Status (ICG Article)`, `Military Training`, `Nationality`, `Noordin’s Network`, `Primary Group Affiliation`, y `Role`, junto con la identificación y etiqueta de cada nodo (actor) en la red. Gephi probablemente importará de manera predeterminada todos los atributos como *String*, por lo tanto, usando los menus desplegables debajo de cada atributo, cámbielo de *String* a *Integer*. Luego, de clic en *Terminar*.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-01.png" alt="Cuadro de dialogo para importar un archivo CSV (1 de 2)" width="70%" />
<p class="caption">(\#fig:importacion)Cuadro de dialogo para importar un archivo CSV (1 de 2)</p>
</div>

<div class="figure" style="text-align: center">
<img src="images/02-07-02.png" alt="Cuadro de dialogo para importar un archivo CSV (2 de 2)" width="70%" />
<p class="caption">(\#fig:importacion2)Cuadro de dialogo para importar un archivo CSV (2 de 2)</p>
</div>


::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  3.	A continuación, debería ver el *Informe de importación* de Gephi (Figure (Figura \@ref(fig:importacion3)). Aquí, indique que desea agregar los datos a un nuevo espacio de trabajo. Tenga en cuenta que en el informe no he cambiado ninguno de los valores predeterminados. Como esta tabla no incluye aristas, ninguna de las otras opciones importa. Haga clic en *Aceptar*.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-03.png" alt="Informe de importación de Gephi" width="70%" />
<p class="caption">(\#fig:importacion3)Informe de importación de Gephi</p>
</div>

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Archivo > Abrir*
*Importar como > Tabla de aristas*
::::
::::{.rcolumn-80}
  4.	Ahora importemos la lista de aristas correspondiente, `Operational (Edge List).csv`, usando el comando *Archivo > Abrir*. Gephi debe detectar el formato del archivo correctamente, pero asegúrese que los separadores sean comas y que el archivo de importación sea reconocido como *Tabla de aristas* (Figura \@ref(fig:importacion4)). Luego haga clic en *Siguiente*. En e siguiente cuadro de diálogo, acepte todos los valores predeterminado de Gephi y haga clic en *Terminar*. 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-04.png" alt="Cuadro de dialogo para importar un archivo CSV" width="70%" />
<p class="caption">(\#fig:importacion4)Cuadro de dialogo para importar un archivo CSV</p>
</div>

::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
5.	Una vez más, deberá ver el informe de importación de Gephi (Figure \@ref(fig:importacion5)). Aunque, es importante que le indique a Gephi que el grafo no es dirigido, que desea utilizar la estrategia para combinar aristas *Minimo* y que desea agregar los datos al lugar de trabajo existente. Note que el informe indica que solo hay 68 nodos, sin embargo, el reporte de importación de los atributos (Figura \@ref(fig:importacion3)) indico que hay 79. ¿Por qué? La respuesta es que la red contiene 11 nodos aislados, estos son, individuos que no tienen enlaces a otros en esta red. Haga clic en *Aceptar*. Antes de comenzar, guarde sus datos como archivo de Gephi.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-05.png" alt="Reporte de importación" width="70%" />
<p class="caption">(\#fig:importacion5)Reporte de importación</p>
</div>

### Uso de atributos de nodo en visualizaciones de red

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Apariencia > Nodos > Partición > --Escoge un atributo > Current status (icg article)*
::::
::::{.rcolumn-80}
  1.	Ahora, veamos cómo podemos incorporar algunos de los datos de atributos de nodo en nuestras visualizaciones de red. En la pantalla *Vista general*, ubique la pestaña *Apariencia*, luego haga clic en la pestana *Nodos* y el icono de la paleta de colores a la derecha, y finalmente en la opción *Partición*. Usando el menú desplegable de atributos, seleccione `current status (icg article)` y de clic en *Aplicar*. Los nodos ahora deben exhibir tres colores diferentes, cada uno de los cuales refleja el estado actual de un actor (es decir, si está muerto “0”, vivo y libre “1” o en la cárcel “2”; todo esto está en el libro de códigos). El color asociado con cada atributo se encuentra justo debajo del menú desplegable. Si no le gustan los colores predeterminados, puede hacer clic en el cuadro junto al número o hacer clic en el enlace *Paleta…*, que abrirá una serie de opciones diferentes.
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Apariencia > Nodos > Partición > --Escoge un atributo > role*

*Paleta... > Generate...*
::::
::::{.rcolumn-80}
  2. Ahora, seleccione `role` y haga clic en *Aplicar*. Si se desplaza hacia abajo por los colores asociados con los 12 roles, notará que Gephi no posee suficientes colores para todas las categorías. Para rectificar esto, haga clic en el enlace *Paleta…* y elija *Generar…* en el cuadro de diálogo (Figura \@ref(fig:importacion6)), aumente el número de colores a 12, elija uno de los ajustes preestablecidos, haga clic en *Generar* y luego *Aceptar*. En la ventana *Descripción general*, haga clic en *Aplicar*, y ahora todos sus nodos deben tener un color individual.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-06.png" alt="Cuadro de diálogo 'Generar paleta'" width="70%" />
<p class="caption">(\#fig:importacion6)Cuadro de diálogo 'Generar paleta'</p>
</div>

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Apariencia > Nodos > Tamaño > Ranking > Attributo > Education Level*

::::
::::{.rcolumn-80}
  3.	Ahora, ajustemos el tamaño de los nodos según el nivel educativo. En la pestaña *Apariencia*, haga clic en *Nodos*,  luego en el icono de tamaño (a la derecha de la paleta de colores) y luego en *Ranking*. Usando el menú desplegable de atributos, seleccione `education level` y haga clic en *Aplicar*. El tamaño de los nodos ahora debe reflejar el nivel de educación. Los tamaños de nodo mínimo y máximo predeterminados de Gephi predeterminan un rango arbitrario de valores. Si mira en el libro de códigos (o en la ventana *Laboratorio de datos*), verá que el nivel educativo va de 0 a 8. Para distinguir los nodos un poco mejor, ajusté el mínimo y el máximo de 3 a 27 (no usamos 0 como mínimo porque los nodos desaparecerán). Después de usar las técnicas de visualización cubiertas en nuestros laboratorios anteriores, mi red resultante aparece en la Figura \@ref(fig:7). Esta vez, utilice el diseño *Force Atlas* pues no empuja los aislados lejos del resto de la red. **¿Detecta algún patrón relacional asociado con los atributos de los nodos (por ejemplo, los actores con niveles de educación más altos se encuentran en el centro de la red)?** 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-07.png" alt="Red operacional de Noordin" width="70%" />
<p class="caption">(\#fig:7)Red operacional de Noordin</p>
</div>

### Simplificación (colapso / reducción) en Gephi


::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  1.	Solo prosiga a completar esta sección si ha descargado el módulo requerido, *Grupos por partición*.
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Herramientas > Generate groups by partition*
::::
::::{.rcolumn-80}
  2. En la ventana *Descripción general*, seleccione el comando *Herramientas > Generate groups by partition*. Aparecerá un cuadro de diálogo que le preguntará si desea crear un nuevo espacio de trabajo o sobrescribir el actual. Elija *Crear*. Esto generará un nuevo espacio de trabajo donde los nodos han sido colapsados según el rol de cada nodo. Es importante tener en cuenta que este modulo contrae la red en base a la partición de nodos seleccionada en la ventana *Vista general*. Si hubiéramos querido colapsar la red basándose, por ejemplo, en el estado actual, entonces habríamos tenido que volver a colorear y revisualisar la red usando otra partición, siguiendo los comandos detallados en la seccion [Uso de atributos de nodo en visualizaciones de red].
::::
::::

::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  3.	Finalmente, necesitamos cambiar el nombre de las etiquetas para que correspondan con los diferentes roles. Cambie a la ventana *Laboratorio de datos*, seleccione la *Tabla de nodos* y verá que ahora solo hay 12 nodos correspondiendo a los grupos colapsados (por ejemplo, `Group of Jabir`). Al colapsar los nodos el nombre asociado con el grupo corresponde a uno de los actores que pertenecen a este subconjunto. Para modificar las etiquetas con los roles, vamos a tener que abrir la tabla original de atributos (`Attributes (Nodes Table).csv`) y el libro de códigos. En Excel observara que el rol de Jabir es `7`, y en el libro de código vemos que el rol `7` es el de `Recruiter` (o reclutador en español). En la columna de etiqueta (*Label*) en la tabla de nodos haga doble clic en la fila `Group by Jabir`, que abrirá un cuadro de texto. Allí, remplace la etiqueta con el rol (`Reclutador` o `Recruiter`) y luego repita este proceso para todos los grupos restantes. Cuando hay cambiado el nombre de todas las etiquetas, la red resultante tendrá un aspecto similar a la Figura \@ref(fig:8). 
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-08.png" alt="Nodos por rol" width="70%" />
<p class="caption">(\#fig:8)Nodos por rol</p>
</div>

::::{.row}
::::{.lcolumn-20}
*[Vista General]*

*Nodos > Tamaño > Único*
::::
::::{.rcolumn-80}
  4.	Ahora, cambie la Ventana *Vista general* y visualice la red. Los nodos probablemente variarán en tamaño, por lo que se recomienda modificar el tamaño utilizando los comandos *Nodos > Tamaño > Único* en esta secuencia. También use el algoritmo de diseño *Force Atlas* para editar el grafico. Note que los pesos de las aristas reflejan en número de enlaces entre cada par de nodos, por lo que podemos reducir el grosor de estos. Además, agregue el tamaño de las etiquetas a su gusto (vea nuestra sugerencia en la Figura \@ref(fig:9)). Antes de pasar al siguiente paso, haga clic derecho en el nodo `propagandista` (o `propagandist`). Esta acción abrirá un cuadro de diálogo; allí, seleccione *Bloquear*. Hacer esto evita que el nodo se mueva al aplicar algoritmos de diseño adicionales.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-09.png" alt="Red colapsada por atributo de rol (diseño Force Atlas)" width="70%" />
<p class="caption">(\#fig:9)Red colapsada por atributo de rol (diseño Force Atlas)</p>
</div>


::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  5.	Experimenté con varios algoritmos de diseño, en mi grafico (Figura \@ref(fig:10)) vera un sociograma modificado con el algoritmo de diseño *OpenOrd*. Mirando el gráfico (que usted mismo puede producir en Gephi), **¿Qué sugieren los patrones entre los roles?** Tenga en cuenta que algunos de los nodos tienen vínculos consigo mismos (bucles). **¿Qué crees que indican estos patrones? ¿Por qué cree que el nodo “Recon and sureveillance” no se encuentra más cerca a los demás nodos?**
::::
::::

  
<div class="figure" style="text-align: center">
<img src="images/02-07-10.png" alt="Red colapsada por el atributo de rol (diseño OpenOrd)" width="70%" />
<p class="caption">(\#fig:10)Red colapsada por el atributo de rol (diseño OpenOrd)</p>
</div>

### Extracción en Gephi

::::{.row}
::::{.lcolumn-20}
*[Vista general]*

*Filtros > Atributos > Partición > current status*

*Consultas > Partición > 1*

*Filtrar > Exportar gráfico filtrado a un nuevo espacio de trabajo*

::::
::::{.rcolumn-80}
  1.	Ahora, vamos a extraer un conjunto de red más grande. Para hacer esto, volvamos a la red original (sin colapsar), que probablemente se encuentra el primer espacio de trabajo. En la pestaña *Filtros* en el lado derecho de la ventana *Descripción general*, seleccione *Atributos*, luego *Partición* y luego *current status (icg articles)* a la sección *Consultas*. En el cuadro debajo de la sección *Consultas* - *Partition (current status (icg article)) Configuración* – deberá ver tres cuadros, etiquetados *2*, *1*, y *0*, que indican si el actor esta muerto `0`, vivo y libre `1`, o en la cárcel `2`. Aquí, extraeremos la red `Viva y libre` marcando la casilla *1*. Haga clic en *Filtrar* y luego use el botón *Exportar gráfico filtrado a un nuevo espacio de trabajo*, que utilizamos en el laboratorio anterior (cuadro rojo en la Figura \@ref(fig:11)).
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-11.png" alt="Red viva y libre filtrada" width="70%" />
<p class="caption">(\#fig:11)Red viva y libre filtrada</p>
</div>

::::{.row}
::::{.lcolumn-20}

::::
::::{.rcolumn-80}
  2.	Cambie el nuevo espacio de trabajo y cámbiele el nombre (por ejemplo, `Red viva y libre`). Después de experimentar con algunos algoritmos de diseño, tamaño de nodo con base en el nivel educativo, tamaño de etiqueta y pesos de borde, produje el grafico en la Figura \@ref(fig:12). Tenga en cuenta que vez elegí no mostrar los nodos aislados. Los colores reflejan el rol.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/02-07-12.png" alt="Red viva y libre (sin aislados)" width="70%" />
<p class="caption">(\#fig:12)Red viva y libre (sin aislados)</p>
</div>
