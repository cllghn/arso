---
output: html_document
---

# Proceso para la Investigación de Redes Sociales

Después de leer y trabajar con el material de las secciones anteriores, la pregunta por contestar es ¿para qué sirve todo esto? Podemos hacer un intento de responder; diciendo que todos estos datos sirven para que el analista pueda diseñar una estrategia de interrupción o empoderamiento de la red y presentarla para la toma de decisiones. 

Para apoyar dicha meta, los autores abordarán en esta sección algunos de los errores más comunes que se pueden cometer en ARSo. Este manual a proporcionado datos de red para facilitar el aprendizaje, presentándole un puñado de conjuntos de datos y orientándole sobre cómo utilizarlos con el software. Sin embargo, el cómo desarrollar un proyecto antes del análisis de datos ha estado mayormente ausente de la discusión. A raíz que muchos analistas aprenden ARSo usando conjuntos de datos listos para usar y con metas de aprendizaje definidas, algunos no saben cómo comenzar a diseñar un proyecto de investigación de red. Es por ello que esta sección abarca el tema de diseñar investigaciones de redes, tratando de presentarle cuestiones que deben tenerse en cuenta al construir un estudio. El lector reconocerá que muchos de los temas discutidos aquí no son específicos del análisis de redes sociales; además, esta no es la única discusión sobre cómo navegar este proceso (ver @Borgatti2018 o @Cunningham2016). Sin embargo, el siguiente es un marco desarrollado por NPS y ESGE para guiar a nuevos analistas de redes en el proceso de construir un buen diseño de investigación.


## Desarrollar un Proyecto Investigativo de ARSo

A continuación se presenta un orden sugerido de cómo abordar un problema. Sin embargo, de acuerdo con el criterio del analista podrá utilizar los insumos de la manera que contribuya a su trabajo.


### Pregunta(s) de Investigación

Un analista debe poder contestar brevemente ¿qué red, grupo o individuo se abordará en la investigación? y ¿Por qué? Este punto de partida puede ser por elección propia o debido a órdenes de un superior. El contestar esta breve interrogante previene que el proceso cambie y pierda su trayectoria. @Cunningham2016 nos provee el siguiente ejemplo sobre la importancia de tener un punto de partida claro:

> ... Un comandante militar puede solicitar que los analistas examinen la "red de apoyo" de una red oscura en particular basándose en una brecha de información. El término "red de apoyo" es importante y no debe asumirse su significado. [...] ¿"Red de apoyo", en este caso, indica activo, pasivo o alguna combinación? ¿Cómo deberían definir el apoyo pasivo frente al apoyo activo? ¿En qué momento el apoyo pasivo se convierte en apoyo activo? -- [@Cunningham2016, 37]
      
Como señalan los autores, definir la red es solo la mitad de la batalla. Definir claramente los conceptos y términos relevantes es crucial para comenzar a recopilar datos antes del análisis, particularmente cuando se trabaja con equipos o en un entorno con interrupciones constantes.

En este documento nos hemos centrado en explorar redes a través del prisma de estadísticas de red exploratorias o descriptivas. Las siguientes interrogantes son ejemplos de preguntas exploratorias que los analistas pueden hacer en las primeras etapas del análisis (adaptadas de @Everton2012):
  
  -	¿Qué podemos aprender de la estructura de la red y cómo podemos utilizar esta información en nuestras operaciones?
      -	Si la estructura es descentralizada ¿Por qué? ¿Qué ventajas tienen las redes descentralizadas? ¿Qué estrategias debemos implementar contra una red descentralizada?
      - Si la estructura es centralizada ¿Por qué? ¿Qué ventajas tienen las redes centralizadas? ¿Qué significa esto con respecto a la implementación de operaciones?
      - ¿Es densa? ¿Qué ventajas tiene una red densa? ¿Qué desventajas? 
      - ¿Es escasa? ¿Qué ventajas tiene una red escasa? ¿Qué desventajas? 
      - ¿A qué tipología corresponde (por ejemplo, mundo pequeño, sin escala, aleatoria)? Con base en esta tipología, ¿qué tipo de estrategia podemos tomar para fragmentar la red?
  - ¿Hay algunos vínculos que parecen ser más importantes que otros para la estructura general de la red?
  - ¿Hay subredes? ¿Hay uniones entre estas que puedan explotarse?
  - ¿Hay actores o vínculos claves cuya eliminación o aislamiento hará que la red sea menos efectiva?
  - ¿Hay nodos que aparentan ser más relevantes? 
    - ¿Qué tipo de relevancia (intermediación, actividad, etc.)? 
    

