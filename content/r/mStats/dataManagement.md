---
date: "2021-06-13"
highlight: true
title: Data Management - Basic
type: book
weight: 50
---


------------------------------------------------------------------------

This chapter covers methods in R to prepare data for further analysis.
At the end of this chapter, we will get a tidy data on which we can run
further analyses. So what is a tidy data?

    Tidy data is a standard way of mapping the meaning of a dataset to its structure. A dataset is messy or tidy depending on how rows, columns, and tables are matched up with observations, variables, and types. In tidy data:

    1. Each variable forms a column.
    2. Each observation forms a row.
    3. Each type of observational unit forms a table.

    - Hadley Wickham, R for Data Science

If you are familiar with spreadsheet data, you already understand some
of the data concepts. Like any spreadsheets, R also handles such a
fairly similar data structure, which has rows and columns. Hence, they
are called two-dimensional data.

The first step in doing so is getting your data into R. So let’s get
started.

## Inputting data into R

------------------------------------------------------------------------

Here are commonly used data formats in medical research:

1.  Comma-separated value `CSV`
2.  Excel’s `xls` or `xlsx`
3.  STATA’s `dta`

### `CSV`

------------------------------------------------------------------------

Base R has a built-in function to import `CSV` file. You can read the
help page by running this command `?write.csv`. To run a function, you
just put the link with quotes into the brackets of the function
`write.csv`.

    ## Here is original post from UCLA
    ## https://stats.idre.ucla.edu/r/faq/how-to-input-data-into-r/
    df.csv <- read.csv("https://stats.idre.ucla.edu/wp-content/uploads/2016/02/test-1.csv")

    ## check the dataset (show the first 10 rows)
    head(df.csv)
    #>    make   model mpg weight price
    #> 1   amc concord  22   2930  4099
    #> 2   amc   oacer  17   3350  4749
    #> 3   amc  spirit  22   2640  3799
    #> 4 buick century  20   3250  4816
    #> 5 buick electra  15   4080  7827

We imported the dataset from the internet and printed the first 10 lines
using `head`. As you can see we have five columns: `make`, `model`,
`mpg`, `weight`, `price`. You can print out the last 10 rows using
`tail` function.

The comma in `CSV` is called delimiter because it separates the values
into respective columns. So you can call it as the separator. Other
common delimiters are space and semi-colon. Here are their examples.

    ## Here is original post from UCLA
    ## https://stats.idre.ucla.edu/r/faq/how-to-input-data-into-r/
    ## We add 'header = TRUE' to indicate the first row as names of columns: 
    ## You can call this header or names of variables.
    df.space <- read.table("https://stats.idre.ucla.edu/wp-content/uploads/2016/02/test.txt", header = TRUE)

    ## Check the dataset (show the first 10 rows)
    head(df.space)
    #>    make   model mpg weight price
    #> 1   AMC Concord  22   2930  4099
    #> 2   AMC   Pacer  17   3350  4749
    #> 3   AMC  Spirit  22   2640  3799
    #> 4 Buick Century  20   3250  4816
    #> 5 Buick Electra  15   4080  7827

    ## Here is original post from UCLA
    ## https://stats.idre.ucla.edu/r/faq/how-to-input-data-into-r/
    ## To indicate semi-colon, we add another input 'sep = ";"'
    df.semi <- read.table("https://stats.idre.ucla.edu/wp-content/uploads/2016/02/testsemicolon.txt", 
                           header = TRUE, sep = ";")

    ## Check the dataset (show the first 10 rows)
    head(df.semi)
    #>    make   model mpg weight price
    #> 1   AMC Concord  22   2930  4099
    #> 2   AMC   Pacer  17   3350  4749
    #> 3   AMC  Spirit  22   2640  3799
    #> 4 Buick Century  20   3250  4816
    #> 5 Buick Electra  15   4080  7827

### `xls` or `xlsx`

------------------------------------------------------------------------

To read Excel files, we install another package `readxl`.

    install.packages("readxl")

