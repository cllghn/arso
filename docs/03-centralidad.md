---
output: html_document
---

# Centralidad


## Ejercicio Práctico

La centralidad es uno de los conceptos más antiguos del ARSo. Un actor central puede ser alguien que tiene numerosos vínculos con otros actores (grado), alguien que está más cerca (en términos de distancia del camino) a todos los demás actores (cercanía), alguien que se encuentra en el camino más corto (geodésico) entre dos actores cualesquiera (intermediación), o alguien que tiene vínculos con otros actores muy centrales (eigenvector). En algunas redes, los mismos actores obtienen una puntuación alta en las cuatro medidas. En otras no. 

Por supuesto, hay más de cuatro medidas de centralidad. UCINET implementa más de 20, el programa R CINNA incluye más de 40, y [David Schoch ha creado una tabla periódica interactiva de más de 100 medidas de centralidad](http://schochastics.net/sna/periodic.html).

### Centralidad en Gephi

::::{.row}
::::{.lcolumn-20}
*[Gephi]*
*Archivo > Abrir* 

*[Vista general]*
*Estadísticas > Grado medio > Ejecutar*
::::
::::{.rcolumn-80}
  1.	Abra `Alive Combined Network.gephi` (**ADD DATA LINK HERE**). Los colores de los nodos de la red reflejan los subgrupos de acuerdo con el algoritmo de Louvain. Gephi implementa un puñado de medidas de centralidad. La medida más común de centralidad es el grado, que en una red no dirigida y binaria es simplemente un recuento del número de vínculos de cada actor (es decir, el número de vecinos). Los vínculos en una red son ponderados cuando los actores comparten múltiples entre sí, por un par de actores puede compartir más de un vínculo, como parentesco, religioso, escolar. Para la centralidad de grado, Gephi ofrece la opción de tomar en cuenta el peso de los vínculos o ignorarlo. Para calcular la centralidad de grado no ponderada, ubique la opción *Grado medio* en la pestaña *Estadísticas* y haga clic en *Ejecutar*. Esto genera un informe, que hemos visto antes, que le presenta la centralidad de grado medio y produce un gráfico que indica la distribución de los valores de grado.
::::
::::

::::{.row}
::::{.lcolumn-20}
*[Laboratorio de datos]*
*Tabla de datos > Nodos*
::::
::::{.rcolumn-80}
  2.	En este laboratorio nuestro interés es capturar los puntajes de centralidad de grado de cada actor. Para hacer esto, cambie a la ventana *Laboratorio de datos*, haga clic en *Nodos* en la pestaña *Tabla de datos*, y vera una columna en el extremo derecho con la etiqueta *Grado* (Figura \@ref(fig:1)). Puede ordenar los actores por grado (ya sea ascendente o descendente) haciendo clic en la etiqueta. Por lo tanto, con un par de clics, puede determinar qué actores son más o menos influentes en términos de grado. Si observa la Figura \@ref(fig:1), puede ver que Noordin Top ocupa el primer lugar (46), seguido de Suramto (28), Ubeid (27), Abdullah Sunata (25) e Iwan Dharmawan (25). Si desea puede exportar esta table y manipular la información en Excel.
::::
::::

<div class="figure" style="text-align: center">
<img src="images/03-10-01.png" alt="Red combinada de nodos vivos, Laboratorio de datos" width="70%" />
<p class="caption">(\#fig:1)Red combinada de nodos vivos, Laboratorio de datos</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Apariencia > Nodos Tamaño > Ranking > Aplicar*
::::
::::{.rcolumn-80}
  3.	Para visualizar la red donde el tamaño del nodo refleja el grado de centralidad, en la pestaña *Apariencia*, seleccione *Nodos*, *Tamaño* y elija *Ranking*. En el menú desplegable, elija *Grado* (no importa si elige el primero o el segundo). Haga clic en *Aplicar*. El gráfico de red resultante debe tener un aspecto similar al de la Figura \@ref(fig:2).
::::
::::

<div class="figure" style="text-align: center">
<img src="images/03-10-02.png" alt="Red combinada de nodos vivos, el tamaño refleja el grado de centralidad" width="70%" />
<p class="caption">(\#fig:2)Red combinada de nodos vivos, el tamaño refleja el grado de centralidad</p>
</div>

::::{.row}
::::{.lcolumn-20}
*[Vista general]*
*Estadísticas > Grado medio con pesos > Ejecutar*
::::
::::{.rcolumn-80}
  4.	Ahora, repita el proceso excepto que esta vez use *Grado medio con pesos* en lugar de *Grado medio*. Mire los resultados en la ventana *Laboratorio de datos*. **¿Qué actor ocupa el puesto más alto? ¿Cuál es su puntuación? ¿Cómo se comparan las clasificaciones con las anteriores que no tenían en cuenta el peso del enlace?**
::::
::::

::::{.row}
::::{.lcolumn-20}
*Estadísticas > Longitud media de camino > Ejecutar*
::::
::::{.rcolumn-80}
5.	Para obtener la centralidad de cercanía e intermediación en Gephi, podemos usar *Logitud media de camino* en la pestaña *Estadísticas*. Al hacer clic en *Ejecutar*, aparece un cuadro de diálogo (Figura \@ref(fig:3)), que presenta un par de opciones para tratar la red como dirigida o no dirigida (aquí, detecta correctamente que la red no está dirigida). Seleccione la opción para normalizar las centralidaded en el rango. La normalización es buena para comparar diferentes medidas. Note que esta opción también calcula la centralidad de excentricidad, que (como indica el cuadro de diálogo) es la distancia desde un nodo en particular hasta el nodo más lejano en la red. Haga clic en *Aceptar* y Gephi producirá un informe, en el verá que Gephi calcula dos medidas de proximidad: proximidad (Freeman) y proximidad armónica. Dado que se trata de una red desconectada, utilizaremos la segunda. Como hicimos anteriormente, cambie a la ventana *Laboratorio de datos* y vea qué actores obtienen la puntuación más alta en términos de centralidad de intermediación y cercanía armónica (Harmonic Closeness Centrality).
::::
::::

<div class="figure" style="text-align: center">
<img src="images/03-10-03.png" alt="Diámetro de red/distancia promedio de camino" width="70%" />
<p class="caption">(\#fig:3)Diámetro de red/distancia promedio de camino</p>
</div>

::::{.row}
::::{.lcolumn-20}
*Estadísticas > Centralidad del vector propio > Ejecutar*
::::
::::{.rcolumn-80}
  6.	Finalmente, para estimar la centralidad de eigenvector, usamos la función *Centralidad del vector propio* de Gephi. En el cuadro de diálogo, indique si la red está dirigida o no y haga clic en *Aceptar*. Al igual que con las otras funciones de centralidad, genera un informe y almacena las puntuaciones de centralidad para cada actor en la tabla de nodos. 
::::
::::
