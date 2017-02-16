source('R/a189-init.R')

# GII: Specification 2 ----

thresholds2 = c(1, 3, 5)
xlabel = "Proportion of 'LEVEL'"
ylabel = "GII score"
fname2 = "output/a189_spec2_LEVEL"

a189_spec2 = wvs_count_a189 %>%
  recategorize("Value", thresholds2, labels, "Level") %>% 
  wvs_gii_reshape

save_plot(a189_spec2, xvars = labels, yvar = "Score", 
          xlabel, ylabel, fname2, placeholder = "LEVEL")
