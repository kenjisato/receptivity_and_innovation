source('R/a189-patent.R')

# Log Patent with Spec 2 ----

thresholds2 = c(1, 3, 5)
xlabel = "Proportion of 'LEVEL'"
ylabel = "Patent applications by million residents (log)"
fname_lp2 = "output/a189_logpatent2_LEVEL"

a189_patent2 = 
  wvs_count_a189 %>%
  recategorize("Value", thresholds2, labels, "Level") %>% 
  wvs_patent_reshape

save_plot(a189_patent2, xvars = labels, yvar = "log(patent_count)", 
          xlabel, ylabel, fname_lp2, placeholder = "LEVEL")