source('R/00-setup.R')
source('R/01-import.R')
source('R/02-process.R')
source('R/03-helper.R')

wvs_count_a189 = wvs_count %>% filter(Item == "A189")
labels = c("High", "Moderate", "Low")