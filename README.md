---
pagetitle: Gesellschaftsmonitoring COVID19, Daten AJB
---

![](https://github.com/bildungsmonitoringZH/bildungsmonitoringZH.github.io/raw/master/assets/ktzh_bi_logo_de-300x88.jpg)

# Gesellschaftsmonitoring COVID19, Daten Amt für Jugend und Berufsberatung 

Daten des AJB (Amt für Jugend und Berufsberatung) im Rahmen des Projekts [Gesellschaftsmonitoring COVID19](https://statistikzh.github.io/covid19monitoring/)

## Datenlieferant

Kanton Zürich, Amt für Jugend und Berufsberatung 

## Beteiligte

Roman Avogaro <roman.avogaro@ajb.zh.ch>, Bildungsdirektion, Amt für Jugend und Berufsberatung

Flavian Imlig <flavian.imlig@bi.zh.ch>, Bildungsdirektion, Bildungsplanung

## Indikatorenbeschreibung

Die Indikatoren beschreiben die 369 durch die Gemeinden des Kantons Zürich bewilligten Kindertagesstätten. Nicht erfasst sind Kindertagesstätten in der Stadt Zürich.

Die Erhebung findet rund einmal wöchentlich statt. Dabei wird der Wochentag bewusst variiert um der traditionell unterschiedlichen Nutzung der KITAs an den jeweiligen Wochentagen Rechung zu tragen.

### Betreute Kinder in Kindertagesstätten

Erfasst wird die Anzahl betreuter Kinder am Stichtag.

[variable_short] kitas_betreuung

[unit] Anzahl

### Auslastung der Kindertagesstätten

Die Auslastung beschreibt, wie viele der am Stichtag angemeldeten Kinder ihre Plätze in den Kindertagesstätten in Anspruch nehmen.

[variable_short] kitas_auslastung

[unit] Anteil

### Vorübergehend geschlossene Kindertagesstätten

Anzahl der am Stichtag aufgrund der Corona-Krise vorübergehend geschlossenen Kindertagesstätten. Mögliche Gründe für die Schliessung: Einbruch der Nachfrage, Personalmangel aufgrund covid-19-erkrankter Mitarbeitender.  

[variable_short] kitas_geschlossen

[unit] Anzahl

## Vorgehen

* Das AJB erhebt die Daten in der Regel wöchentlich telefonisch oder per E-Mail (selbständige Meldung durch die Kindertagesstätten).
* Die Befragung findet jeweils an verschiedenen Wochentagen statt um die traditionell unterschiedliche Inanspruchnahme auszugleichen.
* Es wird abgefragt: Anzahl der am Stichtag angemeldeten Kinder, Anzahl der tatsächlich anwesenden Kinder.
* Manuelles Update des Rohdatenfiles `data/kita.csv` durch das AJB, in der Regel einmal pro Woche.
* Datenstruktur für Covid19-Monitoring wird durch ein R-Skript generiert, automatisch ausgeführt bei jedem Update des Rohdatenfiles.

## Rücklauf

Stichtag | Rücklauf KITAs (Kanton, ohne Stadt Zürich)
----- | -----
2020-03-23 | 311
2020-03-26 | 314
KW 14 | keine Erhebung
2020-04-07 | 339
KW 16 & 17 | keine Erhebung (Ostern)
2020-04-28 | 313
2020-05-14 | 333

(aktualisiert 15.05.2020)
