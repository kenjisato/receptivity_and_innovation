# data manipulation ----

recategorize = function(.data, column, thresholds, 
                        labels, new_col_name, default = "Others") {
  #
  # Example:
  #
  # thresholds = c(1, 2, 6)
  # => column is recategorized into three groups:
  #    labels[1]: 1 <= col < 2
  #    labels[2]: 2 <= col < 6
  #    labels[3]: col >= 6
  #    labels[4]: otherwise
  #
  mutate_call = lazyeval::interp(~ ifelse(v >= thresholds[1] & v < thresholds[2], 
                                          labels[1], 
                                          ifelse(v >= thresholds[2] & v < thresholds[3], 
                                                 labels[2],
                                                 ifelse(v >= thresholds[3], 
                                                        labels[3], default))), 
                                 v = as.name(column))
  
  .data %>% mutate_(.dots = setNames(list(mutate_call), new_col_name))
}


wvs_gii_reshape = function(.data) {
  .data %>% 
    select(-Value, -Item) %>% 
    group_by(Country, Level) %>%
    summarize(Count = sum(Count)) %>%
    mutate(n = sum(Count)) %>%
    mutate(Freq = Count / n) %>%
    select(-n, -Count) %>%
    spread(Level, Freq) %>%
    right_join(gii, by=c("Country" = "code")) %>%
    select(Country, High, Low, Moderate, Score)
}

wvs_patent_reshape = function(.data) {
  .data %>% 
    select(-Value, -Item) %>% 
    group_by(Country, Level) %>%
    summarize(Count = sum(Count)) %>%
    mutate(n = sum(Count)) %>%
    mutate(Freq = Count / n) %>%
    select(-n, -Count) %>%
    spread(Level, Freq) %>%
    right_join(patent, by=c("Country" = "code")) %>%
    mutate(patent_count = ifelse(!is.na(`2015`), `2015`, 
                           ifelse(!is.na(`2014`), `2014`, 
                                  `2013`))) %>% # find newest
    select(Country, High, Low, Moderate, patent_count)
}


# Plotting ----

save_plot = function(data, xvars, yvar, xtempl, ylabel, 
                     ftempl, placeholder, file_type = "pdf") {
  for (xvar in xvars) {
    p  = ggplot(data, aes_string(x = xvar, y = yvar)) + 
      geom_point(size = 3) + geom_smooth(method = "lm") + 
      labs(x = sub(placeholder, xvar, xtempl), y = ylabel) + 
      theme(text = element_text(family="Times", size=20))
    
    file_name = paste(sub(placeholder, xvar, ftempl), file_type, sep = '.')
    if (file_type == "pdf") {
      ggsave(file_name, p)
    } else {
      print(p)
    }
  }
}

# Delete Output Files

prune_output = function(){
  output_dir = 'output'
  output_files = list.files(output_dir)
  
  print("Deleted files: ")
  for (filename in output_files) {
    print(file.path(output_dir, filename))
    unlink(file.path(output_dir, filename))
  }
}
