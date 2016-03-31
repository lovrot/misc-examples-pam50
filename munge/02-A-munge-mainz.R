## Munge clinical-pathological data to adhere with variable naming convention
pData(mainz) <- within(pData(mainz), {
  samplenam <- as.character(geo_accession)
  siteid <- as.character(clinic)
  subjid <- substr(as.character(title), 1, 6)
  lnstat <- factor(as.integer(node), levels = c(0, 1), labels = c("LN-", "LN+"))
  tumsize <- as.numeric(size_in_cm)
  tumsizeu <- "cm"
  histgr <- factor(as.integer(grade),
    levels = c(1, 2, 3), labels = c("G1", "G2", "G3"))
  histgrn <- as.integer(grade)
  survdmtm <- as.numeric(t.dmfs)
  survdmtmu <- "months"
  dmstat <- as.integer(e.dmfs)
})

## Append variable metadata
if (!("labelDescription" %in% names(varMetadata(mainz))))
  varMetadata(mainz)$labelDescription <- NA  # initialise
pick <- intersect(varLabels(mainz), varnamconv$variableName)
varMetadata(mainz)[pick, "labelDescription"] <-
  varnamconv[pick, "labelDescription"]

## Append annotations
fData(mainz)$probeid <- featureNames(mainz)
fData(mainz)$entrezid <- unlist(mget(featureNames(mainz),
  hgu133aENTREZID, ifnotfound = NA))
fData(mainz)$symbol <- unlist(mget(featureNames(mainz),
  hgu133aSYMBOL, ifnotfound = NA))

## Check
if (!validObject(mainz))
  stop("mainz not munged correctly")
