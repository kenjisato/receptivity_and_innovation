source('R/a189-init.R')

# GII: Specification 3 ----

thresholds1 = c(1, 2, 6)
xlabel = "Proportion of 'LEVEL'"
ylabel = "GII score"
fname3 = "output/a189_spec3_LEVEL"

a189_spec3 =
  wvs_count_a189 %>%
  filter(Value > 0) %>%
  recategorize("Value", thresholds1, labels, "Level") %>% 
  wvs_gii_reshape

save_plot(a189_spec3, xvars = labels, yvar = "Score", 
          xlabel, ylabel, fname3, placeholder = "LEVEL")
