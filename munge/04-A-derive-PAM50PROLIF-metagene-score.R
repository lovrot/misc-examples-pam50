## Author(s):
## John Lövrot (orcid.org/0000-0002-9339-8059)
##
## License: CC BY 4.0
## https://creativecommons.org/licenses/by/4.0/

## Extract eset with probesets annotated with the 11 PAM50-PROLIF genes
eset <- mainz[fData(mainz)$entrezid %in% Nielsen10CCRTabS1$entrezid, ]

## Collapse to genes
eset <- genefilter::featureFilter(eset)

## Derive PAM50-PROLIF metagene expression score
mainz$PAM50PROLIF  <- colMeans(exprs(eset))

varMetadata(mainz)["PAM50PROLIF", "labelDescription"] <-
    "PAM50 proliferation index"

validObject(mainz)  # check
