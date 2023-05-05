# Waermeplanung_Datenaufbereitung
Python Tool zur systematischen Aufbereitung von Daten für Wärmeplanungen (Deutschland, NRW) 

# Aufbau des Tools
- In der main.py befindet sich der eigentliche Programmcode. Hier werden auch alle Einstellungen vorgenommen.
- In /methods/function_list.py finden sich definierte Klassen und Funktionen. 

# Gliederung der main.py
- Kommentarblock zur Beschreibung
- LIBRARIY imports (inklusive /methods/function_list.py)
- SETTINGS
- - global settings (to be set by user)
- - - use_\<dataset\> = 1|0 -> to set which datasets to use
- - - write_\<dataset_fileformat\> = 1|0   -> to set which output format files should have
- - - perform_pre_analysis_\<something\> = 1|0  -> to set if pre-analysis files with statistics should be created as .csv files
- - - some dataset specific variables (to be set by user)
- - filepaths and urls (partly to be set by user) (s. comments)
- MAIN 
- - PRE-PROCESSING: PART ONE (for single datasets)
- - - \<dataset1\>
- - - \<dataset2\>
- - - ...
- - POST-PROCESSING: PART TWO (for synthesis datasets)
- - - \<synthesis_dataset1\>
- - - \<synthesis_dataset2\>
  
# Verwendung des Tools
0) Repo herunterladen (mindestens die main.py und /methods/function_list.py)
1) Auswahl zu nutzender Daten (Selection of data to be used)
- -\>in main.py unter SETTINGS, global settings, use_\<dataset\> = 1 setzen 
2) Weitere Einstellungen für die Datenaufbereitung vornehmen
- -\> in main.py unter SETTINGS, global settings, die anderen Variablen entsprechend setzen (Beschreibung in Kommentaren)
3) Dateipfaden setzen, wenn nötig
- -\> main.py unter SETTINGS, filepaths and urls, die entsprechenden Dateipfade setzen (Beschreibung in Kommentaren)
4) Rohdaten manuell herunterladen, wenn nötig
- -\> Links entweder in main.py unter SETTINGS, filepaths and urls in den Kommentaren
- -\> oder Links in main.py unter PRE-PROCESSING: PART ONE, <dataset> in den Kommentaren am Anfang
- -\> sonst in Thesis Text (andere Repository unter diesem Account) im Kapitel Datengrundlage, <dataset> [Quellenverweis]
5) Python-Script (main.py) ausführen (viel Infos im stdout)
6) Optional: Aufbereitete Daten seperat begutachten oder autogenerierte Analyse-Dateien begutachten
7) QGIS starten
8) in QGIS: Layer hinzufügen für gewünschten aufbereiteten Datensatz
- -\> Layer/Layer hinzufügen/Vector Layer mit Pfadangabe zu aufbereiteten Daten
9) Gegebenenfalls QGIS-Layerstildateien (.qml) manuell aus dem Repository herunterladen zur besseren Darstellung der Daten
- -\> unter /qml_styles/\<dataset\> in diesem Repository
10) in QGIS: Layerstil importieren
- -\> Doppelklick auf das Layer (oder Rechtsklick und Eigenschaften), Layer Symbolisierung, unten auf Stil klicken und .qml Datei laden
11) in QGIS: Gegebenfalls Layer kopieren, um gleiche Datenquelle als seperates Layer mit anderem Stil anzuzeigen
- -\> Rechtsklick auf das Layer, Layer duplizieren, umbenennen (z.B. in Anlehnung an die zu verwendende Stildatei)
- -\> Layerstil wie in 9) importieren

Note: Layerdefinitionsdateien (.qlr) funktionieren bei mir nicht in QGIS. Öffnen gibt eine Fehlermeldung aus.
(Layerstil inklusive Filepointer zum theoretisch direkt das Layer inkl. Daten in QGIS laden)
