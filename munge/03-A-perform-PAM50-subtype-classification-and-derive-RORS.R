## (Academic version of) PAM50 intrinsic subtype classification
## ------------------------------------------------------------
##
## Cf. Parker's R code bundle at https://genome.unc.edu/pubsup/breastGEO/PAM50.zip
##
## Further reading:
## Prat A, Parker J, Perou CM.
## UNC UMD Supplement: How to Perform Intrinsic Subtype Classification
## https://genome.unc.edu/pubsup/breastGEO/Guide%20to%20Intrinsic%20Subtyping%209-6-10.pdf
##
## Author(s):
## John Lövrot (orcid.org/0000-0002-9339-8059)
##
## License: CC BY 4.0
## https://creativecommons.org/licenses/by/4.0/

## Assemble PAM50centroids object
data("pam50", package = "genefu")
PAM50centroids <- pam50$centroids
rownames(PAM50centroids) <- pam50$centroids.map$EntrezGene.ID
lkup <- c("Basal" = "BL", "Her2" = "H2", "LumA" = "LA", "LumB" = "LB", "Normal" = "NBL")
colnames(PAM50centroids) <- lkup[colnames(pam50$centroids)]

## Extract eset with probes annotated with the PAM50 genes
eset <- mainz[fData(mainz)$entrezid %in% rownames(PAM50centroids), ]

## Collapse to genes
eset <- genefilter::featureFilter(eset)
featureNames(eset) <- fData(eset)$entrezid
annotation(eset) <- "org.Hs.eg"

## Derive relative expression
## Importance of proper gene centering, see, for example, Sorlie10LancetOncol
## (PMID 20688275), Perou10LancetOncol (PMID 20688274) and Zhao15BCR (PMID 25849221)
exprs(eset) <- sweep(exprs(eset), 1, apply(exprs(eset), 1, "median"))

## Derive centroid correlations
correlations <- cor(exprs(eset), PAM50centroids[featureNames(eset), ], method = "spearman")
pData(eset) <- cbind(pData(eset), correlations[sampleNames(eset), ])

## Classify to nearest centroid
pData(eset)$subtypecd <- colnames(PAM50centroids)[apply(correlations[sampleNames(eset), ], 1, which.max)]

## Derive ROR-S score  (Risk of reccurence score, subtype alone)
## Coefficients from
## Parker09JCO:p1162, ROR-S  =  0.05*basal + 0.12*Her2 - 0.34*LumA + 0.23*LumB
## Nielsen10CCR:Suppl ROR-S  =  0.05*Basal + 0.12*Her2 - 0.34*LumA + 0.23*LumB
pData(eset) <- within(pData(eset), {
  RORS <- 0.05*BL + 0.12*H2 + -0.34*LA + 0.23*LB
})

## Append to ExpressionSet
mainz$subtypecd <- pData(eset)[sampleNames(mainz), "subtypecd"]
mainz$RORS <- pData(eset)[sampleNames(mainz), "RORS"]

lkup <- c(
  "LA" = "Luminal A",
  "LB" = "Luminal B",
  "H2" = "HER2-enriched",
  "BL" = "Basal-like",
  "NBL" = "Normal breast-like")
mainz$subtype <- lkup[as.character(mainz$subtypecd)]

## Turn into factors
mainz$subtypecd <- factor(mainz$subtypecd, levels = names(lkup))
mainz$subtype <- factor(mainz$subtype, levels = lkup)

pick <- c("subtypecd", "subtype")
varMetadata(mainz)[pick, "labelDescription"] <- varnamconv[pick, "labelDescription"]
varMetadata(mainz)["RORS", "labelDescription"] <- "PAM50 Risk of reccurence score (subtype alone)"

validObject(mainz)  # check
