library(usethis)
library(devtools)
library(roxygen2)
library(testthat)

use_git()
use_github("RamiHawila/myNBApkg")


check()
use_mit_license("Rami Hawila")
check()
use_r("functions")
load_all()
