## Author(s):
## John Lövrot <john.lovrot@ki.se>
##
## Licence: CC BY 4.0
## https://creativecommons.org/licenses/by/4.0/

## Extract eset with probes annotated with the 11 PAM50-PROLIF genes
eset <- mainz[fData(mainz)$entrezid %in% Nielsen10CCRTabS1$entrezid, ]

## Collapse to genes
eset <- genefilter::featureFilter(eset)

## Derive PAM50-PROLIF metagene expression
mainz$PAM50PROLIF  <- colMeans(exprs(eset))

varMetadata(mainz)["PAM50PROLIF", "labelDescription"] <-
    "PAM50 proliferation index"

validObject(mainz)  # check
