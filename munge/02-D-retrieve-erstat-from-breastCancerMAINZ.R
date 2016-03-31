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

stopifnot(validObject(mainz))
