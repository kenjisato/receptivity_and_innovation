# WVS    ----
if (.restore_saved) {
  wvs = readRDS('./data/wvs_longitudinal.rds')
} else {
  temp = tempdir()
  
  .wvs_file = paste(temp, .wvs_filename, sep = '/')
  on.exit(unlink(.wvs_file))
  
  unzip(.wvs_zip, exdir = temp)
  wvs_full = haven::read_stata(.wvs_file) 
  wvs_wide = wvs_full[, .wvs_variables]
  names(wvs_wide) <- .wvs_labels
  
  wvs <- 
    wvs_wide %>% 
    mutate(id=rownames(wvs_wide)) %>% 
    gather(Item, Value, -id, -Year, -Country, -Wave)
  
  rm(temp)
  rm(wvs_full)
  rm(wvs_wide)
}
# saveRDS(wvs, "./data/wvs_longitudinal.rds")

# GII ----
gii0 = read_csv(.gii_file)

# Patent ----
patent0 = readr::read_csv(.patent_file)

# Country Code ----
countrycode = read_csv(.countrycode_file)
