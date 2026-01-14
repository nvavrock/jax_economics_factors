library(tidycensus)

counties <- c("Duval", "Clay", "Nassau", "St. Johns")

acs_data <- get_acs(
  geography = "county",
  variables = c(
    median_income = "B19013_001",
    median_rent   = "B25064_001"
  ),
  state = "FL",
  county = counties,
  year = 2023
)
