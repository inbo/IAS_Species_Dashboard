library(tidyverse)
library(here)

##
#ADD markdown render stap 5 pipeline
##

spec_ind <- read_delim("https://raw.githubusercontent.com/inbo/IAS_Species_Dashboard/master/Data/Lists/nameserver_species_identifiers_for_t0.csv", 
                       ";", escape_double = FALSE, col_types = cols(t0_from = col_date(format = "%d/%m/%Y"), 
                                                                    t0_to = col_date(format = "%d/%m/%Y"), 
                                                                    t1_from = col_date(format = "%d/%m/%Y"), 
                                                                    t1_to = col_date(format = "%d/%m/%Y")), 
                       trim_ws = TRUE, locale = locale("en"))

species_choices <- spec_ind %>% 
  filter(!is.na(Batch)) %>% 
  mutate(Species = case_when(grepl("Salvinia", gbifapi_acceptedScientificName) ~ "Salvinia auriculata Aubl.",
                             TRUE ~ gbifapi_acceptedScientificName)) %>% 
  distinct(Species, gbifapi_acceptedKey) 

df_ts <- read_tsv(here("data",
                       "input",
                       "df_timeseries.tsv"),
                  locale = locale("en"))

df_ts_sub <- df_ts %>% 
  filter(taxonKey %in% species_choices$gbifapi_acceptedKey)

write_tsv(df_ts_sub, here("data",
                          "input",
               "df_timeseries_redux.tsv"))
