source('R/e046-init.R')

# Patent ----

thresholds1 = c(1, 3, 9)
xlabel = "Proportion of 'LEVEL'"
ylabel = "Patent applications by million residents"
fname_p = "output/e046_patent_LEVEL"

e046_patent = 
  wvs_count_e046 %>%
  recategorize("Value", thresholds1, labels, "Level") %>% 
  wvs_patent_reshape

save_plot(e046_patent, xvars = labels, yvar = "patent_count", 
          xlabel, ylabel, fname_p, placeholder = "LEVEL")