Let us use an excel dataset from World Bank (accessed on August 31,
2020). Download it
[here](https://myominnoo.github.io/mStats/data/world_bank_life_exp.xls).

    library(readxl)
    df.xls <- read_excel("./data/world_bank_life_exp.xls")
    head(df.xls)
    #> # A tibble: 6 x 64
    #>   `Country Name` `Country Code` `Indicator Name`  `Indicator Code` `1960` `1961`
    #>   <chr>          <chr>          <chr>             <chr>             <dbl>  <dbl>
    #> 1 Aruba          ABW            Life expectancy ~ SP.DYN.LE00.IN     65.7   66.1
    #> 2 Afghanistan    AFG            Life expectancy ~ SP.DYN.LE00.IN     32.4   33.0
    #> 3 Angola         AGO            Life expectancy ~ SP.DYN.LE00.IN     37.5   37.8
    #> 4 Albania        ALB            Life expectancy ~ SP.DYN.LE00.IN     62.3   63.3
    #> 5 Andorra        AND            Life expectancy ~ SP.DYN.LE00.IN     NA     NA  
    #> # ... with 1 more row, and 58 more variables: 1962 <dbl>, 1963 <dbl>,
    #> #   1964 <dbl>, 1965 <dbl>, 1966 <dbl>, 1967 <dbl>, 1968 <dbl>, 1969 <dbl>,
    #> #   1970 <dbl>, 1971 <dbl>, 1972 <dbl>, 1973 <dbl>, 1974 <dbl>, 1975 <dbl>,
    #> #   1976 <dbl>, 1977 <dbl>, 1978 <dbl>, 1979 <dbl>, 1980 <dbl>, 1981 <dbl>,
    #> #   1982 <dbl>, 1983 <dbl>, 1984 <dbl>, 1985 <dbl>, 1986 <dbl>, 1987 <dbl>,
    #> #   1988 <dbl>, 1989 <dbl>, 1990 <dbl>, 1991 <dbl>, 1992 <dbl>, 1993 <dbl>,
    #> #   1994 <dbl>, 1995 <dbl>, 1996 <dbl>, 1997 <dbl>, 1998 <dbl>, 1999 <dbl>,
    #> #   2000 <dbl>, 2001 <dbl>, 2002 <dbl>, 2003 <dbl>, 2004 <dbl>, 2005 <dbl>,
    #> #   2006 <dbl>, 2007 <dbl>, 2008 <dbl>, 2009 <dbl>, 2010 <dbl>, 2011 <dbl>,
    #> #   2012 <dbl>, 2013 <dbl>, 2014 <dbl>, 2015 <dbl>, 2016 <dbl>, 2017 <dbl>,
    #> #   2018 <dbl>, 2019 <lgl>

Note that you can specify this file location on your computer. You may
also notice that the output from `head` function is a bit different this
time. But don’t be afraid. It’s nothing wrong but shows a variant of the
dataset in R.

    Alternatively, you can create a folder named `data` in the same directory where your R script file is stored. For this to work, first close `RStudio` if it is opened. Double-click on the R Script to open it in RStudio. You will notice that the directory changes where your R script is stored.

If you download it from World Bank web API, you will notice that the
first two rows describe data sources and indicators. This time, we will
import the raw file with two invalid rows. Download the raw file
[here](https://myominnoo.github.io/mStats/data/world_bank_life_exp_raw.xls).
Check the file in a spreadsheet program like Excel before inputting it
into R.

In the example below, we will skip these two rows when we read the excel
file. We can set this by specifying `skip = 2`.

    df.xls <- read_excel("./data/world_bank_life_exp_raw.xls", skip = 2)
    head(df.xls)
    #> # A tibble: 6 x 64
    #>   `Country Name` `Country Code` `Indicator Name`  `Indicator Code` `1960` `1961`
    #>   <chr>          <chr>          <chr>             <chr>             <dbl>  <dbl>
    #> 1 Aruba          ABW            Life expectancy ~ SP.DYN.LE00.IN     65.7   66.1
    #> 2 Afghanistan    AFG            Life expectancy ~ SP.DYN.LE00.IN     32.4   33.0
    #> 3 Angola         AGO            Life expectancy ~ SP.DYN.LE00.IN     37.5   37.8
    #> 4 Albania        ALB            Life expectancy ~ SP.DYN.LE00.IN     62.3   63.3
    #> 5 Andorra        AND            Life expectancy ~ SP.DYN.LE00.IN     NA     NA  
    #> # ... with 1 more row, and 58 more variables: 1962 <dbl>, 1963 <dbl>,
    #> #   1964 <dbl>, 1965 <dbl>, 1966 <dbl>, 1967 <dbl>, 1968 <dbl>, 1969 <dbl>,
    #> #   1970 <dbl>, 1971 <dbl>, 1972 <dbl>, 1973 <dbl>, 1974 <dbl>, 1975 <dbl>,
    #> #   1976 <dbl>, 1977 <dbl>, 1978 <dbl>, 1979 <dbl>, 1980 <dbl>, 1981 <dbl>,
    #> #   1982 <dbl>, 1983 <dbl>, 1984 <dbl>, 1985 <dbl>, 1986 <dbl>, 1987 <dbl>,
    #> #   1988 <dbl>, 1989 <dbl>, 1990 <dbl>, 1991 <dbl>, 1992 <dbl>, 1993 <dbl>,
    #> #   1994 <dbl>, 1995 <dbl>, 1996 <dbl>, 1997 <dbl>, 1998 <dbl>, 1999 <dbl>,
    #> #   2000 <dbl>, 2001 <dbl>, 2002 <dbl>, 2003 <dbl>, 2004 <dbl>, 2005 <dbl>,
    #> #   2006 <dbl>, 2007 <dbl>, 2008 <dbl>, 2009 <dbl>, 2010 <dbl>, 2011 <dbl>,
    #> #   2012 <dbl>, 2013 <dbl>, 2014 <dbl>, 2015 <dbl>, 2016 <dbl>, 2017 <dbl>,
    #> #   2018 <dbl>, 2019 <lgl>

### `dta`

------------------------------------------------------------------------

Reading `.dta` is fairly easy. There are two great packages to read this
data format: `haven` and `foreign`. In this book, I will demonstrate it
using `haven`. Also, check the `foreign` package.

First, install the package. If you already installed `tidyverse`, you
don’t need to install it again.

    install.packages("haven")

The function we will use is `read_dta`. Here is an example.

    library(haven)
    df.dta <- read_dta("https://stats.idre.ucla.edu/stat/data/test.dta")
    head(df.dta)
    #> # A tibble: 5 x 5
    #>   make  model     mpg weight price
    #>   <chr> <chr>   <dbl>  <dbl> <dbl>
    #> 1 AMC   Concord    22   2930  4099
    #> 2 AMC   Pacer      17   3350  4749
    #> 3 AMC   Spirit     22   2640  3799
    #> 4 Buick Century    20   3250  4816
    #> 5 Buick Electra    15   4080  7827

Check the version of `STATA` used to export `.dta`. Sometimes, older
versions do not work well.

### Exercises

------------------------------------------------------------------------

Try importing the following dataset into R. First, use the link to input
from online. Then also download the dataset and import it from your
computer.

-   Downs Syndrome data from STATA:
    <http://www.stata-press.com/data/r16/downs.dta>

-   Diet data from STATA:
    <https://www.stata-press.com/data/r16/diet.dta>

-   Low Birth Weight data from STATA:
    <http://www.stata-press.com/data/r16/lbw.dta>

-   Try importing World Bank datasets in different format.
    <https://data.worldbank.org/>

## Viewing the dataset

------------------------------------------------------------------------

We load the first dataset used in this book[1].

    pt <- haven::read_dta("https://stats.idre.ucla.edu/stat/data/patient_pt1_stata_dm.dta")

### `View`

------------------------------------------------------------------------

The dataset can be viewed in a spreadsheet-style window by using `View`
function or clicking on the dataset in the `Environment` window. It is
always a good thing to eye-ball your data before you start anything.

    View(pt)

![Spreadsheet-style window in RStudio](./img/View_pt.png)

### `codebook`

------------------------------------------------------------------------

Before you do any type of analysis, you need to understand your data.
First, let us take a look at the codebook of `pt` dataset. The
`codebook` function provides the following list of information on the
dataset and variables.

1.  Number of variables (`No`)
2.  Name of variables (`Variable`)
3.  Their descriptions (`Label`)
4.  Data types (`Type`)
5.  Number of valid observations (`Obs_Num`)
6.  Number of missing observations (`<NA>`)
7.  Percentage of missing observations (`<NA>(%)`)
8.  Label of dataset

<!-- -->

    library(mStats)
    codebook(pt)
    #>        Codebook
    #>    Dataset's Name : `pt`
    #>   Dataset's Label : 
    #>       Vars : 25
    #>        Obs : 120
    #>  + -- ------------ + ------------ --------- --- -- ----- +
    #>  | No     Variable |        Label      Type Obs NA NA(%) |
    #>  + -- ------------ + ------------ --------- --- -- ----- +
    #>  |  1     hospital |              character 120  0   0.0 |
    #>  |  2       hospid |          HID   numeric 120  0   0.0 |
    #>  |  3        docid |              character 120  0   0.0 |
    #>  |  4     dis_date |                   Date 120  0   0.0 |
    #>  |  5    tumorsize |                numeric 120  0   0.0 |
    #>  |  6          co2 |                numeric 120  0   0.0 |
    #>  |  7         pain |                numeric 120  0   0.0 |
    #>  |  8        wound |                numeric 120  0   0.0 |
    #>  |  9     mobility |                numeric 120  0   0.0 |
    #>  | 10      ntumors |                numeric 120  0   0.0 |
    #>  | 11    nmorphine |                numeric 120  0   0.0 |
    #>  | 12    remission |                numeric 120  0   0.0 |
    #>  | 13 lungcapacity |                numeric 120  0   0.0 |
    #>  | 14          age |          Age   numeric 120  0   0.0 |
    #>  | 15      married |      Married   numeric 120  0   0.0 |
    #>  | 16     familyhx |     FamilyHx character 120  0   0.0 |
    #>  | 17    smokinghx |    SmokingHx character 120  0   0.0 |
    #>  | 18          sex |          Sex character 120  0   0.0 |
    #>  | 19  cancerstage |  CancerStage character 120  0   0.0 |
    #>  | 20 lengthofstay | LengthofStay   numeric 120  0   0.0 |
    #>  | 21          wbc |          WBC character 120  0   0.0 |
    #>  | 22          rbc |          RBC   numeric 120  0   0.0 |
    #>  | 23          bmi |          BMI   numeric 120  0   0.0 |
    #>  | 24        test1 |          IL6   numeric 120  0   0.0 |
    #>  | 25        test2 |          CRP   numeric 120  0   0.0 |
    #>  + -- ------------ + ------------ --------- --- -- ----- +

The `pt` dataset has 25 variables and 120 observations. But no missing
values are reported. Twelve variables do not have labels. The dataset
also does not have a label. There are three different data types
reported here: `character`, `numeric`, and `Date`. Right now, knowing
this much is still very helpful for further data management.

    Recall data types in statistics. 

    1. Characters are generally categorical variables and numbers often represent categorical data. For example, `sex` variable with `male` or `female` is of character type and that with 1 and 2 are of numeric type. 

    2. Dates can be treated as numbers, meaning that we can do arithmetic calculations on them.

## Labels

------------------------------------------------------------------------

Labels can be used to provide additional information about variables or
dataset to the users. Value labels are not important in R though it can
be done using certain packages such as `forcats`.

### labeling variables

------------------------------------------------------------------------

We often deal with variable names that do not make any sense at all. For
example, `test1` and `test2` have no meaning in `pt` dataset unless they
relate to `Interleukin-6` (`IL6`) and `C-Reactive Protein` (`CRP`)
respectively.

The `codebook` function shows labels up to 22 characters and truncates
the rest of the label. However, other functions can show the full length
of the labels. Labels also depend on the data storage format. While
`dta` file can store labels for both variables and the dataset, `CSV`
and `excel` files can’t be used to store such data.

The `labelVar` function needs at least two inputs: `dataset`, and
`variable name` = `label`. You can add as many variables as you want if
they are valid names.

Let’s label `test1` as `Interleukin-6` and `test2` as
`C-Reactive Protein`.

    ## label variables test1 and test2 
    pt <- label(pt, test1="Interleukin-6", test2="C-Reactive Protein")
    #>   (`test1` labeled as `Interleukin-6`)
    #>   (`test2` labeled as `C-Reactive Protein`)

    ## Check the changes
    codebook(pt)
    #>        Codebook
    #>    Dataset's Name : `pt`
    #>   Dataset's Label : 
    #>       Vars : 25
    #>        Obs : 120
    #>  + -- ------------ + ------------ --------- --- -- ----- +
    #>  | No     Variable |        Label      Type Obs NA NA(%) |
    #>  + -- ------------ + ------------ --------- --- -- ----- +
    #>  |  1     hospital |              character 120  0   0.0 |
    #>  |  2       hospid |          HID   numeric 120  0   0.0 |
    #>  |  3        docid |              character 120  0   0.0 |
    #>  |  4     dis_date |                   Date 120  0   0.0 |
    #>  |  5    tumorsize |                numeric 120  0   0.0 |
    #>  |  6          co2 |                numeric 120  0   0.0 |
    #>  |  7         pain |                numeric 120  0   0.0 |
    #>  |  8        wound |                numeric 120  0   0.0 |
    #>  |  9     mobility |                numeric 120  0   0.0 |
    #>  | 10      ntumors |                numeric 120  0   0.0 |
    #>  | 11    nmorphine |                numeric 120  0   0.0 |
    #>  | 12    remission |                numeric 120  0   0.0 |
    #>  | 13 lungcapacity |                numeric 120  0   0.0 |
    #>  | 14          age |          Age   numeric 120  0   0.0 |
    #>  | 15      married |      Married   numeric 120  0   0.0 |
    #>  | 16     familyhx |     FamilyHx character 120  0   0.0 |
    #>  | 17    smokinghx |    SmokingHx character 120  0   0.0 |
    #>  | 18          sex |          Sex character 120  0   0.0 |
    #>  | 19  cancerstage |  CancerStage character 120  0   0.0 |
    #>  | 20 lengthofstay | LengthofStay   numeric 120  0   0.0 |
    #>  | 21          wbc |          WBC character 120  0   0.0 |
    #>  | 22          rbc |          RBC   numeric 120  0   0.0 |
    #>  | 23          bmi |          BMI   numeric 120  0   0.0 |
    #>  | 24        test1 |          IL6   numeric 120  0   0.0 |
    #>  | 25        test2 |          CRP   numeric 120  0   0.0 |
    #>  + -- ------------ + ------------ --------- --- -- ----- +

### labeling dataset

------------------------------------------------------------------------

The `labelData` function is used to label the dataset. The `codebook`
prints the full length of this label. Since this is applied to the whole
dataset, the function needs a dataset and its label as inputs.

    ## Labelling pt dataset
    pt <- label(pt, "Fake Cancer Patient Data")
    #>   (`pt` labeled as `Fake Cancer Patient Data`)

    ## Check the change
    codebook(pt)
    #>        Codebook
    #>    Dataset's Name : `pt`
    #>   Dataset's Label : Fake Cancer Patient Data
    #>       Vars : 25
    #>        Obs : 120
    #>  + -- ------------ + ------------ --------- --- -- ----- +
    #>  | No     Variable |        Label      Type Obs NA NA(%) |
    #>  + -- ------------ + ------------ --------- --- -- ----- +
    #>  |  1     hospital |              character 120  0   0.0 |
    #>  |  2       hospid |          HID   numeric 120  0   0.0 |
    #>  |  3        docid |              character 120  0   0.0 |
    #>  |  4     dis_date |                   Date 120  0   0.0 |
    #>  |  5    tumorsize |                numeric 120  0   0.0 |
    #>  |  6          co2 |                numeric 120  0   0.0 |
    #>  |  7         pain |                numeric 120  0   0.0 |
    #>  |  8        wound |                numeric 120  0   0.0 |
    #>  |  9     mobility |                numeric 120  0   0.0 |
    #>  | 10      ntumors |                numeric 120  0   0.0 |
    #>  | 11    nmorphine |                numeric 120  0   0.0 |
    #>  | 12    remission |                numeric 120  0   0.0 |
    #>  | 13 lungcapacity |                numeric 120  0   0.0 |
    #>  | 14          age |          Age   numeric 120  0   0.0 |
    #>  | 15      married |      Married   numeric 120  0   0.0 |
    #>  | 16     familyhx |     FamilyHx character 120  0   0.0 |
    #>  | 17    smokinghx |    SmokingHx character 120  0   0.0 |
    #>  | 18          sex |          Sex character 120  0   0.0 |
    #>  | 19  cancerstage |  CancerStage character 120  0   0.0 |
    #>  | 20 lengthofstay | LengthofStay   numeric 120  0   0.0 |
    #>  | 21          wbc |          WBC character 120  0   0.0 |
    #>  | 22          rbc |          RBC   numeric 120  0   0.0 |
    #>  | 23          bmi |          BMI   numeric 120  0   0.0 |
    #>  | 24        test1 |          IL6   numeric 120  0   0.0 |
    #>  | 25        test2 |          CRP   numeric 120  0   0.0 |
    #>  + -- ------------ + ------------ --------- --- -- ----- +

[1] Starting from this point, the book loosely follows on the [STATA
tutorial from
UCLA](https://stats.idre.ucla.edu/stata/seminars/stata-data-management/).
