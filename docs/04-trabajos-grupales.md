---
output: html_document
---

# Ejemplos Prácticos

Lo que sigue es una serie de descripciones generales de proyectos de análisis de redes generadas por los estudiantes que han participado en clases realizadas conjuntamente por NPS y ESGE.

:::{.showbox}
## Informe de la Red Criminal en la República de Panamá

:::{.row}
:::{.lcolumn-30}
La red identificada cuyo nombre es “Calor Calor”, la cual mantiene vínculos con organizaciones criminales en Colombia y México. Esta organización opera principalmente en Panamá, Centroamérica y Suramérica. 
:::

:::{.rcolumn-70}

\begin{center}\includegraphics[width=1\linewidth]{04-trabajos-grupales_files/figure-latex/unnamed-chunk-1-1} \end{center}
:::
:::

La banda criminal “Calor Calor” se dedica a actividades tales como:

  - Robo: Los mismos estuvieron en el robo al Banco Internacional de China por 2.5 millones de dólares en la Provincia de Colón en el año 2005 [@insightcrime]. 
  - Homicidios: Tribunales judiciales han confirmado que varios de sus miembros estuvieron involucrados en un homicidio con arma de fuego en el año 2014 en la Provincia de Colón [@siglodepanama].
  - Tráfico de Armas: En el año 2015, autoridades de policía han dado con la captura de armas de grueso calibre asociadas con miembros de esta banda criminal [@siglodepanama_b].
  - Tráfico de Droga: Se han dedicado al tráfico internacional de drogas desde Colombia para transportarla hasta las costas y puertos de Panamá para luego llevarlas a los carteles de Sinaloa, México [@prensa].
  - Pandillerismo: Sus actividades de pandillerismo se han extendido a provincias centrales [@Valdez].

El (los) objetivo(s) del grupo de investigadores fue definir la estructura de la red y comenzar a cuantificar los lazos ilícitos que unen a miembros de esta organización criminal, Calor Calor, dentro del área de operaciones de la República de Panamá. Este estudio aprovechó los datos de código abierto para los años 2000 a 2020.  

### Libro de Códigos

#### Relaciones

Todas las relaciones (modo-uno o dos) han sido ponderadas en este análisis, definido como la fuerza o importancia que mantiene un nodo determinado respecto a otros. Los pesos son definidos utilizando la siguiente escala: 3 como alto valor, 2 como valor medio y 1 como valor mínimo. 

##### Persona-a-persona (modo-uno)

  - Tipo de Actividad Criminal: se interpreta como actores conectados por participación conjunta en una actividad que constituye un delito, el cual puede pertenecer a los siguientes tipos o clasificaciones de acuerdo con su naturaleza: 
    - Homicidio
    - Droga
    - Asociación Criminal
    - Robo
    - Blanqueo de Capitales
    - Pandillerismo
    - Tráfico Ilegal de Armas
    - Evasión de Centros Penitenciarios
    - Colaboración desconocida

##### Persona-a-Ubicación (modo-dos)

  - Provincia: se puede interpretar como la división gubernamental o administrativa en que se divide un espacio territorial de un estado. Esta relación une personas a una ubicación en el área de estudio. Para este trabajo se tomaron en cuenta las siguientes provincias de la República de Panamá.
    - Panamá
    - Colon
    - Coclé
    - Panamá Oeste

##### Persona-a-Evento (modo-dos)

  - Tipo de Actividad Criminal: se interpreta como actores conectados a eventos criminales que constituyen un delito, el cual puede pertenecer a los siguientes tipos o clasificaciones de acuerdo con su naturaleza:
    - Homicidio
    - Droga
    - Asociación Criminal
    - Robo
    - Blanqueo de Capitales
    - Pandillerismo
    - Tráfico Ilegal de Armas
    - Evasión de Centros Penitenciarios
    - Colaboración desconocida
    
