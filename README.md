Example: PAM50 subtypes in the Mainz dataset
============================================

Aims
----

The aims of this R code bundle are: (1) to show how one can use the [ProjectTemplate](http://projecttemplate.net/) framework for a data analysis project, and (2) to give a basic introduction to PAM50 intrinsic subtypes and risk of reccurence score using a published breast cancer dataset.

Instructions
------------

Make sure the packages listed in config/global.cdf and their dependencies are installed. The package survplot can found at http://www.cbs.dtu.dk/~eklund/survplot/. Furthermore, the packages ProjectTemplate, rmarkdown, knitr, gplot, RColorBrewer, cowplot, breastCancerMAINZ and genefu are also needed.

Then

1. Run src/cache-objects.R
2. Knit reports/example-pam50-in-mainz.Rmd

A generated report (HTML version) can be viewed at [lovrot.github.io/misc-examples-pam50/](http://lovrot.github.io/misc-examples-pam50/).

- - -

Copyright (c) 2015 by John Lövrot.  
This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).
