library(rmarkdown)

rmarkdown::shiny_prerendered_clean

library(rsconnect)
rsconnect::deployApp("./R-scripts/all_species_dashboard.Rmd", appFiles = "./data/", upload = TRUE, forceUpdate = TRUE)

# output_dir <- "./output"
# output_file <- "IAS_Species_Dashboard"
# 
# render("./R-scripts/all_species_dashboard.Rmd", output_dir = output_dir, output_file = output_file, knit_root_dir = getwd(), runtime = "shiny")
