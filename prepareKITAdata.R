# prepare AJB KITA data for monitoring covid19
#
# Authors: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 28.04.2020
###############################################################################

library(tidyr)
library(dplyr)
library(jsonlite)
library(assertthat)

# load metadata function
getMetadata <- function(file)
{
    if( missing(file) ) file <- 'data/kita_meta.json'
    assert_that(is.string(file))
    assert_that(file.exists(file))
    
    meta_raw <- read_json(file, simplifyVector = F)
    meta_t <- lapply(meta_raw, as.character)
    meta <- as.data.frame(meta_t, stringsAsFactors = F)
    return(meta)
}

# load raw data
getRawData <- function(file)
{
    if( missing(file) ) file <- './data/kita.csv'
    assert_that(is.string(file))
    assert_that(file.exists(file))

    data_raw <- read.csv(file, as.is = T)
    
    data <- data_raw %>% 
        mutate_at('kitas_auslastung', ~.x / 100) %>%
        select(.data$date, matches('^kitas')) %>% 
                   gather('variable_short', 'value', -.data$date)
}

# combine data and metadata
getData <- function()
{
    data_raw <- getRawData()
    meta <- getMetadata()
    
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))
    
    data <- data_raw %>% left_join(meta, by = 'variable_short') %>%
        mutate_at('date', ~as.POSIXct(as.character(.x))) %>%
        select(df_spec$name) %>%
        filter(!is.na(.data$topic))
}

# test result function
testTable <- function(df)
{
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))
    
    assert_that(is(df, 'data.frame'))
    assert_that(identical(names(df), df_spec$name))
    
    purrr::pwalk(as.list(df_spec), ~assert_that(is(get(.x, df), .y)))
    
    v <- df %>% filter(.data$unit %in% 'Anteil') %>% pull(.data$value) %>% na.omit()
    assert_that(all(v <= 1))
    
    return(invisible(NULL))
}

# main
dat_prep <- getData()
test <- testTable(dat_prep)
write.table(dat_prep, "./Bildung_Kita.csv", sep=",", fileEncoding="UTF-8", row.names = F)
