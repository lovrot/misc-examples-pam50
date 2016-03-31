## Extract eset with probesets annotated with the 11 PAM50-PROLIF genes
eset <- mainz[fData(mainz)$entrezid %in% Nielsen10CCRTabS1$entrezid, ]

## Collapse to genes
eset <- genefilter::featureFilter(eset)

## Derive PAM50-PROLIF metagene expression score
mainz$PAM50PROLIF  <- colMeans(exprs(eset))

varMetadata(mainz)["PAM50PROLIF", "labelDescription"] <-
  "PAM50 proliferation index"

stopifnot(validObject(mainz))
