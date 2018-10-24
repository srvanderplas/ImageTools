
[![license](https://img.shields.io/badge/license-MIT%20+%20file%20LICENSE-lightgrey.svg)](https://choosealicense.com/)
[![Last-changedate](https://img.shields.io/badge/last%20change-2018--10--24-yellowgreen.svg)](/commits/master)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/srvanderplas/ImageTools.svg?branch=master)](https://travis-ci.org/srvanderplas/ImageTools)
[![Coverage
status](https://codecov.io/gh/srvanderplas/ImageTools/branch/master/graph/badge.svg)](https://codecov.io/github/srvanderplas/ImageTools?branch=master)
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ImageTools

ImageTools is intended to be a convenience package of functions for
working with images.

## Installation

You can install the released version of ImageTools from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ImageTools")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(imager)
#> Loading required package: magrittr
#> 
#> Attaching package: 'imager'
#> The following object is masked from 'package:magrittr':
#> 
#>     add
#> The following objects are masked from 'package:stats':
#> 
#>     convolve, spectrum
#> The following object is masked from 'package:graphics':
#> 
#>     frame
#> The following object is masked from 'package:base':
#> 
#>     save.image
library(ImageTools)
res <- all_slices(boats, size = c(128, 128), delta = c(32, 32))

par(mfrow = c(3, 4))
plot(as.imlist(res$img)[1:12])
```

<img src="man/figures/README-example-1.png" width="100%" />
