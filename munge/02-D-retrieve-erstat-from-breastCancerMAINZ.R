## Author(s):
## John Lövrot (orcid.org/0000-0002-9339-8059)
##
## Licence: CC BY 4.0
## https://creativecommons.org/licenses/by/4.0/

## Retrive ER status from breastCancerMAINZ

assign("our_mainz", mainz) # rename

data("mainz", package="breastCancerMAINZ")
assign("their_mainz", mainz)  # rename

our_mainz$erstat <- factor(
    pData(their_mainz)[paste0("MAINZ_", our_mainz$subjid), "er"],
    levels=c(0, 1), labels=c("ER-", "ER+"))

remove(list="their_mainz")
assign("mainz", our_mainz)  # rename back

varMetadata(mainz)["erstat", "labelDescription"] <- varnamconv["erstat", "labelDescription"]

validObject(mainz)  # check