### Limites

La cita anterior enfatizó la importancia de aclarar los términos centrales como un paso integral en el diseño de una investigación de redes sociales. Igual de importante es comprender los bordes del análisis. Dado que este análisis se centra en los actores y las relaciones, una consideración clave es definir qué datos se incluirán. Una vez más, @Cunningham2016 proporciona una excelente guía para especificar límites, por ello la lista de preguntas que sigue fueron adaptadas de su libro:

  - ¿Cómo se define la población a sí misma? En términos de atributos, tipos de relaciones, participación en eventos o una combinación de estos. Por ejemplo, miembros de un cartel pueden identificarse como parte de dicha red con base en atributos característicos (tatuajes, roles, etc.), un objetivo compartido y participación en eventos. 
  - ¿Cómo se define la relevancia de un actor para el análisis?
    - Si el investigador se enfoca en atributos, puede preguntarse ¿son los actores relevantes porque poseen algún tipo de característica o conjunto de características, como un rol, afiliación organizacional y función logística? Por ejemplo, al mapear una red de comunicación entre líderes de una organización, el analista puede definir atributos como títulos (General, Comandante) como límite.
    - De otra manera, si los límites se definen con base en las relaciones, se puede preguntar ¿son relevantes los actores porque están incrustados en un tipo particular de relación? Por ejemplo, los actores dentro de una red financiera son parte de esta por sus vínculos a otros. 
    - Otro enfoque puede basarse en eventos o participación de actores en una actividad. Por ello se puede preguntar ¿son los actores pertinentes porque participaron en algún evento, como un ataque terrorista o un crimen? Por ejemplo, los actores que atienden a los mismos eventos sociales pueden ser conectados.
    - Además, puede ser una combinación de cualquiera de las categorías anteriores. Por ejemplo, muchas redes incluyen una combinación de relaciones actor a actor (financieras, comunicación), participación en eventos (co-asistencia) y atributos de nodo.


### Codificar Relaciones y Atributos


Ya sea que un analista esté trabajando con flujos de datos novedosos o avanzando un proyecto previo, un registro completo de las definiciones de las variables en el conjunto de datos es indispensable para garantizar la confiabilidad y veracidad de dicho proyecto. Es por esto que los analistas a menudo recurren a los libros de códigos como guías de referencia que contienen la ontología de la investigación.

Este manual incluye dos libros de códigos como ejemplo, localizados en el capítulo titulado ["Libros de Códigos"]. Las siguientes subsecciones proporcionan ejemplos y preguntas de orientación para como generar códigos.

#### Relaciones

Definidas como tipos de enlaces que conectan a diferentes actores de la red. Al codificar estas variables es importante no sólo definirlas, sino que hay que indicar si son modo-uno o bimodal, dirigidas o no dirigidas, etc. El límite de la red proporciona una guía sobre qué relaciones son cruciales para mapear una red. Sin embargo, el libro de códigos puede ser útil para definir las relaciones, proporcionar ejemplos y denotar explícitamente los tipos de clases de nodos vinculados a través de cada relación. Es relevante considerar las preguntas:

  - ¿Qué tipo de relaciones son esenciales para el análisis? Por ejemplo, relaciones actor a actor, participación en eventos y el compartir atributos.
  - ¿Cada relación, es de modo-uno o de modo-dos?

#### Atributos

Características no-relacionales relevantes para cada categoría de nodos que abarcará la investigación. Por lo general, los analistas definen antes de recopilar o cuando se lleva a cabo la recopilación de datos, las variables relacionadas con los nodos del proyecto. Como tal, es relevante considerar las preguntas:

  - Los atributos en esta red, ¿se deben recolectar al nivel del individuo? ¿Organización? ¿País? ¿Múltiples?
  - ¿Qué características no relacionales son clave para describir la red a nivel tipológico, sus subgrupos y los actores de manera individual? 