#### Atributos

  -	Tipo de Actor
    - Personas: Se considera a un ser que pertenece a la especie del tipo humano. 
    - Evento: Se refiere a cualquier acto que vaya en contra las normas jurídicas en donde se comete un delito. 
  
  - Rol de Persona:
    - Líder: son las personas que dentro de una organización criminal que ejercen mando o dan órdenes a sus subordinados. 
    - Operador: Se puede interpretar como una persona que obedece órdenes dentro de un grupo delincuencial; es decir, no tiene mando. 
    - Colaborador: en este trabajo, se define como una persona que mantiene cierto grado de colaboración, asistencia, apoyo con una organización de forma no precisada.

  - Sexo de la Persona:
    - Hombre: Una persona con características masculinas. También se puede entender varón o macho. 
    - Mujer: Se refiere a una persona del sexo femenino. 

### Mapa de red

El siguiente sociograma de red es el resultado de proyectar datos de dos modos y unificar todas las relaciones. Por lo tanto, el resultado final es una red de actores de un solo modo. Esta banda criminal mantiene 34 personas quienes han estado involucradas en 21 eventos criminales. Esta red mantiene una densidad de 0.148 y un diámetro de 8. Lo cual sugiere una red dispersa.

Los nodos se han sido coloreados de acuerdo con la función de cada persona dentro de la red. Los nodos morados son "operadores", los "líderes" son verdes y los "colaboradores" son rojos. Los datos registrados sugieren que la red Calor Calor está conectada por un conjunto de nodos con alta centralidad de intermediación. Estos nodos parecen formar el tejido conectivo central que une múltiples subconjuntos en la periferia.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{04-trabajos-grupales_files/figure-latex/unnamed-chunk-2-1} 

}

