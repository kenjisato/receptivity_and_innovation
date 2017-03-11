source('R/e046-patent.R')

# Log Patent ----

xlabel = "Proportion of 'LEVEL'"
ylabel = "Patent applications by million residents (log)"
fname_lp = "output/e046_logpatent1_LEVEL"

save_plot(e046_patent, xvars = labels, yvar = "log(patent_count)", 
          xlabel, ylabel, fname_lp, placeholder = "LEVEL")
