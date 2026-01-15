# 1. SETUP LIBRARIES AND ODBC FOR DATABASE CONNECTION ----

library(DBI)
library(RPostgres)

con <- dbConnect(odbc::odbc(),
                 driver   = "PostgreSQL Unicode(x64)",
                 server   = "localhost",
                 database = "postgres",
                 uid      = "postgres",
                 pwd      = "deepesT1!",
                 port     = 5432
)

# 2. CENSUS API AND DATA PULL ----

library(tidycensus)

counties <- c("Duval", "Clay", "Nassau", "St. Johns")

rent_to_income_raw <- get_acs(
  geography = "county",
  variables = c(
    median_income = "B19013_001",
    median_rent   = "B25064_001"
  ),
  state = "FL",
  county = counties,
  year = 2023
)

