---
output: html_document
---



# Puentes y Corredores

En este capítulo, exploraremos una variedad de algoritmos para detectar puentes y corredores en una red: puntos y conjuntos de corte, bi-componentes y puentes, agujeros estructurales, e intermediación de borde. El tema central de este capítulo es el enfoque en localizar ubicaciones en la red valiosas en términos de flujo de recursos, materiales o información. A menudo, los analistas de redes requieren identificar un puñado de estrategias para disrumpir la efectividad de una organización, aquí presentamos algunas opciones.

En general, un corredor es un actor que, en virtud de su ubicación estructural, posee el poder potencial para controlar el flujo de recursos a través de una red, mientras que un puente puede considerarse como un vínculo que conecta dos subgrupos. Un bi-componente es un componente que es inmune a la eliminación de un solo nodo, mientras que un punto de corte es un nodo que, si se elimina, desconecta la red. Un bi-componente con solo dos actores se considera un puente porque si se elimina, la red se desconecta. El concepto de agujeros estructurales fue desarrollado por Ron Burt. Se basa en la noción de Mark Granovetter de "la fuerza de los vínculos débiles", pero en lugar de centrarse en el tipo de vínculo (es decir, fuerte frente a débil), se centra en detectar las brechas (es decir, huecos) en la estructura social. Finalmente, la intermediación de los bordes identifica los bordes (en lugar de los nodos) que se encuentran entre otros bordes de la red. Asume que los bordes que obtienen un puntaje alto en la intermediación tienen más probabilidad de ser puentes que los que no lo hacen.

Como en capítulos previos, comenzaremos por expandir a fondo los conceptos brevemente mencionados en el párrafo previo y concluiremos con un ejercicio práctico en Gephi. 

## Puntos de Corte

Un nodo, $n_{i}$ es punto de corte si el número de componentes en el grafo inicial es menor que el número de componentes en el subgrafo que resulta al remover dicho nodo [@Wasserman1994, 139]. Por ejemplo, en el grafo izquierdo de la Figura \@ref(fig:3-4-cutpoint) el nodo A es un punto de corte. ¿Por qué? Como dice la definición previa, al remover A se descompone el grafo en un número mayor de componentes (\@ref(fig:3-4-cutpoint) derecha).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-puentesycorredores_files/figure-latex/3-4-cutpoint-1} 

}

\caption{Ejemplo de punto de corte}(\#fig:3-4-cutpoint)
\end{figure}

El concepto de puntos de corte puede extenderse a un conjunto de nodos necesarios para mantener el grafo conexo, es decir un conjunto de corte [@Wasserman1994, 140]. De misma forma, el número de componentes en un grafo que contiene un conjunto de corte es menor que el que resulta al remover estos nodos. Por ejemplo, en la Figura \@ref(fig:3-4-cutset) el conjunto de corte {A, F} contiene dos nodos que al ser removidos incrementa el número de componentes en la red.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-puentesycorredores_files/figure-latex/3-4-cutset-1} 

}

\caption{Ejemplo de conjunto de corte}(\#fig:3-4-cutset)
\end{figure}

Los puntos y conjuntos de corte son esenciales para las redes donde el flujo de recursos, información o materiales son cruciales para el objetivo de la organización. Por ejemplo, en una red de comunicación la información suele viajar a través de estos nodos entre partes distantes de la red. Por consiguiente, el remover estos intermediadores resulta en una ruptura de comunicación. Sin embargo, cabe recalcar que no todos los nodos en un punto o conjunto de corte son creados iguales. Por ejemplo, en la Figura \@ref(fig:3-4-cutset) el remover el nodo F solo desconecta al nodo G del grafo y crea dos componentes en el proceso. Similarmente, el remover el nodo A de manera individual genera dos componentes {B, C, D} y {E, F, G}. Sin embargo, se puede hacer un argumento que al remover A impactamos la red de mayor manera que al remover F. Es por ello, que los analistas de redes tienden a utilizar los puntos o conjuntos de corte juntos con otras medidas de intermediación para determinar nodos o combinaciones óptimas para disrumpir una red de manera eficaz.


## Bi-componentes y Puentes

Un bi-componente es formalmente un componente sin punto de corte. Por lo tanto, estos son invulnerables a fragmentación en múltiples subestructuras al remover un solo punto de corte [@Everton2012, 265]. Por ejemplo, en la Figura \@ref(fig:3-4-bicomponents) encontramos tres bi-componentes: {A, B, C}, {D, E, F, G} y {F, H, I}. Note el traslapo entre componentes, por ejemplo, {D, E, F, G} y {F, H, I} comparten el nodo F, el cual es un punto de corte. De hecho, los nodos compartidos entre bi-componentes siempre son puntos de corte.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-puentesycorredores_files/figure-latex/3-4-bicomponents-1} 

}

