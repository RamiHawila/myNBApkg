## code to prepare `DATASET` dataset goes here


load("../NBA2022-2023.Rdata")
DATASET = df
usethis::use_data(DATASET, overwrite = TRUE)
