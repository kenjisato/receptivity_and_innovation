source('R/00-setup.R')
source('R/01-import.R')
source('R/02-process.R')
source('R/03-helper.R')

wvs_count_e046 = wvs_count %>% filter(Item == "E046")
labels = c("Low", "Moderate", "High")