source('R/a189-init.R')

# GII: Specification 1 ----

thresholds1 = c(1, 2, 6)
xlabel = "Proportion of LEVEL"
ylabel = "GII score"
fname1 = "output/a189_spec1_LEVEL"

a189_spec1 = wvs_count_a189 %>%
  recategorize("Value", thresholds1, labels, "Level") %>% 
  wvs_gii_reshape 

save_plot(a189_spec1, xvars = labels, yvar = "Score", 
          xlabel, ylabel, fname1, placeholder = "LEVEL")
