library(GEOquery)

if (Sys.getenv("USER") == "lovrot") {
  destdir <- "~/data/cache/"
} else {
  destdir <- tempdir()
}
mainz <- getGEO("GSE11121", destdir = destdir, GSEMatrix = TRUE)[[1]]

# unique(mainz$data_processing)
exprs(mainz) <- log2(exprs(mainz))

annotation(mainz) <- "hgu133a"

## Extract clinical-pathological characteristics
for (i in 1:6) {
  tmp <- as.character(pData(mainz)[, paste0("characteristics_ch1.", i)])
  varnam <- tolower(trimstr(unique(unlist(lapply(strsplit(tmp, ": "), function(x) x[1])))[1]))
  varval <- unlist(lapply(strsplit(tmp, ": "), function(x) trimstr(x[2])))
  pData(mainz)[, varnam] <- varval
}

## Check
if (!validObject(mainz))
  stop("mainz not assembled correctly")
