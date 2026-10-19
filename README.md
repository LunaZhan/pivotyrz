
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pivotyrz

<!-- badges: start -->

<!-- badges: end -->

## Overview

The goal of pivotyrz is to create a reusable pivot_longer function for
datasets with repeating year columns following format of X+yearnumber

## Installation

You can install the development version of pivotyrz from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("LunaZhan/pivotyrz")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(pivotyrz)
matmor <- pivot_longer_xyear(dataname = maternal_mortality, id = iso, varname = "matmor")
```
