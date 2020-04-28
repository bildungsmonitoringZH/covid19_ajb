---
pagetitle: Gesellschaftsmonitoring COVID19, Daten AJB
---

![](https://github.com/bildungsmonitoringZH/bildungsmonitoringZH.github.io/raw/master/assets/ktzh_bi_logo_de-300x88.jpg)

# Gesellschaftsmonitoring COVID19, Daten Amt für Jugend und Berufsberatung 

Daten des AJB (Amt für Jugend und Berufsberatung) im Rahmen des Projekts [Gesellschaftsmonitoring COVID19](https://statistikzh.github.io/covid19monitoring/)

## Datenlieferant

[source] Kanton Zürich, Amt für Jugend und Berufsberatung 

## Beteiligte

Roman Avogaro <roman.avogaro@ajb.zh.ch>, Bildungsdirektion, Amt für Jugend und Berufsberatung

Flavian Imlig <flavian.imlig@bi.zh.ch>, Bildungsdirektion, Bildungsplanung

## Indikatorenbeschreibung

Die Indikatoren beschreiben die 373 durch die Gemeinden des Kantons Zürich bewilligten Kindertagesstätten. Nicht erfasst sind Kindertagesstätten in der Stadt Zürich.

Als Datum ist jeweils der Montag einer Kalenderwoche angegeben. Die Indikatoren repräsentieren einen Durchschnittswert der entsprechenden Woche (Montag bis Freitag).

[topic] Bildung

[location] ZH

[update] wöchentlich

[public] Ja

[description] https://bildungsmonitoringzh.github.io/covid19_edu_ajb

### Betreute Kinder

Erfasst wird die durchschnittliche Anzahl betreuter Kinder in einer Kalenderwoche.

[variable_short] kitas_betreuung

[variable_long] Wochenmittelwert betreuter Kinder in Kindertagesstätten

[unit] Anzahl

### Auslastung

Die Auslastung beschreibt, wie viele der angemeldeten Kinder ihre Plätze in den Kindertagesstätten in Anspruch nehmen.

[variable_short] kitas_auslastung

[variable_long] Auslastung der Kindertagesstätten im Wochenmittelwert

[unit] Anteil

### Geschlossene Kindertagesstätten

Anzahl der aktuell aufgrund der Corona-Krise geschlossenen Kindertagesstätten.

[variable_short] kitas_geschlossen

[variable_long] Geschlossene Kindertagesstätten 

[unit] Anzahl

## Vorgehen

* Das AJB erhebt die Daten in der Regel wöchentlich telefonisch, oder durch die Kindertagesstätten erfolgte selbständige Meldung per Mail.
* Die Befragung findet jeweils an verschiedenen Wochentagen statt um die traditionell unterschiedliche Inanspruchnahme auszugleichen.
* Es wird abgefragt: Anzahl an diesem Tag der Befragung angemeldeten Kinder, Anzahl der tatsächlich anwesenden Kinder.
* Manuelles Update des Rohdatenfiles `data/kita.csv` durch das AJB, in der Regel einmal pro Woche.
* Datenstruktur für Covid19-Monitoring wird durch ein R-Skript generiert, automatisch ausgeführt bei jedem Update des Rohdatenfiles.

## Rücklauf

Woche | Rücklauf KITAs (Kanton, ohne Stadt Zürich)
----- | -----
KW 12 (16. - 20. März) | 99
KW 13 (23. - 27. März) | 314
KW 14 (30. März - 3. April) | NA (keine Datenerhebung)
KW 15 (6. - 10. April) | 339  
KW 16 (13. - 17. April) | NA (keine Datenerhebung)
KW 17 (20. - 24. April) | NA (keine Datenerhebung)
KW 18 (27. April - 1. Mai)| 

(aktualisiert 28.04.2020)