\caption{Análisis de bi-componentes}(\#fig:3-4-bicomponents)
\end{figure}

A menudo, cuando los analistas hablan de bi-componentes se refieren a estructuras con tres o más nodos y sin un punto de corte [@Everton2012, 265]. Adicionalmente, de particular interés son los vínculos entre bi-componentes, como la relación en la Figura \@ref(fig:3-4-bicomponents) entre los nodos C y D en rojo. Para los enlaces existe una noción análoga al punto de corte, conocida como puentes. De acuerdo con @Wasserman1994 un puente es “una línea que hace que el grafo que contiene esta línea tenga menos componentes que el subgrafo que resulta una vez que se quita la línea (los nodos incidentes con la línea siguen estando en el subgrafo)” [@Wasserman1994, 140]. Otros autores definen los puentes como bi-componentes de dos nodos que al ser removidos desconectan la red [@Everton2012, 265]. Ambas definiciones capturan un punto clave, los puentes son enlaces claves que conectan regiones de la red, sin ellos el flujo efectivo de recursos, ideas o materiales es imposible.

## Intermediación de borde

La intermediación de bordes es definida de manera similar a la intermediación de nodos (ver [Centralidad de Intermediación]). @Borgatti2018 la definen como un recuento del número de veces que un enlace se encuentra en una ruta geodésica entre un par de vértices [@Borgatti2018, 221]. De manera formal podemos definir este índice con la misma notación desarrollada por Brandes [-@Brandes2001] y utilizada por Hashimoto y col. [-@Hashimoto2009] para describir la intermediación de bordes. Donde la intermediación de un borde $e$ en el grafo $G$, se denota como $I(e)$ y mide la frecuencia en la que $e$ aparece en el camino más corto (geodésico) entre dos distintos nodos $a$ y $b$. Aquí $\sigma_{ab}$ es el número de geodésicos entre $a$ y $b$ en un grafo $G$. Mientras que $\sigma_{ab}(e)$ es el número de geodésicos entre $a$ y $b$ que contienen $e$. Entonces, la intermediación de bordes es:

$$
I(e) = \sum\limits_{a, b}\frac{\sigma_{ab}(e)}{\sigma_{ab}}
$$

Donde la operación toma en cuenta todas las combinaciones distintas de nodos $a$ y $b$ en $G$. El resultado de esta operación es un índice numérico de intermediación para cada vínculo en la red. 

La medida fue desarrollada por Girvan y Newman [-@Girvan2002] con el propósito de localizar vínculos entre comunidades. De acuerdo con los autores, si una red contiene comunidades conectadas a través de un número escaso de vínculos intergrupales, entonces las rutas geodésicas entre estas comunidades deben atravesar estos enlaces [@Girvan2002]. Por consiguiente, estos enlaces entre comunidades deberán tener un índice alto de intermediación de borde. 

Por ejemplo, en la Figura \@ref(fig:3-4-edgebetween) los bordes han sido ponderados con base al índice de intermediación de cada enlace. En esta red los actores en cada subconjunto, {A, B, C, D} y {E, F, G, H}, se encuentran densamente interconectados internamente. Adicionalmente, el subconjunto {E, F, G, H} es adyacente a un nodo pendiente, I. El único camino entre estos subconjuntos consiste en el vínculo entre D y E. Por ello si un nodo en el subconjunto {A, B, C, D} desea compartir información con alguien en el subconjunto {E, F, G, H} o con I esta debe fluir a través del vínculo con mayor intermediación, es decir el camino más corto más a menudo. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-puentesycorredores_files/figure-latex/3-4-edgebetween-1} 

}

