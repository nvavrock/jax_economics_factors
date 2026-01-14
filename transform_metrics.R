# Aggregate county-level rent burden to metro level
# Weighted by number of households to avoid distortion
# from smaller, higher-income counties (e.g., St. Johns)

weighted_rent_income_ratio <- sum(
  rent_income_ratio * households,
  na.rm = TRUE
) / sum(households, na.rm = TRUE)
