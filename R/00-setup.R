# libary ----
library(tidyverse)

# WVS Data File ----
# 
# Subset of variables are contained in data/wvs_longitudinal.rds
# for replication. If you want to use the raw data, set
# .restore_saved = FALSE
.restore_saved = TRUE

# Please download the file from http://www.worldvaluessurvey.org/WVSDocumentationWVL.jsp
# which is not included in the repository due to the condition of use.
# Set the following variables accordingly.
.wvs_zip = './extdata/F00003724-WVS_Longitudinal_1981-2014_stata_dta_v_2015_04_18.zip'
.wvs_filename = 'WVS_Longitudinal_1981_2014_stata_v2015_04_18.dta' 

# Imported variables 
# 
# Not all variables in WVS will be used for this analysis
#
.wvs_variables = c("S002", "S003", "S020", "S017", "A189", "A195", 
                   "E046","E047", "X001", "X003", "X025", "X047")
.wvs_labels = c("Wave", "Country", "Year", "Weight", "A189", "A195", 
                "E046","E047", "Sex", "Age", "Edu", "Income")

# Country Code 
# 
# Country codes for WVS are retrieved from the codebook 
# http://www.worldvaluessurvey.org/WVSDocumentationWVL.jsp
# and saved as a CSV file
.countrycode_file = './data/countrycode.csv'


# Patent ----
.patent_file = './data/patent_10.csv'

# GII ----
.gii_file = './data/Analysis_2016dic03111916.csv'


# Translation ----
#
# The same country has slightly different country names in different datasets.
# This small data translate these difference for joining purpose.
.economytranslation_file = "./data/economy_translation.csv"

