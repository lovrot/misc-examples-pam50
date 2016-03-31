## Derive excess distant metastases (martingale residuals in an empty Cox model)

tmpPDataSubset <- subset(pData(mainz), !is.na(survdmtm) & !is.na(dmstat))

model <- coxph(Surv(survdmtm, dmstat) ~ 1, data=tmpPDataSubset)
tmpPDataSubset$excessdm <- residuals(model, method="martingale")

tmpPData <- merge(pData(mainz), tmpPDataSubset, all=TRUE)
rownames(tmpPData) <- tmpPData$samplenam
tmpPData <- tmpPData[sampleNames(mainz), ]

pData(mainz) <- tmpPData

varMetadata(mainz)["excessdm", "labelDescription"] <- "Excess distant metastases"

stopifnot(validObject(mainz))
