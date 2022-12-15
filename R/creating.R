library(usethis)
library(devtools)
use_git()
use_github("RamiHawila/myNBApkg")


check()
use_mit_license("Rami Hawila")
check()
use_r("functions")
load_all()
