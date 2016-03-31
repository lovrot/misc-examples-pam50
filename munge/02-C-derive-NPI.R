# https://en.wikipedia.org/wiki/Nottingham_Prognostic_Index

if (all(mainz$tumsizeu == "cm") & all(mainz$lnstat == "LN-"))
    mainz$NPI <- with(pData(mainz), 0.2*tumsize + 0 + histgrn)

varMetadata(mainz)["NPI", "labelDescription"] <- "Nottingham prognostic index"

stopifnot(validObject(mainz))
