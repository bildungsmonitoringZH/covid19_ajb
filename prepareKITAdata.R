# prepare AJB KITA data for monitoring covid19
#
# Authors: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 9.04.2020
###############################################################################

initData <- function()
{
    .Deprecated(new = 'no replacement')
    idata <- tibble('date' := '2020-03-27',
           'kw' := 13,
           'betreuung_kitas' := 2103,
           'auslastung_kitas' := 30,
           'geschlossene_kitas' := 10,
           'comment' = 'init')
    
    write.csv(idata, file = 'data/kita.csv', fileEncoding = 'UTF-8', row.names = F)
}

# load metadata function
getMetadata <- function(file)
{
    if( missing(file) ) file <- 'README.md'
    assert_that(is.string(file))
    assert_that(file.exists(file))
    
    meta_raw <- read.table(file, header = FALSE, sep = '|', as.is = TRUE, fileEncoding = 'UTF-8')
    meta_pattern <- stri_conv('^\\[(\\w+)] ([\\w \u00E4\u00F6\u00FC\\-\\:\\.\\/\\?\\=\\,]+)', to = 'UTF-8')
    meta_match <- str_match(meta_raw$V1, regex(meta_pattern, ignore_case = TRUE))
    
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))
    
    meta_raw <- meta_match %>% as.data.frame(stringsAsFactors = FALSE) %>%
        select('name' := 2, 'v' := 3) %>%
        filter(.data$name %in% df_spec$name) %>%
        mutate_at('v', ~replace(.x, str_which(.x, 'undefiniert'), NA) %>% str_trim())
    
    meta_t <- purrr::map(intersect(df_spec$name, meta_raw$name), 
                   ~meta_raw %>% filter(.data$name %in% .x) %>% select(.data$v) %>% rename(!!.x := .data$v))
    
    meta <- purrr::reduce(meta_t, cbind)
}

# load raw data
getRawData <- function(file)
{
    if( missing(file) ) file <- './data/kita.csv'
    assert_that(is.string(file))
    assert_that(file.exists(file))

    data_raw <- read.csv(file)
    
    data <- data_raw %>% 
        select(.data$date, dplyr::matches('^kitas')) %>% 
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
        select(df_spec$name)
}

# test result function
testTable <- function(df)
{
    df_spec <- readRDS(url('https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps/raw/master/df_spec.rds'))
    
    assert_that(is(df, 'data.frame'))
    assert_that(identical(names(df), df_spec$name))
    
    purrr::pwalk(as.list(df_spec), ~assert_that(is(get(.x, df), .y)))
    
    return(invisible(NULL))
}

# main
dat_prep <- getData()
test <- testTable(dat_prep)
write.table(dat_prep, "./Bildung_Kita.csv", sep=",", fileEncoding="UTF-8", row.names = F)