\caption{Red Calor-Calor}(\#fig:unnamed-chunk-2)
\end{figure}
:::

\newpage

:::{.showbox}
## Informe de la Red Oscura "INKASLAM"

Este trabajo grupal se realizó en el 2021 y se enfoca en la red oscura denominada "Inkaslam", la cual ha incrementado su popularidad e influencia en el Perú. Este crecimiento se ha dado en gran parte a su líder y fundador, aquí denominado “A1”, quien ha sido relacionado con personajes pertenecientes al grupo terrorista Hezbollah y en el Perú con el grupo terrorista Sendero Luminoso. De manera regional, se le ha visto relacionado con políticos de países limítrofes que promueven el proyecto político “Patria Grande” en Sudamérica. Por su asociación con organizaciones de interés, es relevante investigar esta red para determinar la extensión política e ideológica dentro del Perú, así como sus vertientes en el extranjero, desde el año 2016 hasta el 2020, con la finalidad de encontrar sus posibles fuentes de financiamiento y actores principales. 

:::{.row}
:::{.lcolumn-30}
El trabajo realizado por los integrantes del equipo incorpora datos de fuente abierta (por ejemplo audiovisuales, blogs, artículos de periódicos electrónicos, etc.). Con esta fuente limitada de información, se mapeó una red de dos diferentes tipos de actores: Personal (n = 20) y Organizaciones (n = 10). Estas entidades están unidas por distintos tipos de relaciones definidas en mayor detalle en el libro de códigos. 
:::

:::{.rcolumn-70}

\begin{center}\includegraphics[width=1\linewidth]{04-trabajos-grupales_files/figure-latex/unnamed-chunk-3-1} \end{center}
:::
:::

### Libro de Códigos

#### Relaciones

Las siguientes definiciones se aplican en la investigación para determinar las relaciones existentes (persona - persona / persona - organización / organización - organización) dentro de la red oscura.

  - Afiliación Política (modo-uno y -dos): Cuando nos referimos a esta relación hacemos referencia a la integración o inscripción de personas naturales, mayores de edad  y con plena capacidad de obrar, mediante la que adquieren los derechos y  obligaciones propios de los miembros de un partido político. 
  - Simpatía (modo-uno y -dos): Esta relación, es un sentimiento, generalmente instintivo,  de afecto o inclinación hacia una persona u organización, hacia su actitud o  comportamiento, provocando la replicación de sus acciones y pensamiento. 
  - Amistad (modo-uno): Esta referida a la relación afectiva entre dos o más  personas, son las relaciones interpersonales más comunes de las personas en  su vida, tiene presencia en distintas etapas de la vida y en diferentes grados de  importancia y trascendencia. 
  - Influencia Religiosa (modo-uno y -dos): Esta relación se refiere a ciertas manifestaciones exotéricas, creencias y cultos, que influyen en la idiosincrasia y comportamiento de las personas y organizaciones.  
  - Financiamiento (modo-uno y -dos): Esta relación se refiere a la interrelación monetaria entre dos o más personas o instituciones y viceversa; estas relaciones  se desarrollan al exterior o dentro de un país. 
  - Ideología (modo-uno y -dos): La relación está referida a las ideas fundamentales que  caracterizan el pensamiento de una persona, colectividad, un movimiento religioso o político. 
  - Familiar (modo-uno): Referida a la relación que se da entre miembros de un  núcleo familiar.
  - Vínculo Criminal (modo-uno y -dos): Comprende la relación entre personas u  organizaciones, con hechos delictivos cometidos o por los cuales están siendo  investigados, además de aquellos que ya han sido condenados. 
  
#### Atributos

Las siguientes definiciones se aplican en la investigación para determinar las  características propias y no relacionales de los actores, sean estos, personas u  organizaciones (Tipo / Ubicación / Rol) dentro de esta red oscura: 

  - Tipo de Nodo: Se refiere a la diferenciación entre personas y organizaciones. 
  - País: Hace referencia a la ubicación geográfica de los nodos.  
  - Clasificación: Referido al rol que desempeña una persona u organización, en  un lugar o en una situación. 

### Mapa de red

Al proyectar relaciones modo-dos y combinarlas con otros datos modo-uno se puede apreciar que la red de persona-a-persona (n = 20)  “Inkaslam” es relativamente densa (densidad = 0.32) y el grado medio es 6, lo cual sugiere un grupo de actores moderadamente interconectados entre sí. Además de una interconexión moderada, vemos que la distancia promedio entre actores es 1.86, lo cual sugiere una red relativamente compacta. 

Al analizar la red de manera visual (ver Figura \@ref(fig:4-3-grafo)), determinamos que la red tiene subgrupos altamente densos (por ejemplo, la camarilla de A6, A5, A18, A16, A15, A14, y A17) lo cual sugiere mayor cohesión interna entre miembros de estos subconjuntos en comparación con otros fuera de estos subconjuntos. Estos subgrupos cohesivos, en este caso específicamente las camarillas, pueden ser utilizados para determinar grupos donde la probabilidad de desertar es relativamente baja, en comparación con miembros periféricos de la red. Sin embargo, algunos sugieren que una estrategia para atacar camarillas es la propagación de desinformación en la camarilla pues cada miembro de la misma tiene acceso a todos los demás miembros de este subconjunto [@Cunningham2016]. Como puede ver, la alta densidad interna de una camarilla es una espada de doble filo. Por un lado, asegura la comunicación directa entre actores miembros de la camarilla. Asimismo, si el enemigo fuese a remover a un miembro de la camarilla podría aprender mucho sobre los otros miembros de dicho subgrupo.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{04-trabajos-grupales_files/figure-latex/4-3-grafo-1} 

}

\caption{Datos modo-uno agregados, nodos por intermediación}(\#fig:4-3-grafo)
\end{figure}

Además del enfoque en la estructura en la red, el análisis de dicha puede y a menudo tiende a centrarse en determinar actores clave para las operaciones de dicha organización. En la red  “Inkaslam” los analistas empezaron su análisis asumiendo la relevancia del líder y fundador denominado “A1”. Este ocupa la segunda posición en términos de centralidad de intermediación, después del actor “A6”. Al desagregar las relaciones utilizadas para generar la Figura \@ref(fig:4-3-grafo), vemos que “A6” es aquel con la mayoría de los vínculos financieros. 
:::




