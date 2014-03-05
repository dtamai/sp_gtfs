# Arquivo de rotas das linhas

library("plyr")
library("dplyr")
library("foreach")
library("doMC")

registerDoMC()

load.shapes <- function() {
  shapes <- read.csv("data/shapes.txt",
                     colClasses=c("factor", "numeric", "numeric", "NULL", "NULL")
                     )
  colnames(shapes) <- c("shape_id", "lat", "lon")

  ids <- levels(shapes$shape_id)
  list(shapes=shapes, ids=ids)
}

write.shape <- function(shapes, id) {
  filename <- paste(id, "tsv", sep=".")
  filepath <- paste("data/tmp/tsv", filename, sep="/")

  table <- shapes %.% filter(shape_id==id)
  write.table(table,
              filepath,
              append=FALSE,
              sep="\t",
              quote=FALSE,
              row.names=FALSE,
              )
}

split.shapes <- function() {
  shapes <- load.shapes()

  a_ply(shapes$ids, 1,
        .fun=function(id) write.shape(shapes$shapes, id),
        .parallel=TRUE
        )
}