### Fuentes de Datos y Métodos de Recopilación

Supongamos que un investigador de redes sociales está estudiando los lazos "financieros" dentro de una determinada organización ilícita. ¿Cómo se podrían recopilar los datos necesarios para este esfuerzo? Es decir, es poco probable que los miembros de la red ofrezcan voluntariamente esta información si uno pudiera establecer comunicación con estos. Más aún, si el investigador pudiera entrevistar a los sujetos del estudio con el fin de recopilar vínculos "financieros", ¿cabría esperar que todos los sujetos interpretaran "financieros" de la misma manera? ¿Cuál sería la mejor manera de interactuar con los sujetos de la investigación (por ejemplo, digitalmente, en persona, a través de la observación)? Como señala Borgatti, "las características de estas preguntas dependerán en última instancia de las características de la población, del tipo de relaciones sociales que se estudien y, sobre todo, de los objetivos de la investigación" [@Borgatti2018]. Las secciones anteriores han cubierto la importancia de determinar los límites de la investigación, codificar explícitamente las variables e identificar los objetivos del esfuerzo. Aquí, el enfoque cambia nuevamente, esta vez para resaltar fuentes de datos y su recopilación.

#### Cuestionarios

Para el analista de redes, como para otros investigadores trabajando en proyectos de ciencias sociales, el cuestionario suele contener preguntas sobre los lazos del actor, aquí un informante, a otros. Por ejemplo, un informante puede proporcionar datos sobre con quién se comunica o de quién busca información. @Wasserman1994 proporcionan un esquema de los tipos de preguntas que se pueden utilizar en un cuestionario, el siguiente es un resumen de los puntos hechos por los autores:

  - Un listado de personas para a evocar libremente: Cuando el investigador conoce los miembros de la red antes de desarrollar un cuestionario para capturar las relaciones entre estos mismos, se puede presentar un listado de los demás actores para que los informantes seleccionen. Ejemplos de este enfoque se pueden encontrar en el trabajo de David Krackhardt [-@Krackhardt1992; -@Krackhardt1994]. Alternativamente, el investigador puede no presentar un listado y solicitarle al informante que evoque libremente a otros actores con los que comparten un tipo particular de vínculo.
  - Elección libre con número fijo: El solicitar del informante un número específico de relaciones con otros actores en un cuestionario se conoce como elección fija. Este parámetro establece un número máximo de vínculos que un actor determinado puede tener en la red. Alternativamente, el no especificar un número de vínculos del informante se conoce como elección libre. Ambos enfoques tienen ventajas y desventajas, los investigadores interesados en esta forma de diseño de cuestionarios pueden consultar la literatura. 
  - Puntuaciones u ordenaciones: Una forma de medir la intensidad de los lazos es el requerir que los actores punteen u ordenen a los demás actores de la red. Las ordenaciones requieren que los informantes ordenen sus lazos con otros. El asignar puntuaciones implica que cada actor de un valor a cada relación. 

Cabe recalcar que el utilizar cuestionarios es poco común para recopilar datos de las redes oscuras ya que, por definición, los miembros de estas buscan permanecer ocultos. Sin embargo, cuando posible, deben ser considerados ya que brindan datos de primera mano sobre las relaciones dentro de una red.

#### Entrevistas

Las entrevistas se utilizan para recopilar datos relacionales y pueden tener lugar cara a cara o por teléfono. Al igual que los cuestionarios, es posible que las entrevistas formales no sean disponibles para los investigadores de redes oscuras debido a la naturaleza de estas organizaciones. Sin embargo, los investigadores a menudo pueden recopilar datos relacionales y de atributos a través de entrevistas informales o conversaciones con personas en el área de responsabilidad [@Cunningham2016]. Cabe recalcar que al utilizar entrevistas informales es necesario validar toda información recopilada por este medio.

#### Observación Directa

