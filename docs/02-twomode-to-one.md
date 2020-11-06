---
output: html_document
bibliography: book.bib
---



# Derivando Datos Modo-Uno de Modo-Dos

(agregar texto aquí)

## Ejercicio Práctico

En este ejercicio exploraremos algunas de las propiedades de redes modo dos. Estas se diferencian de las redes de modo uno  puesto que consisten en dos conjuntos de actores, por ejemplo, un conjunto de personas y otro de eventos. A veces se les conoce como redes de afiliación, redes de membresía o incidencia.

Los datos que usaremos en este ejercicio se les conoce como los datos de Davis: Southern Club Women. Davis y sus colegas registraron la asistencia de 18 mujeres a 14 eventos sociales diferentes. El resultado es una matriz de persona por evento, por lo tanto, cada celda (*xij*) es igual a `1` si la persona (*i*) asistió al evento social (*j*), y `0` en el caso contrario.


### Antes de empezar

  1.	Para este laboratorio requerirá el módulo (plugin) complementario para procesar datos: *MultimodeNetworks Transformation*. Para comprobar si lo ha instalado previamente, cheque utilizando los comandos *Herramientas>Plugins* que abrirá un cuadro de diálogo (Figura ##). Allí, haga clic en la pestaña *Instalados*, y si ve el módulo en esta lista, puede dar clic en *Cerrar*.
  

```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

  2.	Si no lo ha instalado previamente, haga clic en la pestaña *Plugins disponibles*, desplácese hacia abajo y localice el módulo requerido (Figura ##). Marque la casilla a la izquierda de la opción y haga clic en *Instalar*. Siga las instrucciones. Para que estos cambios tomen efecto deberá reiniciar Gephi.


```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

  3.	Después de reiniciar Gephi, asegúrese que el nuevo módulo está instalado correctamente. Para activarlo, use los comandos *Ventana>Multimode Projections*. Esta acción abrirá una nueva ventanilla (Figura ##). Ahora está listo para comenzar con el resto del ejercicio.

### Importar Redes de Modo-dos en Gephi Utilizando Listas de Aristas

  1. Para importar datos de red modo-dos en formato de lista de bordes (o lista de aristas), usaremos dos conjuntos de datos. El primero, una lista de nodos que contiene una columna con la identificación del nodo (columna are requerida, `ID`), etiqueta y tipo de nodo. El segundo conjunto es una lista de aristas que contiene los vínculos entre nodos. Antes de importar los datos, eche un descargue a estos archivos (**PLEASE PUT LINK TO DATA HERE** and **PLEASE PUT LINK TO DATA HERE**).
  

```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```
  
  2. Primero debemos importar la lista de nodos. Utilice los comandos *Archivo>Abrir* y luego localice y abra `davisnode.csv`. En el cuadro de diálogo (Figura ##) dígale a Gephi que el archivo es una tabla de nodos y asegure que el separador entre valores sea una coma. Haga clic en *Siguiente* y luego en el siguiente cuadro de diálogo seleccione *Terminar*. Como siempre, esto abrirá el informe de importación (Figura ##). Por favor indique que el tipo de grafo es *No dirigido*, la estrategia para combinar las aristas es *Mínimo*,  y que desea agregar estos datos en un nuevo espacio de trabajo. Ahora, haga clic en *Aceptar*. 
  

```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

  3. Observe los datos que ha importado en la tabla de nodos en la ventana *Laboratorio de datos*. Si cambia a la ventana *Vista general* verá nodos, pero no aristas (lo cual es correcto puesto que no hemos importado los enlaces).

  4. Ahora, importe la lista de aristas (`davisedge.csv`) utilizando los comandos *Archivo > Abrir*. Esta vez, importe la lista de aristas, asegurándose que Gephi sepa que se está importando este tipo de archivo (*Tabla de Aristas*). Luego haga clic en *Siguiente* y en el siguiente cuadro de diálogo seleccione *Terminar*. En el informe de importación indique que el tipo de grafo es *No dirigido*, la estrategia para combinar las aristas es *Mínimo*,  y que desea añadir al espacio de trabajo existente. Finalice dando clic en *Aceptar* (Figura ##).
  

```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

  5.	Puesto que la tabla de nodos incluye un atributo (`type`) que indica si un nodo es `persona` o `evento`, no necesitamos la herramienta *MultiMode Networks Projection* que descargamos para diferenciar entre clases de nodos.  


```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

  6.	Cambie a la ventana *Vista general* y, en la pestaña *Apariencia*, seleccione *Nodos > Color > Partición* y, a continuación, con el menú desplegable *--Elija un atributo*, seleccione *type*. Antes de presionar *Aplicar*, haga clic en el enlace *Paleta…* justo arriba del botón *Aplicar* y elija la paleta roja / azul. Ahora presione *Aplicar*. Una vez que haya terminado, guarde sus datos, pero no cierre Gephi. En la siguiente parte, exploraremos cómo "plegar" una red de modo-dos para crear dos redes de modo-uno.

### Plegar Redes de Modo-dos en Gephi

  1.	En la ventana *Descripción general*, seleccione la pestaña *MultiMode Networks Projection* que utilizamos en la segunda sección de este laboratorio. De clic en el botón  *Load attributes* que cargara los atributos de los nodos. Ahora, en el menú desplegable *Attribute type* seleccione la opción *type*. Al plegar queremos crear dos redes de modo-uno, la primera entre personas y la segunda entre eventos.
  
  2.	Comencemos creando la red “persona a persona” (mujeres conectadas solo a mujeres). Para hacer esto, modifique los menús desplegables *Left matrix* y *Right matrix* de la siguiente manera, luego de clic en *Run*.

<!--html_preserve--><div id="htmlwidget-ac96cb3ee4656e2e9ec3" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-ac96cb3ee4656e2e9ec3">{"x":{"filter":"none","data":[["Left Matrix","Right Matrix"],["Person - Event","Event - Person"]],"container":"<table class=\"cell-border stripe\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th><\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"t","ordering":false,"order":[],"autoWidth":false,"orderClasses":false,"columnDefs":[{"orderable":false,"targets":0}]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

  3. Ahora agregaremos un filtro para extraer las relaciones de entre los nodos `person`. Seleccione la pestaña *Filtros*, abra la carpeta *Atributos* y localice la opción *type* dentro de la carpeta de *Partición*. Arrastre el filtro de *type* a la sección de *Consultas* (Figura ##). En respuesta a esta acción vera una nueva ventanilla al fondo de este panel (titulada *Partición (type) Configuración*), seleccione la opción *Person* y de clic en el botón *Fitrar* (Figura ##). Ahora exporte este grafico (y los datos filtrados) a un nuevo espacio de trabajo dando clic en el botón *Exportar el grafo filtrado en un nuevo espacio de trabajo* (el botón resaltado por una caja roja en la Figura ##).
  

```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

  4. En el espacio de trabajo recién creado, modifique la visualización de la red usando las herramientas de diseño en Gephi. La Figura ## es un ejemplo (diseño, etiquetas y el tamaño de nodos editados). Observando esta esta red conteste las siguientes interrogantes. **¿Qué mujeres parecen estar socialmente cerca entre sí? ¿Algunas son más centrales? ¿Qué mujeres parecen ser las más distantes del grupo?**
  

```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```

  5. Regrese al espacio previo de trabajo donde generó la red de modo-uno. En la ventanilla de *Filtros* seleccione *Auto aplicar* (al hacer esto el botón cambiará y dirá *Fitrar*). Regrese a la pestaña *MultiMode Networks Projection*, modifique los menús desplegables *Left matrix* y *Right matrix* de la siguiente manera, luego de clic en *Run*.

<!--html_preserve--><div id="htmlwidget-e5c8c404fe174e4c81bd" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-e5c8c404fe174e4c81bd">{"x":{"filter":"none","data":[["Left Matrix","Right Matrix"],["Event - Person","Person - Event"]],"container":"<table class=\"cell-border stripe\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th><\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"dom":"t","ordering":false,"order":[],"autoWidth":false,"orderClasses":false,"columnDefs":[{"orderable":false,"targets":0}]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

  6.	Una vez más vera nuevos enlaces en el gráfico. Ahora agregaremos un filtro para extraer las relaciones de entre los nodos “Eventos”. Seleccione la pestaña “Filtros”, abra la carpeta “Atributos” y localice la opción “type” dentro de la carpeta de “Partición”. Arrastre el filtro de “type” a la sección de “Consultas”. En respuesta a esta acción vera una nueva ventanilla al fondo de este panel (titulada “Partición (type) Configuración”), selecciones la opción “Event” y de clic en el botón “Fitrar”. Ahora exporte este gráfico (y los datos filtrados) a un nuevo espacio de trabajo dando clic en el botón “Exportar el grafo filtrado en un nevo espacio de trabajo”.

  7.	En el nuevo espacio de trabajo vera una red de modo uno que contiene relaciones de evento-a-evento. Como hicimos con la red de persona-a-persona modifique el gráfico con las herramientas de diseño en Gephi (Figura 20). Mirando esta red, ¿qué eventos parecen socialmente cercanos entre sí? ¿Alguno parece más central, más popular que los demás? ¿Alguno parece ser menos popular?
  

```
[1] "DO NOT FORGET TO ADD FIGURE HERE"
```
