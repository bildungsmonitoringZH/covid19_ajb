# prepare AJB KITA data for monitoring covid19
#
# Authors: Flavian Imlig <flavian.imlig@bi.zh.ch>
# Date: 6.04.2020
###############################################################################

initData <- function()
{
    idata <- tibble('date' := '2020-03-27',
           'kw' := 13,
           'betreuung_kitas' := 2103,
           'auslastung_kitas' := 30,
           'geschlossene_kitas' := 10,
           'comment' = 'init')
    
    write.csv(idata, file = 'data/kita.csv', fileEncoding = 'UTF-8', row.names = F)
}