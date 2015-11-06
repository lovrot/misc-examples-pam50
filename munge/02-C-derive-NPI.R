## Author(s):
## John Lövrot (orcid.org/0000-0002-9339-8059)
##
## Licence: CC BY 4.0
## https://creativecommons.org/licenses/by/4.0/

# https://en.wikipedia.org/wiki/Nottingham_Prognostic_Index

if (all(mainz$tumsizeu == "cm") & all(mainz$lnstat == "LN-"))
    mainz$NPI <- with(pData(mainz), 0.2*tumsize + 0 + histgrn)

varMetadata(mainz)["NPI", "labelDescription"] <- "Nottingham prognostic index"

validObject(mainz)  # check