Example: PAM50 intrinsic molecular subtypes in the Mainz breast cancer dataset
==============================================================================

Aims
----

The aims of this R code bundle are: (1) to show how one can use the [ProjectTemplate](http://projecttemplate.net/) framework for a data analysis project, and (2) to give a basic introduction to PAM50 intrinsic molecular subtypes and risk of reccurence score using a published breast cancer dataset.

Instructions
------------

Make sure the packages listed in the project configuration `config/global.cdf` and their dependencies are installed. The package survplot can found at http://www.cbs.dtu.dk/~eklund/survplot/ and is prefarably installed from source:
```
download.file(
  url="http://www.cbs.dtu.dk/%7Eeklund/survplot/survplot_0.0.7.tar.gz",
  destfile="survplot_0.0.7.tar.gz")
install.packages("survplot_0.0.7.tar.gz",
  repos=NULL, type="source")
```

Furthermore, the packages ProjectTemplate, rmarkdown, knitr, Hmisc, gplot, RColorBrewer, cowplot, breastCancerMAINZ and genefu are also needed.

Then retrive, munge and cache all data: 
```
source("src/cache-objects.R")
```

Finally, render the report:
```
rmarkdown::render("reports/example-pam50-in-mainz.Rmd")
```
If you’re using RStudio, you can also open the R Markdown file and hit the ”Knit” button, see also https://rmarkdown.rstudio.com/authoring_quick_tour.html#rendering_output

A generated report can be viewed at [lovrot.github.io/misc-examples-pam50/](http://lovrot.github.io/misc-examples-pam50/).

- - -

Copyright (c) 2015-2017 by John Lövrot.  
This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).
