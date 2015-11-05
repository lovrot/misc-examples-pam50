## Author(s):
## John Lövrot (orcid.org/0000-0002-9339-8059)

cyanblackyellow <- function(n) gplots::colorpanel(n, "cyan", "black", "yellow")

colBuRd <- RColorBrewer::brewer.pal(5, "RdBu")[c(5, 3, 1)]
colorpanelBuRd <- function(n)
    gplots::colorpanel(n, colBuRd[1], colBuRd[2], colBuRd[3])

colBuYlRd <- RColorBrewer::brewer.pal(5, "RdYlBu")[c(5, 3, 1)]
colorpanelBuYlRd <- function(n)
    gplots::colorpanel(n, colBuYlRd[1], colBuYlRd[2], colBuYlRd[3])