\caption{Representación esquemática de una red con dos comunidades densamente enlazadas entre sí por vínculos con alta intermediación.}(\#fig:3-4-edgebetween)
\end{figure}

::: {.infobox .note data-latex=""}
Recuerde que el algoritmo de intermediación optimiza el flujo entre nodos seleccionando los caminos más cortos. Es decir que los vínculos conexos a pendientes tendrán un índice relativamente alto puesto que solo existe un camino para acceder dicho nodo. Por ejemplo, en la Figura \@ref(fig:3-4-edgebetween) el vínculo entre {E, F, G, H} y I es relativamente alto, aunque solo conecta un solo nodo al resto del grafo.
:::

En términos prácticos, esta medida se utiliza a menudo en combinación con los puntos de corte y los puentes para iluminar caminos entre comunidades. A diferencia de los puentes, esta medida le provee al analista un índice continuo de valores. Es decir, a diferencia de una medida binaria esta presenta un rango de valores para que el analista decida que vínculos son más importantes y que diferencia cuantitativa existe entre estos.

## Agujeros Estructurales, Restricción y Autonomía

La última medida de corretaje que cubriremos en este capítulo es autonomía. Sin embargo, para poder entender esta medida es importante presentar el contexto teórico y matemático presentados por el autor de este índice, Ronald Burt.

La teoría de los agujeros estructurales de Burt [-@Burt1992] propone que las personas acumulan recursos sociales, o capital social, el cual pueden invertir en ciertos contextos sociales para generar una ganancia. Un agujero estructural es una ubicación dentro de la red donde los actores se encuentran desconectados. Por consiguiente, estos agujeros presentan oportunidades donde los actores en la red pueden invertir dicho capital social y cerrar estas aperturas conectando a dos o más actores adyacentes [@Monge2003, 143]. Otra manera de pensar en el valor de los agujeros estructurales es que estos permiten que un actor funcione como intermediador o corredor entre otros nodos no-conexos entre sí. Por lo tanto, con base a su posición en la red el corredor tiene la habilidad de influenciar el flujo de información, es decir, puede mantener un agujero estructural abierto y continuar como intermediario o puede cerrarlo.  

Por ejemplo, en la Figura \@ref(fig:3-4-holes) el actor A se localiza entre tres agujeros estructurales, estos son los espacios abiertos entre los nodos {B, H, F}. Estos tres agujeros ponen a A en una posición de corretaje donde esta puede coordinar el intercambio de información, materiales o recursos entre {B, H, F}. Adicionalmente, A se encuentra conectado a una variedad de círculos sociales, por lo tanto, tiene mayor acceso a recursos, información o materiales de cada grupo. En contraste, los nodos en cada comunidad periferia ({B, C, D}, {H, I, J} y {F, E, G}) tienen menor acceso a información no redundante puesto que cada grupo se encuentra esencialmente aislado.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-puentesycorredores_files/figure-latex/3-4-holes-1} 

}

