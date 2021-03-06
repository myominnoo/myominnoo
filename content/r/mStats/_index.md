---
date: "2021-06-13"
linkTitle: mStats
summary: An open-source R package for data analysis and report writing.
title: "\U0001F396 mStats"
type: book
---

# <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![](man/figures/lifecycle-maturing.svg)](https://www.tidyverse.org/lifecycle/#maturing)

<!-- badges: end -->

mStats is a open-source R package to facilitate data analysis with R in
health research. It comprises of three major sets of functions:

-   `data management`
-   `statistical analysis`
-   `calculation of epidemiological measures`

These functions are in turn supported by another set of helper functions
on the backend, which allows statistical calculation, displaying
well-formatted output and transferring final outputs to process further.

In a nutshell, mStats is designed to make data analysis quick and easy
to create the final report for health research project. You can see it
in action to [Get Started](https://myominnoo.github.io/mStats/).



## Installation


------------------------------------------------------------------------

You can install the released version of mStats from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("mStats")
```

### Development version

If you want to use the development version of the bookdown package, you
can install the package from GitHub via the {remotes
package}(<https://remotes.r-lib.org/>):

``` r
remotes::install_github("myominnoo/mStats")
```


## Cheat Sheet

------------------------------------------------------------------------

to add later


## Masking

------------------------------------------------------------------------

The `mStats`package contains two functions (`append`, `replace`) that
have the same names (doing different operation) with base R packages
(`stats` and `base`). Loading the `mStats` masks the functions from base
R. It means that when you use `append` function, you are using the
function from `mStats`. To avoid this:

-   use the syntax `package::function()`, for example `base::append()`
    or `mStats::append()`.
-   remove `mStats` from the session using `detach(package:mStats)`.


## Usage

------------------------------------------------------------------------

The easiest way to get started with mStats is to follow the guide
[here](https://myominnoo.github.io/mStats/). Below is a quick
demonstration of what mStats can do.

``` r
library(mStats)


## Describe dataset after data import
codebook(iris)
#>        Codebook
#>    Dataset's Name : `iris`
#>   Dataset's Label : 
#>       Vars : 5
#>        Obs : 150
#>  + -- ------------ + ----- ------- --- -- ----- +
#>  | No     Variable | Label    Type Obs NA NA(%) |
#>  + -- ------------ + ----- ------- --- -- ----- +
#>  |  1 Sepal.Length |       numeric 150  0   0.0 |
#>  |  2  Sepal.Width |       numeric 150  0   0.0 |
#>  |  3 Petal.Length |       numeric 150  0   0.0 |
#>  |  4  Petal.Width |       numeric 150  0   0.0 |
#>  |  5      Species |        factor 150  0   0.0 |
#>  + -- ------------ + ----- ------- --- -- ----- +


## Label variables and dataset
iris <- label(iris, "Edgar Anderson's Iris Data")
#>   (`iris` labeled as `Edgar Anderson's Iris Data`)
iris <- label(iris, Sepal.Length = "Length of Sepal",
              Petal.Length = "Length of Petal",
              Species = "Type of species")
#>   (`Sepal.Length` labeled as `Length of Sepal`)
#>   (`Petal.Length` labeled as `Length of Petal`)
#>   (`Species` labeled as `Type of species`)
codebook(iris)
#>        Codebook
#>    Dataset's Name : `iris`
#>   Dataset's Label : Edgar Anderson's Iris Data
#>       Vars : 5
#>        Obs : 150
#>  + -- ------------ + --------------- ------- --- -- ----- +
#>  | No     Variable |           Label    Type Obs NA NA(%) |
#>  + -- ------------ + --------------- ------- --- -- ----- +
#>  |  1 Sepal.Length | Length of Sepal numeric 150  0   0.0 |
#>  |  2  Sepal.Width |                 numeric 150  0   0.0 |
#>  |  3 Petal.Length | Length of Petal numeric 150  0   0.0 |
#>  |  4  Petal.Width |                 numeric 150  0   0.0 |
#>  |  5      Species | Type of species  factor 150  0   0.0 |
#>  + -- ------------ + --------------- ------- --- -- ----- +
```


## Getting help

------------------------------------------------------------------------

If you encounter a clear bug, please file an issue with a minimal
reproducible example on
[GitHub](https://github.com/myominnoo/mStats/issues). For questions and
other discussion, please directly email me
[dr.myominnoo@gmail.com](mailto::dr.myominnoo@gmail.com) or use the
[mStats mailing list](https://groups.google.com/g/mstats).

------------------------------------------------------------------------

Please note that this project is looking for contributors. By
participating in this project, you agree to abide by its terms with
[Contributor Code of
Conduct](https://www.contributor-covenant.org/version/1/0/0/code-of-conduct/),
version 1.0.0, available at
<https://www.contributor-covenant.org/version/1/0/0/code-of-conduct/>.
