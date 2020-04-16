# prepare AJB KITA data for monitoring covid19
#
# Authors: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 16.04.2020
###############################################################################

# read metadata
readMetadata <- function(file)
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
    
    meta_t <- map(intersect(df_spec$name, meta_raw$name), 
                  ~meta_raw %>% filter(.data$name %in% .x) %>% select(.data$v) %>% rename(!!.x := .data$v))
    
    meta <- reduce(meta_t, cbind)
    
    return(meta)
}

# main
meta <- readMetadata('README.md')
write(jsonlite::toJSON(meta, dataframe = 'columns'), file = file('./data/kita_meta.json', encoding = 'UTF-8'))