La observación de los actores es otra manera de recopilar datos valiosos de la red. Los métodos de observación son comúnmente una herramienta en estudios que incorporan redes de afiliación donde el investigador puede registrar la asistencia a un evento o acontecimiento social que se estudia. 

#### Recopilación de datos de archivo

Los datos de la red a menudo se recopilan de fuentes de archivo, como registros informáticos o de comunicación, listas de asistencia, informes de situación o de inteligencia, entre otros. Algunas fuentes de archivo son intrínsecamente relacionales, lo que facilita la recopilación e interpretación. Por ejemplo, los registros de asociaciones comerciales se pueden aprovechar para vincular entidades basadas en vínculos "comerciales", usualmente de modo-uno. Otras fuentes de datos pueden requerir interpretación adicional, como registros de co-asistencia a eventos. En este conjunto de datos modo-dos, los participantes del evento pueden vincularse a un evento y, cuando sea apropiado, entre sí.

Más allá de la abundancia de posibles fuentes de datos, los datos de archivo suelen ser por naturaleza longitudinales, lo que permite el estudio de la dinámica de la red y el cambio social [@Borgatti2018]. Una vez más, si el enfoque de la investigación son los vínculos financieros, un investigador con acceso a registros financieros puede trazar la progresión de los cambios a lo largo del tiempo.

Al aprovechar los datos de archivo, los investigadores han encontrado formas muy creativas de descubrir información relacional. Sin embargo, esta fuente no está exenta de limitaciones y posibles fuentes de sesgos. Algunos registros de archivo representan una reconstrucción de los eventos pasados, que pueden contener prejuicios o reflejar las perspectivas de los actores que recopilaron dichos datos [@Borgatti2018]. Además, los datos pueden estar incompletos debido a varias razones; por ejemplo, los lazos comerciales son susceptibles a empresas fachada, los registros de comunicación no toman en cuenta la comunicación cara a cara, entre otros. Como tal, los analistas deben ser conscientes de las posibles deficiencias de datos de archivo y triangular a través de múltiples fuentes verificadas y validadas.

#### Registros Propios

La utilización de bases de datos propios es un método cada vez más común para recopilar datos de red. Las organizaciones con grandes conjuntos de datos relacionales que involucran datos unimodales o multimodales pueden aprovechar estos datos para estudiar mejor una población. Por ejemplo, los analistas de la policía pueden vincular a las personas con arrestos y generar redes de co-delincuentes. Este enfoque es escalable, ya que muchas organizaciones recopilan grandes volúmenes de registros. Sin embargo, como todos los métodos para recopilar datos presentados en esta sección, este mismo tiene ventajas y desventajas. Por ejemplo, como se señaló anteriormente, los departamentos de policía podrían construir redes sociales utilizando datos de arrestos conjuntos; después de todo, muchos recopilan estos datos para medir el rendimiento de la organización. De tal manera que, al construir un análisis de redes criminales basándose solo en un subconjunto de la población, aquellos que han sido arrestados, los analistas corren el riesgo de construir un círculo vicioso en el que la atención sigue centrada en un subconjunto de delincuentes. Finalmente, al igual que con otras fuentes de datos, la investigación debe impulsar la selección de fuentes de datos, no la disponibilidad de estos.
 
### Conclusiones

Esta sección fue diseñada para guiar a los analistas en el proceso de diseño de una investigación de análisis de redes sociales. Cubrimos cómo construir preguntas de investigación como un primer paso para guiar a los investigadores en el diseño, recopilación y análisis. De manera similar, esta sección abordó el valor de los libros de códigos para construir consistencia en la recopilación y estructuración de datos. Finalmente, esta sección abordó algunas de las fuentes de datos que se utilizan a menudo para recopilar y estructurar los datos de las redes sociales. Sin embargo, esta sección no abordó a fondo temas de confiabilidad, validez y otras consideraciones importantes que los investigadores de redes sociales deben ponderar antes de embarcarse en el análisis. No obstante, el marco proporcionado en esta sección debe verse como un conjunto inicial de principios para educar a los nuevos analistas de redes sociales sobre cómo comenzar a utilizar algunas de las herramientas, técnicas y métodos presentados en este manual.

    
