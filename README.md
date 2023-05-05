# Waermeplanung_Datenaufbereitung
Python Tool zur systematischen Aufbereitung von Daten für Wärmeplanungen (Deutschland, NRW) 

# Aufbau des Tools
In der main.py befindet sich der eigentliche Programmcode. 
In /methods/function_list.py finden sich definierte Klassen und Funktionen. 

## Gliederung der main.py
- Kommentarblock zur Beschreibung
- LIBRARIY imports (inklusive /methods/function_list.py)
- SETTINGS
- - global settings (to be set by user)
- - - use_<dataset> = 1|0 -> to set which datasets to use
- - - write_<...> = 1|0   -> to set which output format files should have
- - - perform_pre_analysis_<something> = 1|0  -> to set if pre-analysis files with statistics should be created as .csv files
- - - some dataset specific variables (to be set by user)
- - filepaths and urls (partly to be set by user) (s. comments)
- MAIN 
- - PRE-PROCESSING: PART ONE (for single datasets)
- - POST-PROCESSING: PART TWO (for synthesis datasets)
