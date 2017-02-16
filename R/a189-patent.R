source('R/a189-init.R')

# Patent ----

thresholds1 = c(1, 2, 6)
xlabel = "Proportion of 'LEVEL'"
ylabel = "Patent applications by million residents"
fname_p = "output/a189_patent_LEVEL"

a189_patent = 
  wvs_count_a189 %>%
  recategorize("Value", thresholds1, labels, "Level") %>% 
  wvs_patent_reshape

save_plot(a189_patent, xvars = labels, yvar = "patent_count", 
          xlabel, ylabel, fname_p, placeholder = "LEVEL")
