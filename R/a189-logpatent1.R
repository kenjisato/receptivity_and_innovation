source('R/a189-patent.R')

# Log Patent ----

xlabel = "Proportion of 'LEVEL'"
ylabel = "Patent applications by million residents (log)"
fname_lp = "output/a189_logpatent_LEVEL"

save_plot(a189_patent, xvars = labels, yvar = "log(patent_count)", 
          xlabel, ylabel, fname_lp, placeholder = "LEVEL")