\caption{Red social hipotética donde A se encuentra entre tres agujeros estructurales}(\#fig:3-4-holes)
\end{figure}


Para construir un índice que captura las propiedades de los agujeros estructurales, Burt utiliza como base la red del ego para cada actor, es decir, las tríadas en las que se encuentra incrustado cada actor [@Cunningham2016, 181]. Para ilustrar este punto, examinemos la Figura \@ref(fig:3-4-triads) que contiene cuatro posibles configuraciones posibles de la misma tríada de actores ({A, B, C}). La primera tríada (1) es una cerrada o completa; por consiguiente, ningún nodo se localiza entre agujeros estructurales y por extensión goza de una posición de corretaje. Las otras tres tríadas (2 a 4), son abiertas y cada una contiene un agujero estructural y un nodo en posición de corredor. En esta Figura el ego, actor A, ha sido coloreado de rojo mientras que los alternos se encuentran en azul. Burt sostiene que los alternos no conectados ofrecen recursos diferentes al ego [@Burt1992]. Por lo tanto, desde la perspectiva del ego la configuración preferible es aquella que observamos en la segunda tríada (2), donde el ego se encuentra en una posición de corretaje.


\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-puentesycorredores_files/figure-latex/3-4-triads-1} 

}

\caption{Cuatro tipos de tríadas}(\#fig:3-4-triads)
\end{figure}

El índice desarrollado para localizar nodos con poco grado de intermediación es la restricción. Esta mide cuantos alternos al ego tienen enlaces entre sí, lo cual determina el grado en que el ego invierte tiempo y energía en alternos que se conocen entre sí [@Borgatti2018]. Otra manera de pensar en restricción es pensar en la tríada cerrada ((1) en la Figura \@ref(fig:3-4-triads)). Esta es la tríada con la mayor restricción para el ego. Por lo tanto, las acciones y percepciones del ego son controladas por sus alternos. De manera opuesta, en una red del ego sin restricción ((2) en la Figura \@ref(fig:3-4-triads)) los alteres no están conectados entre sí, por ello estos no pueden coludir entre sí para influenciar las acciones o el acceso a recursos de ego [@Valente2010, 70]. 

Note que la medida de restricción no mide de manera directa el número de agujeros estructurales. De lo contrario, un nodo con alta restricción se encontrará a menudo entre pocos agujeros estructurales. Por lo tanto, a diferencia de otros índices del vértice, actores con baja restricción son aquellos en una posición beneficiosa. 

De manera formal, podemos definir la restricción de cada nodo $i$ como:

$$
C_{i} = (p_{ij} + \sum p_{iq}p_{qj})^2, q \neq, i, j
$$

Donde $p_{ij}$ representa la porción de los enlaces de $i$ compartidos con el alterno $j$. Además, $p_{iq}$ representa la proporción de los enlaces de $i$ compartidos con el alterno $q$, la cual se multiplica por $p_{qj}$, que representa la proporción de los vínculos de $q$ compartidos con el alterno $j$. 

Pongamos en práctica esta fórmula con un ejemplo sencillo, proporcionado por [Ruqin Ren]( https://ruqinren.wordpress.com/2018/03/01/hand-calculation-of-burts-constraint-in-networks/). En la Figura \@ref(fig:3-4-practice) vemos una red de 5 nodos. Como práctica, calculemos la restricción del nodo A a mano. 

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-puentesycorredores_files/figure-latex/3-4-practice-1} 

}

