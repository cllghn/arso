set.seed(1014)

knitr::opts_chunk$set(
  comment = "",
  collapse = TRUE,
  cache = TRUE,
  echo = FALSE,
  fig.align = 'center',
  fig.width = 6,
  fig.asp = 0.618,  # 1 / phi
  fig.show = "hold",
  message = FALSE,
  out.width = "70%",
  warnings = FALSE
)

options(dplyr.print_min = 6, dplyr.print_max = 6)

# Supress crayon output
options(crayon.enabled = FALSE)

library(igraph)
my_igraph <- function(g, .layout = "layout_with_kk", ...) {
  stopifnot("Must be igraph" = igraph::is.igraph(g))
  stopifnot("Must be character" = is.character(.layout))
  igraph::plot.igraph(g,
                      # Feel:
                      layout       = eval(as.name(.layout)),
                      # Vertex:
                      vertex.color = "lightblue",
                      vertex.size   = 30,
                      # Edges:
                      edges.color  = "grey",
                      # Catch all
                      ...
                      )
}
my_bigraph <- function(g, .layout = "layout_as_bipartite", ...) {
  stopifnot("Must be igraph" = igraph::is.igraph(g))
  stopifnot("Must be character" = is.character(.layout))
  igraph::plot.igraph(g,
                      # Feel:
                      layout       = eval(as.name(.layout)),
                      # Vertex:
                      vertex.color = ifelse(igraph::get.vertex.attribute(g, name = "type"), "red", "lightblue"),
                      vertex.shape = ifelse(igraph::get.vertex.attribute(g, name = "type"), "square", "circle"),
                      vertex.size  = ifelse(igraph::get.vertex.attribute(g, name = "type"), 40, 30),
                      # Edges:
                      edges.color  = "grey",
                      # Catch all
                      ...
                      )
}
