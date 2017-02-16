# GII ----
economy_translation <- read_csv("./data/economy_translation.csv")

gii <- 
  merge(x = gii0, y = countrycode, by = "Economy", all.x = TRUE) %>%
  left_join(select(economy_translation, GII, WVS), by = c("Economy" = "GII")) %>%
  left_join(countrycode, by = c("WVS" = "Economy")) %>%
  mutate(code = ifelse(is.na(code.x), code.y, code.x)) %>%
  select(-one_of(c("code.x", "code.y", "WVS"))) %>%
  mutate(code = replace(code, Economy == "Bosnia and Herzegovina", 70)) 


# Patent ----
patent <- 
  patent0 %>% 
  rename(Economy = Origin, alph_code = Code) %>% 
  merge(countrycode, by = "Economy", all.x = TRUE) %>%
  left_join(select(economy_translation, WVS, WIPO), by = c("Economy" = "WIPO")) %>%
  left_join(countrycode, by = c("WVS" = "Economy")) %>%
  mutate(code = ifelse(is.na(code.x), code.y, code.x)) %>% 
  select(-one_of(c("code.x", "code.y", "WVS"))) %>%
  mutate(code = replace(code, Economy == "Bosnia and Herzegovina", 70)) 

# filter(patent, is.na(code))


# WVS Count data ----
wvs_count =
  wvs %>%
  group_by(Wave, Year, Country, Item, Value) %>%
  tally %>%
  rename(Count = n) %>% 
  filter(Value != -4) %>%
  as.data.frame