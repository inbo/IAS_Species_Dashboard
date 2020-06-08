library(rmarkdown)

output_dir <- "./output"
output_file <- "IAS_Species_Dashboard"

library(rsconnect)
rsconnect::deployApp("./R-scripts/all_species_dashboard.Rmd", appFiles = "./data/", upload = TRUE, forceUpdate = TRUE)

