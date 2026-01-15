# --- 01_ingest_census_data.R ---

library(DBI)
library(tidycensus)
library(tidyverse)

# Use Sys.getenv to grab the password securely
con <- dbConnect(odbc::odbc(),
                 driver   = "PostgreSQL Unicode(x64)",
                 server   = "localhost",
                 database = "postgres",
                 uid      = "postgres",
                 pwd      = Sys.getenv("DB_PWD"), 
                 port     = 5432
)

# Pull ACS data for Jacksonville area
jax_raw <- get_acs(
  geography = "county",
  variables = c(med_income = "B19013_001", med_rent = "B25064_001"),
  state     = "FL",
  county    = c("Duval", "Clay", "Nassau", "St. Johns"),
  year      = 2022
)

# Clean, format, and add a note about granularity
# NOTE: Using County-level for MVP. Consider Census Tract for higher granularity v2.
formatted_data <- jax_raw %>%
  mutate(
    date = as.Date("2022-01-01"),
    region = str_remove(NAME, ", Florida")
  ) %>%
  select(variable, value = estimate, region, date)

# Write to Database
dbWriteTable(con, "econ_raw", formatted_data, append = TRUE)