\caption{Red pequeña}(\#fig:3-4-practice)
\end{figure}

Primero, note que A se encuentra conectado a dos nodos adyacentes ({B, C}), por ello, calcularemos la restricción entre el ego A y cada nodo adyacente. Utilizaremos la centralidad grado (ver la tabla de grados) para determinar la porción de vínculos entre dos pares de nodos. Por ejemplo, la porción de vínculos entre el ego (A) y cada alterno ($p_{ij}$) es 0.5 puesto que A solo tiene un vínculo con B y C respectivamente, pero dos enlaces en total ($\frac{1}{2}$). 

$$
\begin{matrix}
  & Grado \\
A &  2    \\
B &  2    \\
C &  4    \\
D &  1    \\
E &  1    \\
(\#eq:3-4-attribute-matrix)
\end{matrix}
$$

Podemos calcular los valores restantes utilizando los índices de centralidad de grado de la siguiente manera:

$$
\begin{matrix}
Origen\,(i)  & Destino\,(j) & Camino\,(ij)     & Camino\, (iq)      & Camino\, (qj)      \\
A            & B           & 1                 & 1                  &  1                 \\
             & C           & 1                 & 1                  &  1                 \\
\\
             &             & Porción\,(ij)     & Porción\,(iq)      & Porción\,(qj)      \\
A            & B           & \frac{1}{2} = 0.5 & \frac{1}{2} = 0.5  & \frac{1}{4} = 0.25  \\
             & C           & \frac{1}{2} = 0.5 & \frac{1}{2} = 0.5  & \frac{1}{2} = 0.5  \\
(\#eq:3-4-constraint)
\end{matrix}
$$

Con estos valores, podemos calcular la restricción del nodo A:

$$
C_A = C_{AB} + C_{AC} = (0.5 + (0.5 \times 0.25))^2 + (0.5 + (0.5 \times 0.5))^2 = 0.953
$$

En términos prácticos, el software calculará este índice de manera eficaz. Sin embargo, es importante entender un poco sobre las mecánicas de este algoritmo y los índices resultantes. El valor máximo de restricción es 1.125, por lo tanto, en el ejemplo previo suponemos que el nodo A tiene una restricción alta y por lo tanto pocas opciones de corretaje.

@Cunningham2016 proponen invertir el índice de restricción para generar un valor de “autonomía”, es decir, el antónimo matemático. La autonomía se calcula restando el índice de restricción para cada nodo del valor máximo teorético de restricción (1.125). El valor resultante indica un valor potencial de corretaje, donde puntajes altos reflejan un alto potencial. Por ejemplo, el índice de restricción para el nodo A es 0.953, por lo tanto, su autonomía sería equivalente a 0.172. En otras palabras, A no se encuentra en una posición de corretaje. Contrastemos esta observación con la autonomía del nodo C, el cual tiene un índice de restricción de 0.406. Por lo tanto, su autonomía es equivalente a 0.718. Como notará en la Figura \@ref(fig:3-4-practice), el nodo C se encuentra entre múltiples agujeros estructurales y su autonomía indica un potencial de corretaje moderadamente alto.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{03-puentesycorredores_files/figure-latex/3-4-autonomy-1} 

}

\caption{Red con nodos dimensionados por autonomía}(\#fig:3-4-autonomy)
\end{figure}

Puesto que la idea de autonomía es una medida más intuitiva que la restricción, muchos analistas tienden a utilizarla a menudo para diferenciar de manera visual o cuantitativa los nodos con un potencial de corretaje alto (vea Figura \@ref(fig:3-4-autonomy)). Sin embargo, ambos índices son valiosos en el contexto adecuado. 

## Ejercicio Práctico

Desafortunadamente, por el momento Gephi solo calcula una de estas métricas: centralidad de puente, y deberá descargar el complemento Bridging Centrality para calcularlo.

Para este ejercicio usaremos la red de comunicación de una planta de procesamiento de madera donde los trabajadores rechazaron un nuevo paquete de compensación y finalmente se declararon en huelga. Por ello, la gerencia contrató a un consultor externo para analizar la estructura de comunicación del empleado porque consideró que los negociadores sindicales no estaban comunicando eficazmente la información sobre el paquete a todos los empleados. El consultor externo pidió a todos los empleados que indicaran, en una escala de 5 puntos, la frecuencia con la que hablaban de la huelga con cada uno de sus colegas, desde 'casi nunca' (menos de una vez por semana) a 'muy a menudo' (varias veces por día). El consultor utilizó 3 como valor de corte para identificar un vínculo entre dos empleados. Si al menos una de las dos personas indicó que hablaron sobre el trabajo con una frecuencia de tres o más, se incluyó un vínculo entre ellos en la red.

La red se encuentra clasificada en grupos por edad e idioma: empleados hispanohablantes de 30 años o menos, empleados angloparlantes de 37 años o menos y empleados angloparlantes de 38 años o más. Todos los vínculos entre grupos tienen antecedentes especiales. Entre los hispanos, Alejandro es el más competente en inglés y Bob habla algo de español, por lo que existe un vínculo entre ellos. Bob le debe a Norm por conseguir su trabajo y Ozzie es el padre de Karl, lo que ayuda a explicar sus lazos. Sam y Wendle son los negociadores sindicales y fueron los encargados de explicar el nuevo programa propuesto por los gerentes. 

### Puentes y Corredores en Gephi

:::{.row}
:::{.lcolumn-20 data-latex="{0.18\\textwidth}"}
*[Gephi]*

*Archivo > Abrir*
:::

:::{.col data-latex="{0.04\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.rcolumn-80 data-latex="{0.78\\textwidth}"}
1. En Gephi, primero importe el archivo [`strike.net`](https://raw.githubusercontent.com/cjcallag/arso/main/data/brokers_and_bridges/strike.net?token=AG4QS5GYM43UCDVHHTGMXWK7ZBWXU) (los archivos Pajek (.net) son un formato común de herramientas para ARSo). Asegúrese de indicar que el archivo no es dirigido y de elegir *Mínimo* como estrategia de combinación de bordes. A continuación, importe el archivo de atributos [`brokerage_scores.csv`](https://raw.githubusercontent.com/cjcallag/arso/main/data/brokers_and_bridges/brokerage_scores.csv?token=AG4QS5APNYXOIYAUNCOFMJS7ZBWZO), este debe leerse como una tabla de nodos separados por comas. En el segundo de los dos cuadros de diálogo de importación (Figura \@ref(fig:3-4-1)). Finalmente, en el informe de importación de Gephi, indique que desea agregar estos datos al espacio de trabajo existente y haga clic en *Aceptar*.
:::
:::

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/03-11-01} 

}

\caption{Cuadro de diálogo Importación de Gephi }(\#fig:3-4-1)
\end{figure}

:::{.row}
:::{.lcolumn-20 data-latex="{0.18\\textwidth}"}
*[Laboratorio de datos]*

*Tabla de Datos > Nodos*
:::

:::{.col data-latex="{0.04\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.rcolumn-80 data-latex="{0.78\\textwidth}"}
2. Verifique la *Tabla de nodos* en la ventana *Laboratorio de datos* para verificar que los atributos se hayan importado correctamente. Regrese a la ventana *Descripción general* y visualice la red donde el color del nodo refleja el grupo en el que se clasificaron (empleados hispanohablantes de 30 años o menos, empleados angloparlantes de 37 años o menos y empleados angloparlantes de 38 años o más). La Figura \@ref(fig:3-4-2) presenta un ejemplo.
:::
:::

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/03-11-02} 

}

\caption{Red Huelga, Color = Strike Groups, Peso del borde = Intermediación de Borde}(\#fig:3-4-2)
\end{figure}

:::{.row}
:::{.lcolumn-20 data-latex="{0.18\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.col data-latex="{0.04\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.rcolumn-80 data-latex="{0.78\\textwidth}"}
3. En la red, el vínculo entre Alejandro y Bob es el único canal de intercambio de información entre los empleados hispanos y todos los demás empleados. Eliminarlo aislaría a los empleados hispanos de la información que circula entre los demás empleados. Dicho de otra manera, cuando quitas el lazo entre Alejandro y Bob, desconectas a los trabajadores hispanos del resto de la red de comunicación. Tenga en cuenta que eliminar el vínculo entre Frank y Gill también desconecta la red: Frank se convierte en un aislado.
:::
:::

\newline

:::{.row}
:::{.lcolumn-20 data-latex="{0.18\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.col data-latex="{0.04\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.rcolumn-80 data-latex="{0.78\\textwidth}"}
4. La eliminación de un actor puede tener el mismo efecto que la eliminación de un enlace. Si Bob fuera removido, todos sus vínculos desaparecerían, incluido el puente con Alejandro. Bob se conoce como punto de corte, vértice de corte, punto de articulación o amplificador de límites (según el programa que utilice) porque eliminarlo desconecta la red. Los puntos de corte son cruciales para el flujo de información en una red. Son "cuellos de botella" en el sentido de que controlan el flujo de recursos de una parte de una red a otra. Formalmente, los puntos de corte son actores que pertenecen a dos o más bi-componentes, que son subredes que son invulnerables a la eliminación de un solo actor. En un bi-componente, ningún actor puede controlar completamente el flujo de información entre otros actores porque siempre hay un camino alternativo que los recursos pueden seguir.
:::
:::

\newline

:::{.row}
:::{.lcolumn-20 data-latex="{0.18\\textwidth}"}
*[Vista General]*

*Apariencia > Nodos > Color > Partición > Aplicar*
:::

:::{.col data-latex="{0.04\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.rcolumn-80 data-latex="{0.78\\textwidth}"}
5. Actualmente, Gephi no puede identificar bi-componentes y puntos de corte, por ello hemos importado los resultados de otros programas a Gephi. Coloree los nodos para reflejar los bi-componentes y los puntos de corte en la red Strike seleccionando la partición *cutpoints and bicomponents*. Ahora, los puntos de corte (Alejandro, Bob, Norm, Sam y Gill) deben ser todos del mismo color, mientras que los colores del resto de los actores deben reflejar sus respectivos bi-componentes. Puede comprobar por sí mismo que la eliminación de un punto de corte desconectará la red.
:::
:::

\newline

:::{.row}
:::{.lcolumn-20 data-latex="{0.18\\textwidth}"}
*Estadísticas > Grado medio> Ejecutar*

*Apariencia > Nodos > Tamaño> Ranking > Aplicar*
:::

:::{.col data-latex="{0.04\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.rcolumn-80 data-latex="{0.78\\textwidth}"}
6. A continuación, en la pestaña *Estadísticas* en la ventana *Visión general de la red*, *Ejecute* la función *Bridging Centrality*. Esto genera un informe, que puede cerrar. También calcula tres métricas: centralidad de intermediación, coeficiente de vinculación (agrupamiento) y centralidad de vinculación, siendo esta última el producto de las dos primeras. Primero, ajuste el tamaño de los nodos en términos de centralidad de intermediación. **¿Existe alguna asociación entre la centralidad de intermediación y qué nodos son puntos de corte?** A continuación, ajuste el tamaño de los nodos en términos de coeficiente de agrupamiento. **¿Qué sucedió?** Por último, ajuste el tamaño de los nodos en términos de centralidad de puenteo (Figura \@ref(fig:3-4-tres)). **¿Se compara esta medida con qué nodos son puntos de corte? ¿Cómo se compara con la centralidad de intermediación?** Recuerde, puede verificar las puntuaciones de centralidad de intermediación y puente en la ventana *Laboratorio de datos*.
:::
:::

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/03-11-03} 

}

\caption{Red Huelga: puntos de corte, bi-componentes y centralidad de puente}(\#fig:3-4-tres)
\end{figure}

:::{.row}
:::{.lcolumn-20 data-latex="{0.18\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.col data-latex="{0.04\\textwidth}"}
\ <!-- an empty Div (with a white space), serving as
a column separator for tex -->
:::

:::{.rcolumn-80 data-latex="{0.78\\textwidth}"}
7. Finalmente, ajuste el tamaño de los nodos en términos de puntajes de corretaje totales (no dirigidos) (*undirected g&f total*) (Figura \@ref(fig:3-4-cuatro)) y luego la medida de autonomía de Burt (*burt's autonomy*) (Figura \@ref(fig:3-4-cinco)). **¿Cómo se comparan estas visualizaciones con las anteriores? ¿Alguna medida parece más útil que otra?**
:::
:::

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/03-11-04} 

}

\caption{Red Huelga, puntos de corte, bi-componentes y corretaje}(\#fig:3-4-cuatro)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/03-11-05} 

}

\caption{Red Huelga: puntos de corte, bi-componentes y autonomía}(\#fig:3-4-cinco)
\end{figure}
