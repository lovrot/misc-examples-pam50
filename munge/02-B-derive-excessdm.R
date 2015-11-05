## Author(s):
## John Lövrot (orcid.org/0000-0002-9339-8059)
##
## Licence: CC BY 4.0
## https://creativecommons.org/licenses/by/4.0/

## Derive excess distant metastases (martingale residuals in an empty Cox model)

tmpPDataSubset <- subset(pData(mainz), !is.na(survdmtm) & !is.na(dmstat))

model <- coxph(Surv(survdmtm, dmstat) ~ 1, data=tmpPDataSubset)
tmpPDataSubset$excessdm <- residuals(model, method="martingale")

tmpPData <- merge(pData(mainz), tmpPDataSubset, all=TRUE)
rownames(tmpPData) <- tmpPData$samplenam
tmpPData <- tmpPData[sampleNames(mainz), ]

pData(mainz) <- tmpPData

varMetadata(mainz)["excessdm", "labelDescription"] <- "Excess distant metastases"

validObject(mainz)  # check
