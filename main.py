#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb 17 13:06:34 2023

@author: gustav
"""
# TODO move this comment to """ """ part above, add licence and description
# program structure
# -----------------
# import libraries
#
# SETTINGS
# set global variables (e.g. options, paths, urls)
#
# PART 1: PREPROCESSING
# for each dataset:
#   1. check directory structure
#   2. read in data (raw or preprocessed)
#   3. preprocess data if necessary
#   4. write data to file(s)
# for some datasets additionally:
#   (5. preanalysis of data)
#   (6. download styles and layer definitions for QGIS)
#
# PART 2: POSTPROCESSING
# combine some datasets (e.g. Zensus2011 Gebäude and Hausumringe ALKIS)

# list of most some included datasets:
# ------------------------------------
# 1. DVG: Digitale Verwaltungsgrenzen (DVG) data
# 2. ABK: Amtliche Basiskarte NRW data
# 3. OSM: OpenStreetMap data
# 4. Zensus: Zensus2011 data
# 5. Hausumringe: Hausumringe data
# 6. Energie-Erzeugungs Standorte Strom Wärme NRW, LANUV

###############################################################################
################################# IMPORTS #####################################
###############################################################################
# import libraries
# ----------------
import geopandas as gpd
import pandas as pd
from shapely.geometry import Point, Polygon
from shapely import wkt
import matplotlib.pyplot as plt
import os       # for os.path.abspath()
import sys      # for sys.path.append() and sys.exit()
import fiona    # for fiona.open() otherwise included in geopandas
import time     # to measure execution time
import wget     # to download files from web
import zipfile  # to unzip files
import subprocess # used to duplicate stdout into logfile (together with os and sys), not working yet

# import own library
# ------------------
sys.path.append(os.path.abspath(os.path.join('.','methods')))  # add methods dir in cd as absolute path to sys paths
from function_list import *                                    # import all definitions from function_list.py
#TODO split functions into multiple files (e.g. dir_methods.py + <dataset>.py for each dataset)
#TODO or like this (e.g. dir_methods.py, download.py, read.py, save.py, preprocess.py, postprocess.py, classes.py)

# optional imports
# ----------------
import warnings
# ignore warnings e.g. pandas.dataframe.append() deprecated
warnings.simplefilter(action='ignore', category=FutureWarning)  # ignore FutureWarning: pd.append() is deprecated, use pd.concat() instead during call of df.append() during call of zensus._create_empty_dataframe_with_new_columns()
warnings.simplefilter(action='ignore', category=UserWarning)    # ignore UserWaring: Column names longer than 10 characters will be truncated when saved to ESRI Shapefile. during call of gdf.to_file()

# in Jupyter Notebook
#%matplotlib inline

start_time_total = time.time()  # start timer for total execution time

###############################################################################
################################# SETTINGS ####################################
###############################################################################
# set global settings which datasets to use (also useable for navigating to code sections)
# 1 = use, 0 = don't use
use_gvisys = 0          # use GV-ISys' list of all politicaly independent municipalities, hardly used
use_dvg = 1             # use Digitale Verwaltungsgrenzen (DVG) data, used to crop all other raw datasets
use_abk_farbe = 0       # use Amtliche Basiskarte NRW data, farbig
use_abk_sw = 0          # use Amtliche Basiskarte NRW data, schwarz-weiß
use_rp = 0              # use Regionalpläne NRW data (for testing)
use_osm = 0             # use OpenStreetMap data
use_hu = 0              # use Hausumringe data (ALKIS) # needs 1 min to load already cropped data for 500.000 hu
use_rwb = 0             # use Raumwärmebedarfsmodelle LANUV
use_zensus_geb = 0      # use Zensus2011 data for Gebäude
use_zensus_wohn = 0     # use Zensus2011 data for Wohnungen
use_zensus_pop = 1      # use Zensus2011 data for Einwohner*innen-Zahlen je Gitterzelle
use_ee_nrw = 0          # use Energie-Erzeugung NRW (Standorte Strom, Wärme), needs use_gvisys = 1 at the moment
use_prot_nrw = 1        # use Schutzgebiete NRW data (e.g. FFH-Gebiete, Vogel-, Wasser-, Natur-, Landschaftsschutzgebiete)

use_subareas = 0        # use sub-areas e.g. Baubloecke in Wuppertal, demo

# set global settiongs which actions to perform
# 1 = perform, 0 = don't perform

# options: write preprocessed data to file
write_zensusdata_to_csv = 1             # write zensus data to csv
write_zensusdata_to_shp = 1             # write zensus data to shapefile (dbase good for quick off-python tableview)
write_zensusdata_to_gpkg = 1            # write zensus data to geopackage (better for QGIS)
# options: perform pre-analysis of data
perform_pre_analysis_zensus_data = 1    # perform pre-analysis of zensus data (doesn't take long)
perform_pre_analysis_hu_gfk = 1         # get statistics to number of hu per gfk code (doesn't take long)
perform_pre_analysis_hu_merk = 1        # get statistics to number of hu per gfk code per merkmal (1 min extra)
perform_pre_analysis_hu_merk_detailed = 0 # also get statitics to number of hu per gfk code per merkmalsauspraegung (11 min!)
perform_stdout_duplication = 0          # duplicate stdout to logfile (does not work yet), testing only


# Global variables
# ----------------
# DVG:
#gem_list_selected = ['05124000']                                                                                        # example, alternatively set with AGS (more robust)
gem_list_selected = ['Wuppertal','Solingen','Velbert']                                                                  # SET ME (this ones more readable though)

# Zensus:
# gridsize of zensus data, allowed values: '100m', '1km', '10km', '100km'
INSPIRE_size = '100m'                                                                                                   # SET ME, optionally
# threshold for quality of zensus data which should be used during remapping, allowed values: 0, 1, 2 (0 = best, 2 = worst)
zensus_q_threshold = 0
# filter list for merkmale which should be used for remapping
zensus_m_filter_geb = ['INSGESAMT','BAUJAHR_MZ','HEIZTYP']                                                              # SET ME
zensus_m_filter_wohn = ['INSGESAMT','BAUJAHR_MZ','HEIZTYP','NUTZUNG_DETAIL_HHGEN']                                      # SET ME    # last one only for wohnungsdata useable

# EE-NRW:
# filter lists for layers in geodatabase and sheets in excel file
eenrw_layer_whitelist = ['Standorte', 'Großspeicher', 'Grünstrom_Tankstellen', 'Elektro_Tankstellen_gesamt']            # SET ME
eenrw_layer_blacklist = ['NRW', 'RegBez', 'Planungsreg', 'PlanungsReg', 'Kreise','RheinRevier']  # redundant in this case # SET ME

# General:
kenn = '' # marker for output files, e.g. kenn = 'test_' will result in output files like 'test_<something>'            # SET ME
# TODO: implement variable kenn into all write functions and also into all read functions for not raw data
# TODO: also change directory structure, one dir for all input data, one dir for all output data, one dir for all analysis data

#-----------------------------------------------------------------------------#
#-------------------------- FILE PATHS - AND - URLs --------------------------#
#-----------------------------------------------------------------------------#
# set file paths to shape files or csv files for ...
# TODO: move fp with processed data to main routine, only leve settable fp here

# LOGGING
# -------
# directory for log files duplicated from stdout
# only relevant if perform_stdout_duplication = 1
fp_log_dir = '/media/gustav/Data/Sciebo/Thesis/thesisdata/log/'                                                         # SET ME, not used (stdout duplication not working yet)

# URLs for QGIS QML styles
# ------------------------
url_repo_qml_osm = 'https://raw.githubusercontent.com/Humanimaliberation/Waermeplanung_Datenaufbereitung/main/qml_styles/osm/'

# GV-ISys
# -------
# Alle politisch selbstständigen politischen Gemeinden in NRW (10.000+)
# Quelle: GV-ISys (BKG), Stand Jan. 2022
# Vorher bereits von xlsx nach csv konvertiert #todo implement type-check, opt. download, opt. conversion xlsx to csv, barely used
# only relevant if use_gvisys = 1
fp_csv_gem_list = '/media/gustav/Data/thesisdata/destatis_GV-ISys/Alle_politisch_selbstständigen_Gemeinden_31.12.2022/csv/Onlineprodukt_Gemeinden.csv'  # SET ME

# Digitale Verwaltungsgrenzen NRW
# -------------------------------
# (bld = Bundesland, rbz = Regierungsbezirke, krs = Kreise, gem = Gemeinden)
# only relevant if use_dvg = 1
fp_dvg_dir = '/media/gustav/Data/thesisdata/opengeodata.nrw/Digitale_Verwaltungsgrenzen_hohe_Stützpunktdichte/dvg1_EPSG25832_Shape/'                    # SET ME
fp_dvg_dir_out = '/media/gustav/Data/thesisdata/opengeodata.nrw/Digitale_Verwaltungsgrenzen_hohe_Stützpunktdichte_crop/'          # SET ME

# Amtliche Basisakrten NRW
# ------------------------
# only relevant if use_abk_farbe = 1 or use_abk_sw = 1
fp_abk_pardir = '/media/gustav/Data/Sciebo/Thesis/thesisdata/opengeodata.nrw/abk/'                                      # SET ME (will create subfolders farbe/ and/or sw/)
url_abk_pardir = 'https://www.opengeodata.nrw.de/produkte/geobasis/lk/akt/abk_tiff/'                                    # for downloading (contains subfolders abk_farbe_tiff and abk_sw_tiff)

# Regionalpläne NRW
# -----------------
# only relevant if use_rp = 1
fp_rp_dir = '/media/gustav/Data/Sciebo/Thesis/thesisdata/opengeodata.nrw/rp/'                                           # SET ME
url_rp_dir = 'https://www.opengeodata.nrw.de/produkte/infrastruktur_bauen_wohnen/regionalplan/rp_tiff/'

# OpenStreetMap NRW
# -----------------
# OSM extracts for Regierungsbezirk Düsseldorf from Geofabrik GmbH Karlsruhe, Germany
# Quelle: https://download.geofabrik.de/europe/germany/nordrhein-westfalen.html
# only relevant if use_osm = 1
# ATTENTION!: keep '/' or '\' at the end of folder paths depending on OS
fp_osm_dir_raw = "/media/gustav/Data/thesisdata/geofabrik/duesseldorf-regbez-latest-free.shp/"                          # SET ME .shp folder

# Hausumringe NRW
# ---------------
# (2 GB !!! 10 Mio. Umringe)
# only relevant if use_hu = 1
fp_hu_dir_raw = '/media/gustav/Data/thesisdata/opengeodata.nrw/hu_EPSG4647_Shape/'                                      # SET ME, put in here: hu_shp.shp
fp_hu_dir_out = '/media/gustav/Data/thesisdata/opengeodata.nrw/hu_EPSG4647_Shape_out/'                                  # SET ME for reading and writing
url_hu_gfk = 'https://repository.gdi-de.org/schemas/adv/citygml/Codelisten/BuildingFunctionTypeAdV.xml'                 # for downloading, not used anymore
url_hu_gfk_mod = 'https://raw.githubusercontent.com/Humanimaliberation/Waermeplanung_Datenaufbereitung/main/lut/BuildingFunctionTypeAdV_mod.csv'
fp_hu_age_analysis_csv = '/media/gustav/Data/thesisdata/opengeodata.nrw/hu_EPSG4647_Shape_out/hu_age_analysis_q'+str(zensus_q_threshold)+'.csv' # SET ME for writing

# Raumwärmebedarfsmodelle (RWB) LANUV
# -----------------------------------
# only relevant if use_rwb = 1
fp_rwb_dir = '/media/gustav/Data/thesisdata/opengeodata.nrw/Raumwärmebedarfsmodell_NRW/'                                # SET ME
url_rwb_dir = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/klima/raumwaermebedarfsmodell/'                     # for downloading folders for each AGS (Gemeinde) within spatial extent of gem_list_selected

# Zensus2011 Daten
# ----------------
# (Gebäude 2 GB , Wohnungen 4,3 GB)
# only relevant if use_zensus_geb = 1 or use_zensus_wohn = 1 or use_zensus_pop = 1
fp_zensus_csv_geb100m_raw = '/media/gustav/Data/thesisdata/zensus2011/raw/Geb100m.csv'                                  # SET ME
fp_zensus_csv_wohn100m_raw = '/media/gustav/Data/thesisdata/zensus2011/raw/Wohnungen100m.csv'                           # SET ME
fp_zensus_csv_pop100m_raw = '/media/gustav/Data/thesisdata/zensus2011/raw/Zensus_Bevoelkerung_100m-Gitter.csv'          # SET ME
fp_zensus_dir_out = '/media/gustav/Data/thesisdata/zensus2011/out/'                                                         # SET ME

# Energie-Erzeugung NRW
# ---------------------
# Standorte von Strom- und Wärmeerzeugungsanlagen in NRW
# only relevant if use_ee_nrw = 1
fp_eenrw_dir = '/media/gustav/Data/thesisdata/opengeodata.nrw/NRW_Standorte_Strom_Waerme/'                              # SET ME
fp_eenrw_gdb = os.path.join(fp_eenrw_dir,'FIS_Datenbank_Energie_OpenData_9.x.gdb/')
fp_eenrw_crop = os.path.join(fp_eenrw_dir,'FIS_Datenbank_Energie_OpenData_9.x_crop/')                                   # SET ME (optional will be created)
fp_eenrw_standorte_xlsx = os.path.join(fp_eenrw_dir,'Standorte_Strom_und_Waerme_StandEnde2021_v2.xlsx')
url_eenrw_gdb = ''
url_eenrw_standorte_xlsx_zip = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/klima/ee/standorte-strom-waerme/NW-Standorte-Strom-Waerme-NRW_EPSG25832_Excel.zip'

# Schutzgebiete NRW (LINFOS)
# --------------------------
# source: https://www.opengeodata.nrw.de/produkte/umwelt_klima/naturschutz/linfos/
# only relevant if use_prot_nrw = 1
fp_prot_nrw_raw_dir = '/media/gustav/Data/thesisdata/opengeodata.nrw/Schutzgebiete/'                                            # SET ME (parent folder)
fp_prot_nrw_crop_dir = '/media/gustav/Data/thesisdata/opengeodata.nrw/Schutzgebiete_crop/'                                  # SET ME (parent folder)
# LIST IST NOT COMPLETE, only included some of the most relevant ones
url_prot_linfos_dict = {} # dictionary for downloading, schutzgebiete collected in LINFOS NRW (Landschaftsinformationssammlung NRW)
url_prot_linfos_dict['FFH-Gebiete_EPSG25832_Shape.zip'] = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/naturschutz/linfos/FFH-Gebiete_EPSG25832_Shape.zip'
url_prot_linfos_dict['GebieteSchutzNatur_EPSG25832_Shape.zip'] = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/naturschutz/linfos/GebieteSchutzNatur_EPSG25832_Shape.zip'
url_prot_linfos_dict['Landschaftsschutzgebiete_EPSG25832_Shape.zip'] = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/naturschutz/linfos/Landschaftsschutzgebiete_EPSG25832_Shape.zip'
url_prot_linfos_dict['Nationalpark_EPSG25832_Shape.zip'] = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/naturschutz/linfos/Nationalpark_EPSG25832_Shape.zip'
url_prot_linfos_dict['Naturschutzgebiete_EPSG25832_Shape.zip'] = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/naturschutz/linfos/Naturschutzgebiete_EPSG25832_Shape.zip'
url_prot_linfos_dict['Naturparke_EPSG25832_Shape.zip'] = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/naturschutz/linfos/Naturparke_EPSG25832_Shape.zip'
url_prot_linfos_dict['RAMSAR_EPSG25832_Shape.zip'] = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/naturschutz/linfos/RAMSAR_EPSG25832_Shape.zip' # Ramsar-Gebiete, international bedeutende Feuchtgebiete
url_prot_linfos_dict['Vogelschutzgebiete_EPSG25832_Shape.zip'] = 'https://www.opengeodata.nrw.de/produkte/umwelt_klima/naturschutz/linfos/Vogelschutzgebiete_EPSG25832_Shape.zip'


# Sub-Areas
# ---------
# Here: Quartiere in Wuppertal
# Source: https://www.offenedaten-wuppertal.de/dataset/8f80dbba-5fd9-4279-8a14-0d6f7180c5c2/resource/8f80dbba-5fd9-4279-8a14-0d6f7180c5c2
# only relevant if use_subareas = 1
url_subareas = 'https://daten.wuppertal.de/Infrastruktur_Bauen_Wohnen/Baubloecke_EPSG25832_SHAPE.zip'                   # SET ME
fp_subareas_dir = '/media/gustav/Data/thesisdata/offenedaten_wuppertal/Baubloecke'                                      # SET ME
fp_subareas_aggr_dir = '/media/gustav/Data/thesisdata/offenedaten_wuppertal/Baubloecke_aggr'                            # SET ME
# Analysis
# --------
# output paths to write aggregated data for analysis
fp_analysis_dir = '/media/gustav/Data/thesisdata/analysis/'                                                            # SET ME

###############################################################################
#################################### MAIN #####################################
###############################################################################

# setup to write stdout to logfile
# --------------------------------
# taken from https://devpress.csdn.net/python/62fd36e4c67703293080301e.html
if perform_stdout_duplication: # not working out of the box
    start_time_log = time.strftime("%Y%m%d-%H%M%S")
    filename_log = 'log_'+start_time_log+'.txt'
    check_dir(fp_log_dir)
    fp_log = os.path.join(fp_log_dir, filename_log)

    tee = subprocess.Popen(["tee", fp_log], stdin=subprocess.PIPE)

    # Cause tee's stdin to get a copy of our stdin/stdout (as well as that
    # of any child processes we spawn)
    os.dup2(tee.stdin.fileno(), sys.stdout.fileno())
    os.dup2(tee.stdin.fileno(), sys.stderr.fileno())

    # The flush flag is needed to guarantee these lines are written before
    # the two spawned /bin/ls processes emit any output
    print("\nstdout", flush=True)
    print("stderr", file=sys.stderr, flush=True)

    # These child processes' stdin/stdout are
    os.spawnve("P_WAIT", "/bin/ls", ["/bin/ls"], {})
    os.execve("/bin/ls", ["/bin/ls"], os.environ)

##########################
# PART ONE:  PREPROCESSING
##########################
start_time_part1 = time.time()
print('\n-----------------------')
print('PART ONE: PREPROCESSING')
print('-----------------------\n')

#-----------------------------------------------------------------------------#
#--- AMTLICHE GEMEINDE SCHLÜSSEL (GV-ISys) UND DIGITALE VERWALTUNGSGRENZEN ---#
#-----------------------------------------------------------------------------#
# Note: for bigger gdf better use bounds as argument instead of gdf to get celllists, refactor if needed

# Digitale Verwaltungsgrenzen (DVG)
# ---------------------------------
# source: https://www.opengeodata.nrw.de/produkte/geobasis/dvg/
gdf_spatial_extent = None

if use_dvg:
    start_time_dataset = time.time()
    print('Amtliche Gemeindeschlüssel und Digitale Verwaltungsgrenze')
    print('----------------------------------------------------------\n')

    # choose filepath of digitale Verwaltungsgrenze
    # fp_shp_dvg = os.path.join(fp_dvg_dir,'dvg1bld_nw.shp')    # Bundesländer
    # fp_shp_dvg = os.path.join(fp_dvg_dir,'dvg1rbz_nw.shp')    # Regierungsbezirke
    # fp_shp_dvg = os.path.join(fp_dvg_dir,'dvg1krs_nw.shp')    # Kreise
    fp_shp_dvg = os.path.join(fp_dvg_dir, 'dvg1gem_nw.shp')     # Gemeinden, alle
    # fp_shp_dvg = os.path.join(fp_dvg_dir,'dvg1gem_nw_o.shp')  # Gemeinden, ohne?

    # get geodataframes of selected DVG and of all DVG
    gdf_dvg_all = gpd.read_file(fp_shp_dvg)
    if gem_list_selected is not None:
        print('get gdf of digitale Verwaltungsgrenzen of ', gem_list_selected,' ...')
        gdf_dvg_selected = get_dvg_geodataframe(gem_list_selected, fp_shp_dvg)   # epsg:25832

    # get spatial extents as gdf for cropping other geo data
    gdf_spatial_extent = get_gdf_spatial_extent_epsg3035(gdf_dvg_selected) # epsg:3035

    check_dir(fp_dvg_dir_out,verbose=False)
    print('write gdf_dvg_selected and gdf_spatial_extent to files in ... \n'+fp_dvg_dir_out)
    gdf_dvg_selected.to_file(fp_dvg_dir_out+'dvg_selected.gpkg', driver='GPKG')
    gdf_spatial_extent.to_file(fp_dvg_dir_out+'dvg_spatial_extent.gpkg', driver='GPKG')

    # get list of cellnames for Zensusdata, Regionalpläne and Amtliche Basiskarten (ABK)
    celllist_zensus = get_celllist_zensus(gdf_dvg_selected, INSPIRE_size)
    celllist_rp = get_celllist_rp(gdf_dvg_selected)
    celllist_abk_farbe = get_celllist_abk(gdf_dvg_selected, colour=True)
    celllist_abk_sw = get_celllist_abk(gdf_dvg_selected, colour=False)

    # get a list of AGS ('KN') of all DVG which are (partly or completely) within bounds of selected DVG
    gdf_dvg_within_spatial_extent = get_gdf_within_spatial_extent(gdf_dvg_all, gdf_spatial_extent)
    ags_list_within_spatial_extent = list(gdf_dvg_within_spatial_extent['KN'])
    gem_list_within_spatial_extent = list(gdf_dvg_within_spatial_extent['GN'])

    print('celllist_zensus[0:3]=',celllist_zensus[0:3])
    print('celllist_rp[0:3]=',celllist_rp[0:3])
    print('celllist_abk_farbe[0:3]=',celllist_abk_farbe[0:3])
    print('celllist_abk_sw[0:3]=',celllist_abk_sw[0:3])
    print('\ntime needed for dataset: ', time.time() - start_time_dataset, 's\n')

# GV-ISys
# -------
# GV-ISys: Amtliche Gemeinde Schlüssel (AGS), Amtliche Regionalschlüssel (ARS), PLZ, Gemeindename and Kooridnates (Mittelpunkt)
# GV-ISys KBS = WGS 84, EPSG: 4326
# GV-ISys Descrption: https://www.destatis.de/DE/Themen/Laender-Regionen/Regionales/Gemeindeverzeichnis/Administrativ/beschreibung-gebietseinheiten.pdf?__blob=publicationFile

if use_gvisys:
    print('Gemeinde-Verzeichnis-Informationssystem (GV-ISys)')
    print('-------------------------------------------------\n')
    start_time_dataset = time.time()
    # load df with AGS, Gemeindenamen and PLZ from Excel Sheet
    fp_gvisys_excel = '/media/gustav/Data/thesisdata/destatis_GV-ISys/Alle_politisch_selbstständigen_Gemeinden_31.12.2022/AuszugGV4QAktuell.xlsx'
    gvisys_sheetname = 'Onlineprodukt_Gemeinden'
    gvisys_header = [0,1,2,3,4]
    gvisys_col_ars_land = 2         # column C, started counting at 0 (column A) # ARS-Code: Land
    gvisys_col_ars_rb = 3           # column D, started counting at 0 (column A) # ARS-Code: Regierungsbezirk
    gvisys_col_ars_krs = 4          # column E, started counting at 0 (column A) # ARS-Code: Kreis
    gvisys_col_ars_vb = 5           # column F, started counting at 0 (column A) # ARS-Code: Verbandsgemeinde
    gvisys_col_ars_gem = 6          # column G, started counting at 0 (column A) # ARS-Code: Gemeinde
    gvisys_col_ars = [2,3,4,5,6]    # columns C-F, started counting at 0 (column A) # ARS-Code: total
    gvisys_col_gem = 7              # column H, started counting at 0 (column A) # Gemeindename
    gvisys_col_plz = 13             # column N, started counting at 0 (column A) #
    gvisys_col_lon = 14             # column O, started counting at 0 (column A) # Longitude
    gvisys_col_lat = 15             # column P, started counting at 0 (column A) # Latitude

    df_gvisys = pd.read_excel(fp_gvisys_excel, sheet_name=gvisys_sheetname, skiprows=gvisys_header, header=None, converters={gvisys_col_plz:str})

    print('time needed for dataset: ', time.time() - start_time_dataset, 's\n')
#-----------------------------------------------------------------------------#
#------------------------- AMTLICHE BASISKARTEN NRW --------------------------#
#-----------------------------------------------------------------------------#

# Daten:        https://www.opengeodata.nrw.de/produkte/infrastruktur_bauen_wohnen/amtliche_basiskarten/abk_tiff/
# Metadaten:    https://geoportal.nrw/?activetab=map#/datasets/iso/af99735b-866b-431b-98eb-00069564b01b
#
# KBS:          EPSG:25832 (ETRS89 / UTM Zone 32N)

if use_abk_farbe or use_abk_sw:
    start_time_dataset = time.time()
    print('Amtliche Basiskarten NRW')
    print('------------------------\n')

    check_dir(fp_abk_pardir)    # check if dir exists, if not create it

    if use_abk_farbe:
        url_abk_dir = os.path.join(url_abk_pardir, 'abk_farbe_tiff')
        fp_abk_dir = os.path.join(fp_abk_pardir, 'farbe')
        check_dir(fp_abk_dir)   # check if dir exists, if not create it
        download_tiff_tiles(url_abk_dir, fp_abk_dir, celllist_abk_farbe)

    if use_abk_sw:
        url_abk_dir = os.path.join(url_abk_pardir, 'abk_sw_tiff')
        fp_abk_dir = os.path.join(fp_abk_pardir, 'sw')
        check_dir(fp_abk_dir)   # check if dir exists, if not create it
        download_tiff_tiles(url_abk_dir, fp_abk_dir, celllist_abk_sw)

    print('time needed for dataset: ', time.time() - start_time_dataset, 's\n')
#-----------------------------------------------------------------------------#
#----------------------------- REGIONALPLÄNE NRW -----------------------------#
#-----------------------------------------------------------------------------#

# Daten:        https://www.opengeodata.nrw.de/produkte/infrastruktur_bauen_wohnen/regionalplan/rp_tiff/
# Metadaten:    https://www.geoportal.nrw/?activetab=map#/datasets/iso/64299584-eb58-471a-8d9d-716ef097647a
#
# KBS:          EPSG:25832 (ETRS89 / UTM Zone 32N)
#
# Remarks:  Don't use this data. Not much information. Bad resolution.
#           OSM is far more detailed. This data is only for testing purposes.

if use_rp:
    start_time_dataset = time.time()
    print('Regionalpläne NRW')
    print('------------------\n')

    check_dir(fp_rp_dir) # check if dir exists, if not create it
    download_tiff_tiles(url_rp_dir, fp_rp_dir, celllist_rp)

    print('time needed for dataset: ', time.time() - start_time_dataset, 's\n')

#-----------------------------------------------------------------------------#
#----------------------------- Open Street Maps ------------------------------#
#-----------------------------------------------------------------------------#
# todo, test write to gpkg
if use_osm:
    start_time_dataset = time.time()
    print('Open Street Maps')
    print('----------------\n')

    # local settings
    write_osm_to_shp = 0    # 1: write osm data to shapefile, 0: do not write   (slower) (default = 0)
    write_osm_to_gpkg = 1   # 1: write osm data to gpkg, 0: do not write        (faster) (default = 1)
    download_osm_qml = 1    # 1: download qml styles after writing to crop directory, 0: do not download (default = 1)
    mem_osm_gdfs = 1        # 1: keep cropped gdfs in memory after writing, 0: delete gdfs after writing (experimental)

    gdf_dict_osm = {}   # dictionary for gdfs

    fp_osm_dir = os.path.abspath(os.path.join(fp_osm_dir_raw,os.path.pardir))   # filepath to osm dir (parent dir of raw data)
    fp_crop_shp_dir = os.path.join(fp_osm_dir, 'osm_crop.shp/')                 # filepath to .shp folder, cropped data
    fp_crop_gpkg_dir = os.path.join(fp_osm_dir, 'osm_crop.gpkg/')               # filepath to .gpkg folder, cropped data

    # check filepaths
    if not os.path.isdir(fp_osm_dir):
        print('Error: Directory does not exist: ' + fp_osm_dir)
        print('Please download OSM data first and set folder path correctly. Will abort.')
        sys.exit()
    if not os.path.isdir(fp_osm_dir_raw):
        print('Error: Shapefolder does not exist: ' + fp_osm_dir_raw)
        print('Please download OSM data first and set folder path correctly. Will abort.')
        sys.exit()
    if not os.path.isdir(fp_crop_shp_dir):
        print('Warning: Shapefolder does not exist: ' + fp_crop_shp_dir)
        print('Used to save cropped data. Will create it.')
        os.mkdir(fp_crop_shp_dir)
    if not os.path.isdir(fp_crop_gpkg_dir):
        print('Warning: Shapefolder does not exist: ' + fp_crop_gpkg_dir)
        print('Used to save cropped data. Will create it.')
        os.mkdir(fp_crop_gpkg_dir)

    file_sizeMB = 0
    for layer in fiona.listlayers(fp_osm_dir_raw):
        file_sizeMB += os.path.getsize(os.path.join(fp_osm_dir_raw, layer + '.shp'))/1e6 # float
    print('Total size of OSM data: ', str(round(file_sizeMB)), 'MB with ', len(fiona.listlayers(fp_osm_dir_raw)), 'layers.')

    # get gdfs layer-wise croppped to spatial extent and write to file
    if gdf_spatial_extent is not None:
        print('Start with OSM data layer-wise: read, crop to spatial extent (and write if selected)...\\')
        print('\tread from: ' + fp_osm_dir_raw)
        if write_osm_to_shp: print('\twrite to: ' + os.path.join(fp_crop_shp_dir, '<layername>.shp'))
        if write_osm_to_gpkg: print('\twrite to: ' + os.path.join(fp_crop_gpkg_dir, '<layername>.gpkg\n'))
        for layer in fiona.listlayers(fp_osm_dir_raw):
            print('layer: '+layer)
            start_time = time.time()
            fp_layer = os.path.join(fp_osm_dir_raw, layer + '.shp')
            gdf_dict_osm[layer] = gpd.read_file(fp_osm_dir_raw,layer=layer,bbox=gdf_spatial_extent,engine="fiona")
            file_sizeMB = str((round(os.path.getsize(fp_layer) / 1e3) / 1e3))
            print('\tread layer from .shp in '+str(time.time() - start_time)+' s. (ca. '+file_sizeMB+' MB)')
            if write_osm_to_shp:
                start_time = time.time()
                fp_layer = os.path.join(fp_crop_shp_dir,layer+'.shp')
                gdf_dict_osm[layer].to_file(fp_layer,driver='ESRI Shapefile')
                file_sizeMB = str((round(os.path.getsize(fp_layer) / 1e3) / 1e3))
                print('\twritten layer to .shp in '+str(time.time() - start_time)+' s. (ca. '+file_sizeMB+' MB)')
            if write_osm_to_gpkg:
                start_time = time.time()
                fp_layer = os.path.join(fp_crop_gpkg_dir, layer + '.gpkg')
                gdf_dict_osm[layer].to_file(fp_layer,driver='GPKG')
                file_sizeMB = str((round(os.path.getsize(fp_layer) / 1e3) / 1e3))
                print('\twritten layer to .gpkg in '+str(time.time() - start_time)+' s. (ca. '+file_sizeMB+' MB)')
            if mem_osm_gdfs == 0:
                del gdf_dict_osm[layer] # garbage collection

        # download qml styles for QGIS into folder with cropped data
        if write_osm_to_shp and download_osm_qml:
            os.chdir(fp_crop_shp_dir)
            for layer in fiona.listlayers(fp_osm_dir_raw):
                wget.download(url_repo_qml_osm+layer+'.qml',out=layer+'.qml')
        if write_osm_to_gpkg and download_osm_qml:
            os.chdir(fp_crop_gpkg_dir)
            for layer in fiona.listlayers(fp_osm_dir_raw):
                wget.download(url_repo_qml_osm+layer+'.qml',out=layer+'.qml')

    # get gdfs layer-wise without cropping # TODO: remove? not used
    else:
        print('Warning: no spatial extent defined, will read all layers in '+fp_osm_dir_raw+' without cropping')
        for layer in fiona.listlayers(fp_osm_dir_raw):
            print('\tstart reading layer: '+layer+'...')
            start_time = time.time()
            gdf_dict_osm[layer] = gpd.read_file(fp_osm_dir_raw,layer=layer,engine="fiona")
            print('\tfinished reading in %s seconds.' % (time.time() - start_time))

    print('needed time for dataset: ', str(int((time.time() - start_time_dataset)/60))+' min '+str(int((time.time() - start_time_dataset)%60))+' sec\n')

#-----------------------------------------------------------------------------#
#--------------------------- HAUSUMRINGE - (ALKIS) ---------------------------#
#-----------------------------------------------------------------------------#

if use_hu:
    start_time_dataset = time.time()
    print('Hausumringe (ALKIS)')
    print('-------------------\n')

    # NOTE: DEPRECATED, USED ONCE, THAN EDITED CSV FILE MANUALLY, WILL NOW DOWNLOAD MODIFIED CSV FROM GITHUB REPOSITORY
    # functions for Hausumringe ALKIS (quick and dirty, depend on global variables, don't move unedited to other file)
    # -------------------------------
    def get_hu_dict_df(fp_hu_gfk_xml):
        """
        read xml file and return dictionary dataframe
        :param fp_hu_gfk_xml:
        :return: hu_dict
        """
        with open(fp_hu_gfk_xml, 'r', encoding='utf-8') as file:
            hu_xml = file.read()
        hu_dict = xmltodict.parse(hu_xml, encoding='utf-8')

        # create pd dataframe from hu xml dictionary
        hu_dict_df0 = pd.DataFrame.from_dict(hu_dict['gml:Dictionary']['dictionaryEntry'], orient='columns')
        hu_dict_df = pd.concat(
            pd.DataFrame({'gfk_code': row['gml:name'][0]['#text'], 'gfk_text': row['gml:name'][1]}, index=[0]) for row
            in hu_dict_df0['gml:Definition'])
        #    hu_dict_df = hu_dict_df.drop(['index'],axis=1)
        hu_dict_df = hu_dict_df.reset_index()

        return hu_dict_df

    def gfk_code_to_text(gfk_code):
        """
        translate gfk code into text
        :param gfk_code:
        :return: gfk_text

        remark: quick and dirty, hu_dict_df is global variable hu_dict_df
                didn't work with lambda function or apply function with two arguments
                DON'T MOVE DEFINITION TO OTHER FILE
        """
        gfk_text = hu_dict_df.loc[hu_dict_df['gfk_code'] == gfk_code]['gfk_text'].values[0]
        return gfk_text

    # -----------------------------------------------------------------------------#

    # code for Hausumringe ALKIS
    # --------------------------

    # filepaths
    fp_hu_shp_raw = os.path.join(fp_hu_dir_raw, 'hu_shp.shp')                   # for reading
    fp_hu_shp_crop = os.path.join(fp_hu_dir_out, 'hu_crop.shp')                 # for writing
    fp_hu_gpkg_crop = os.path.join(fp_hu_dir_out, 'hu_crop.gpkg')               # for reading and writing
    fp_hu_gfk_mod_csv = os.path.join(fp_hu_dir_out, 'BuildingFunctionTypeAdV_mod.csv') # for writing

#    fp_hu_gfk_xml = os.path.join(fp_hu_dir_raw, 'BuildingFunctionTypeAdV.xml')  # for reading, NOW USES MODIFIED CSV
#    fp_hu_gfk_csv = os.path.join(fp_hu_dir_out, 'BuildingFunctionTypeAdV.csv')  # for writing, NOW USES MODIFIED CSV

    # check directory structure
    check_dir(fp_hu_dir_raw)
    check_dir(fp_hu_dir_out)

    # check if gfk-dictionary is available, NEW VERSION (manually modified csv)
    if not os.path.isfile(fp_hu_gfk_mod_csv):
        os.chdir(fp_hu_dir_out)
        print('Download gfk-dictionary from '+url_hu_gfk_mod+'...')
        wget.download(url_hu_gfk_mod)

    hu_dict_df = pd.read_csv(fp_hu_gfk_mod_csv, encoding='unicode_escape')

    # load original gfk-dictionary (xml) and save as csv, OLD VERSION (xml) (NOW use manually modified csv instead!)
    # used xml from https://repository.gdi-de.org/schemas/adv/citygml/Codelisten/BuildingFunctionTypeAdV.xml
#    if not os.path.isfile(fp_hu_gfk_xml):
#        os.chdir(fp_hu_dir_out)
#        print('Download gfk-dictionary from '+url_hu_gfk+'...')
#        wget.download(url_hu_gfk)
#        hu_dict_df = get_hu_dict_df(fp_hu_gfk_xml)  # hu_dict_df = {'gfk_code' = ['',...], 'gfk_text' = ['',...]}
#        hu_dict_df.drop(columns=['index'])
#        hu_dict_df.to_csv(fp_hu_gfk_csv, index=False, encoding='utf-8')

    # load cropped data if available
    if os.path.isfile(fp_hu_gpkg_crop):
        print('Load cropped Hausumringe data from '+fp_hu_gpkg_crop+' ...')
        gdf_hu = gpd.read_file(fp_hu_gpkg_crop)

    # else: read raw data, crop to spatial extent, translate gfk_code to gfk_text, write to gpkg and shp
    else:
        # read hu and crop to spatial extent
        print('start reading hu clipped to spatial extent...')
        start_time = time.time()
        gdf_hu = gpd.read_file(fp_hu_shp_raw,bbox=gdf_spatial_extent,engine="fiona")
        print('finished reading in %s seconds.' % (time.time() - start_time))

        # translate gfk_code column to gfk_text column
        gdf_hu['GFK_text'] = gdf_hu['GFK'].copy()
        gdf_hu['GFK_text'] = gdf_hu['GFK_text'].apply(gfk_code_to_text) # needs hu_dict_df as global variable

        print('write cropped hu to shape file...')
        start_time = time.time()
        gdf_hu.to_file(fp_hu_shp_crop,driver='ESRI Shapefile')
        print('finished writing in %s seconds.' % (time.time() - start_time))

        print('write cropped hu to gpkg file...')
        start_time = time.time()
        gdf_hu.to_file(fp_hu_gpkg_crop,driver='GPKG')
        print('finished writing in %s seconds.' % (time.time() - start_time))

    # Pre-Analysys of Hausumringe
    if perform_pre_analysis_hu_gfk:
        print('Total number of Hausumringe: ', len(gdf_hu),'in Rectangle around DVG of ',gem_list_selected)
        hu_gfk_analysis_df = get_hu_gfk_analysis_df(gdf_hu, hu_dict_df)
        hu_gfk_analysis_df.to_csv(os.path.join(fp_analysis_dir, 'hu_gfk_analysis.csv'), index=False, encoding='utf-8')
        print('Hausumringe GFK analysis saved to '+os.path.join(fp_analysis_dir, 'hu_gfk_analysis.csv'))

    print('needed time for dataset: ', str(int((time.time() - start_time_dataset)/60))+' min '+str(int((time.time() - start_time_dataset)%60))+' sec\n')

#-----------------------------------------------------------------------------#
#--------------------------- RWB Hausumringe LANUV ---------------------------#
#-----------------------------------------------------------------------------#
# Raumwärmebedarfs-Modell
# https://www.opengeodata.nrw.de/produkte/umwelt_klima/klima/raumwaermebedarfsmodell/
if use_rwb:
    start_time_dataset = time.time()
    print('Raumwärmebedarfs-Modell LANUV')
    print('-----------------------------\n')

    fp_rwb_dir_zips = os.path.join(fp_rwb_dir, 'zips')
    fp_rwb_hu_crop = os.path.join(fp_rwb_dir, 'rwb_hu_crop.gpkg')
    fp_rwb_wld_crop = os.path.join(fp_rwb_dir, 'rwb_wld_crop.gpkg')
    fp_rwb_hu_uncropped = os.path.join(fp_rwb_dir, 'rwb_hu_all_ags_within_spatial_extent.gpkg')  # testing
    fp_rwb_wld_uncropped = os.path.join(fp_rwb_dir, 'rwb_wld_all_ags_within_spatial_extent.gpkg')  # testing

    check_dir(fp_rwb_dir)
    check_dir(fp_rwb_dir_zips)

    if os.path.isfile(fp_rwb_hu_crop) and os.path.isfile(fp_rwb_wld_crop):
        start_time = time.time()
        print('\nLoad cropped RWB Hausumringe/Wärmeliniendichte LANUV data from:')
        print('\t'+fp_rwb_hu_crop)
        print('\t'+fp_rwb_wld_crop)
        gdf_rwb_hu_crop = gpd.read_file(fp_rwb_hu_crop)
        gdf_rwb_wld_crop = gpd.read_file(fp_rwb_wld_crop)
        print('\tloaded cropped RWB Hausumringe/Wärmeliniendichte LANUV data')
        print('\tin '+str(int((time.time() - start_time)/60))+' min '+str(int((time.time() - start_time)%60))+' sec')
    else:
        print('\nDid not find cropped RWB Hausumringe and Wärmeliniendichte LANUV data at:')
        print(fp_rwb_hu_crop)
        print(fp_rwb_wld_crop)
        print('will search for uncropped data offline, load and crop it to spatial extent.')
        print('if offline data is not available download RWB LANUV data as zips and unzip them first.')
        print('data for each AGS will be loaded and combined into a single geodataframe and later saved')
        print('\tfolder for cropped/unzipped data: '+fp_rwb_dir)
        print('\tfolder for zipped uncropped data: '+fp_rwb_dir_zips)
        print('\turl to download if necessary: '+url_rwb_dir)
        print(str(len(gem_list_within_spatial_extent))+' Gemeinden within area within spatial extent to search for:')
        print(gem_list_within_spatial_extent)
        start_time = time.time()
        os.chdir(fp_rwb_dir_zips) # files will be downloaded to this directory
        gem_list_within_spatial_extent_edited = [] # debug
        for idx, ags in enumerate(ags_list_within_spatial_extent):
            gem = gem_list_within_spatial_extent[idx] # Gemeindename used in filename without special characters
            gem = gem.replace('ü', 'ue')
            gem = gem.replace('ö', 'oe')
            gem = gem.replace('ä', 'ae')
            gem = gem.replace('ß', 'ss')
            gem = gem.replace(' ', '-')
            gem = gem.split('(')[0]  # cut of things like '(Ruhr)', 'Westf.', etc.
            if gem[-1] == '-':  # cut of trailing '-' if present
                gem = gem[:-1]
            gem_list_within_spatial_extent_edited.append(gem) # debug
            filename_zip = 'Raumwaermebedarfsmodell-NRW_' + ags + '_' + gem + '_EPSG25832_Shape.zip'
            url_rwb_zip = os.path.join(url_rwb_dir, filename_zip)
            fp_rwb_zip = os.path.join(fp_rwb_dir_zips, filename_zip)
            if os.path.isdir(os.path.join(fp_rwb_dir, ags)):
                print('\talready unzipped ' + filename_zip)
                continue
            if os.path.isfile(fp_rwb_zip):
                print('\talready downloaded ' + filename_zip)
                with zipfile.ZipFile(fp_rwb_zip, 'r') as zip_ref:
                    zip_ref.extractall(fp_rwb_dir) # extract to this
                print('\tdid unzip ' + filename_zip)
                continue
            try:
                wget.download(url_rwb_zip)
            except:
                print('\tcould not download ' + filename_zip)
            if os.path.isfile(fp_rwb_zip):
                print('\tdownloaded ' + filename_zip)
                with zipfile.ZipFile(fp_rwb_zip, 'r') as zip_ref:
                    zip_ref.extractall(fp_rwb_dir) # extract to this
                print('\tdid unzip ' + filename_zip)
        print('downloaded zip files/checked local zip files and unzipped them')
        print('\tin '+str(int((time.time() - start_time)/60))+' min '+str(int((time.time() - start_time)%60))+' sec')

        gdf_rwb_hu_per_ags_dict = {}  # dictionary to store rwb hausumringe geodataframes per ags (key = ags, value = gdf)
        gdf_rwb_wld_per_ags_dict = {}  # dictionary to store rwb wärmeliniendichte geodataframes per ags (key = ags, value = gdf)
        gdf_rwb_hu_uncropped = gpd.GeoDataFrame()  # geodataframe to combine all rwb hu gdfs into one
        gdf_rwb_wld_uncropped = gpd.GeoDataFrame() # geodataframe to combine all rwb wld gdfs into one

        start_time = time.time()
        print('read RWB Hausumringe/Wärmeliniendichte LANUV into geodataframes for each AGS within spatial extent and combine into two single geodataframes...')
        # read RWB Hausumringe LANUV into geodataframe for each AGS
        for ags in ags_list_within_spatial_extent:
            # print progress e.g. 'Mettmann (1/26)' or 'Gevelsberg (26/26)'
            print('\t'+gem_list_within_spatial_extent[ags_list_within_spatial_extent.index(ags)]+' ('+str(
                ags_list_within_spatial_extent.index(ags)+1)+'/'+str(len(ags_list_within_spatial_extent))+')')
            fp_rwb_ags_dir = os.path.join(fp_rwb_dir, ags)  # sub directory for each ags
            fp_rwb_hu_shp = os.path.join(fp_rwb_ags_dir, 'hausumringe-' + ags + '.shp')
            fp_rwb_wld_shp = os.path.join(fp_rwb_ags_dir, 'waermeliniendichte-' + ags + '.shp')
            gdf_rwb_hu_per_ags_dict[ags] = gpd.read_file(fp_rwb_hu_shp)
            gdf_rwb_wld_per_ags_dict[ags] = gpd.read_file(fp_rwb_wld_shp)
            gdf_rwb_hu_uncropped = gdf_rwb_hu_uncropped.append(gdf_rwb_hu_per_ags_dict[ags])
            gdf_rwb_wld_uncropped = gdf_rwb_wld_uncropped.append(gdf_rwb_wld_per_ags_dict[ags])
        print('\tread RWB Hausumringe/Wärmeliniendichte LANUV into geodataframes for each AGS within spatial extent and combined them into two single geodataframes')
        print('\tin '+str(int((time.time() - start_time)/60))+' min '+str(int((time.time() - start_time)%60))+' sec')

        start_time = time.time()
        print('cut combined RWB Hausumringe/Wärmeliniendichte LANUV geodataframes to spatial extent (rectangle)...')
        gdf_rwb_hu_crop = get_gdf_within_spatial_extent(gdf_rwb_hu_uncropped, gdf_spatial_extent)
        gdf_rwb_wld_crop = get_gdf_within_spatial_extent(gdf_rwb_wld_uncropped, gdf_spatial_extent)
        print('\tcut combined RWB Hausumringe/Wärmeliniendichte LANUV geodataframes to spatial extent (rectangle)')
        print('\tin '+str(int((time.time() - start_time)/60))+' min '+str(int((time.time() - start_time)%60))+' sec')

        start_time = time.time()
        print('write RWB Hausumringe/Wärmeliniendichte LANUV geodataframes cropped to spatial extent to ...')
        print('\t'+fp_rwb_hu_crop)
        print('\t'+fp_rwb_wld_crop)
        gdf_rwb_hu_crop.to_file(fp_rwb_hu_crop, driver='GPKG')
        gdf_rwb_wld_crop.to_file(fp_rwb_wld_crop, driver='GPKG')
        print('\twrote them to .gpkg\'s in '+str(int((time.time() - start_time)/60))+' min '+str(int((time.time() - start_time)%60))+' sec')

        # testing: write uncropped gdfs to gpkg
        start_time = time.time()
        print('write RWB Hausumringe/Wärmeliniendichte LANUV of all AGS within spatial extent (uncropped) to ...')
        print('\t'+fp_rwb_hu_uncropped)
        print('\t'+fp_rwb_wld_uncropped)
        gdf_rwb_hu_uncropped.to_file(fp_rwb_hu_uncropped, driver='GPKG')
        gdf_rwb_wld_uncropped.to_file(fp_rwb_wld_uncropped, driver='GPKG')
        print('\twrote them to .gpkg in '+str(int((time.time() - start_time)/60))+' min '+str(int((time.time() - start_time)%60))+' sec')

        gdf_rwb_hu = gdf_rwb_hu_crop
        gdf_rwb_wld = gdf_rwb_wld_crop
        del gdf_rwb_hu_crop, gdf_rwb_wld_crop #, gdf_rwb_hu_uncropped, gdf_rwb_wld_uncropped

    print('needed time for dataset: ', str(int((time.time() - start_time_dataset)/60))+' min '+str(int((time.time() - start_time_dataset)%60))+' sec\n')

#-----------------------------------------------------------------------------#
#----------------------------- ZENSUS 2011 DATA ------------------------------#
#-----------------------------------------------------------------------------#
# KBS = EPSG:3035

if use_zensus_wohn or use_zensus_geb:
    print('Zensus 2011 Data')
    print('----------------\n')

    print('quality-threshold for zensus data (Anzahl_q value): ',zensus_q_threshold)

if use_zensus_wohn or use_zensus_geb or use_zensus_pop:
    if not os.path.isdir(fp_zensus_dir_out):
        os.mkdir(fp_zensus_dir_out)

# Zensus Wohnungsdaten 100m
# -------------------------
if use_zensus_wohn:
    start_time_dataset = time.time()
    print("start with zensus wohnungsdaten 100m ...")

    # file paths
    fname_wohn100m_remapped_geo_no_ext = 'Wohnungen100m_q' + str(zensus_q_threshold) + '_remapped_geo'                 # default filename without extension
    fp_wohn100m_remapped_geo_no_ext = os.path.join(fp_zensus_dir_out,fname_wohn100m_remapped_geo_no_ext)                    # filepath for writing and reading

    # a) use already remapped data, if it exists as gpkg
    if os.path.isfile(fp_wohn100m_remapped_geo_no_ext+'.gpkg'):
        print('\tremapped zensus data with geometry exists, using that one ...')
        wohn100m = zensusdata()
        wohn100m.gdf = gpd.read_file(fp_wohn100m_remapped_geo_no_ext+'.gpkg')

    # b) read raw data from csv, crop it, remap, add q_diff columns and geometry column, write to csv, shp, gpkg
    else:
        # initialize zensusdata object instance
        wohn100m = zensusdata()  # create zensusdata object instance
        wohn100m.fp = fp_zensus_csv_wohn100m_raw
        wohn100m.celllist = celllist_zensus  # set celllist
        wohn100m.m_filter = zensus_m_filter_wohn

        # read zensus2011 data from csv (default: crop to .celllist and .m_filter)
        wohn100m.df_orig = wohn100m.read_zensusdata_from_csv()                  # read raw data -> .df_orig
        # remap zensus2011 data to new columns (combine keys to one column)
        wohn100m.df = wohn100m.remap_zensusdata(zensus_q_threshold)             # remap .df_orig -> .df
        wohn100m.df = wohn100m.add_diff_columns()                               # add diff columns to .df
        wohn100m.df = wohn100m.add_geometry_column()                            # add geometry column to .df
        wohn100m.gdf = wohn100m.get_gdf_from_df()                               # convert .df to .gdf

        # write remapped geodataframe to files
        if write_zensusdata_to_csv:
            print('\twriting geodataframe to csv ...')
            start_time = time.time()
            wohn100m.gdf.to_csv(fp_wohn100m_remapped_geo_no_ext+'.csv')                                # write to csv
            print('\tgeodataframe written to csv file in ', time.time() - start_time, 's')
        if write_zensusdata_to_shp:
            print('\twriting geodataframe to shape file ...')
            start_time = time.time()
            wohn100m.gdf.to_file(fp_wohn100m_remapped_geo_no_ext+'.shp', driver='ESRI Shapefile')      # write to shp
            print('\tgeodataframe written to shape file in ', time.time() - start_time, 's')
        if write_zensusdata_to_gpkg:
            print('\twriting geodataframe to gpkg ...')
            start_time = time.time()
            wohn100m.gdf.to_file(fp_wohn100m_remapped_geo_no_ext+'.gpkg', driver='GPKG')               # write to gpkg
            print('\tgeodataframe written to gpkg in ', time.time() - start_time, 's\n')
        print("\tfinished with zensus wohnungsdaten 100m.")

    print('needed time for datasets: ', str(int((time.time() - start_time_dataset)/60))+' min '+str(int((time.time() - start_time_dataset)%60))+' sec\n')

# Zensus Gebäudedaten 100m
# ------------------------
if use_zensus_geb:
    start_time_dataset = time.time()
    print("start with zensus gebäudedaten 100m ...")

    # file paths
    fname_geb100m_remapped_geo_no_ext = 'Geb100m_q' + str(zensus_q_threshold) + '_remapped_geo'                        # default filename without extension
    fp_geb100m_remapped_geo_no_ext = os.path.join(fp_zensus_dir_out,fname_geb100m_remapped_geo_no_ext)                      # filepath for writing and reading

    geb100m = zensusdata()  # create zensusdata object instance

    # a) use already remapped data, if it exists as gpkg
    if os.path.isfile(fp_geb100m_remapped_geo_no_ext+'.gpkg'):
        print('\tremapped zensus data with geometry exists, using that one ...')
        geb100m.gdf = gpd.read_file(fp_geb100m_remapped_geo_no_ext+'.gpkg')
        if False: # additionally load original data for debugging & analysis (not needed for further processing)
            geb100m.df_orig = geb100m.read_zensusdata_from_csv(fp=fp_zensus_csv_geb100m_raw,
                                                               celllist=celllist_zensus,
                                                               m_filter=zensus_m_filter_geb)
    # b) read raw data from csv, crop it, remap, add q_diff columns and geometry column, write to csv, shp, gpkg
    else:
        # initialize zensusdata object instance
        geb100m.fp = fp_zensus_csv_geb100m_raw
        geb100m.celllist = celllist_zensus  # set celllist
        geb100m.m_filter = zensus_m_filter_geb

        # read zensus2011 data from csv (default: crop to .celllist and .m_filter)
        geb100m.df_orig = geb100m.read_zensusdata_from_csv()                    # read -> df_orig
        # remap zensus2011 data to new columns (combine keys to one column)
        geb100m.df = geb100m.remap_zensusdata(zensus_q_threshold)               # remap -> df
        geb100m.df = geb100m.add_diff_columns()                                 # add diff columns to .df
        geb100m.df = geb100m.add_geometry_column()                              # add geometry column to .df
        geb100m.gdf = geb100m.get_gdf_from_df()                                 # convert .df to .gdf

        # write remapped geodataframe to files
        if write_zensusdata_to_csv:
            print('\twriting geodataframe to csv ...')
            start_time = time.time()
            geb100m.gdf.to_csv(fp_geb100m_remapped_geo_no_ext+'.csv', index=False)                 # write to csv
            print('\tgeodataframe written to csv in ', time.time() - start_time, 's')
        if write_zensusdata_to_shp:
            print('\twriting geodataframe to shape file ...')
            start_time = time.time()
            geb100m.gdf.to_file(fp_geb100m_remapped_geo_no_ext+'.shp', driver='ESRI Shapefile')    # write to shp
            print('\tgeodataframe written to shape file in ', time.time() - start_time, 's')
        if write_zensusdata_to_gpkg:
            print('\twriting geodataframe to gpkg ...')
            start_time = time.time()
            geb100m.gdf.to_file(fp_geb100m_remapped_geo_no_ext+'.gpkg', driver='GPKG')             # write to gpkg
            print('\tgeodataframe written to gpkg in ', time.time() - start_time, 's\n')

    print('needed time for zensus dataset(s): ', str(int((time.time() - start_time_dataset)/60))+' min '+str(int((time.time() - start_time_dataset)%60))+' sec\n')

# Zensus Einwohner*innen Daten 100m
# ---------------------------------
if use_zensus_pop:
    print('Zensus Einwohner*innen Daten 100m ...')
    print('-------------------------------------\n')
    start_time = time.time()
    print('reading zensus data from csv ...')
    pop100m = zensusdata(fp=fp_zensus_csv_pop100m_raw, celllist=celllist_zensus)  # create zensusdata object instance
    pop100m.df_orig = pop100m.read_zensusdata_from_csv(crop_to_celllist=True, crop_to_m_filter=False, delimiter=';')

    print('converting to geodataframe ...')
    pop100m.df = pop100m.df_orig.copy() # no remapping needed, one row per cell
    pop100m.df = pop100m.add_geometry_column()
    pop100m.gdf = pop100m.get_gdf_from_df()

    # debug
    pop100m.gdf.to_file(os.path.join(fp_zensus_dir_out,'pop100m_crop_orig.shp'), driver='ESRI Shapefile',OVERWRITE=False)
    pop100m.gdf.to_file(os.path.join(fp_zensus_dir_out,'pop100m_crop_orig.gpkg'), driver='GPKG',OVERWRITE=False)

    # filter out Einwohner*innen values -1
    print('filtering out Einwohner*innen values -1 ...')
    #pop100m.df = pop100m.df.loc[pop100m.df['Einwohner'] >= 0] # net needed yet because gdf is used for further processing
    pop100m.gdf = pop100m.gdf.loc[pop100m.gdf['Einwohner'] >= 0]
    print('write zensus einwohner_innen daten 100m to files ...')
    pop100m.gdf.to_file(os.path.join(fp_zensus_dir_out,'pop100m_crop_filter.shp'), driver='ESRI Shapefile',OVERWRITE=False)
    pop100m.gdf.to_file(os.path.join(fp_zensus_dir_out,'pop100m_crop_filter.gpkg'), driver='GPKG',OVERWRITE=False)
    print('\tread, cropped and wrote zensus einwohner_innen daten 100m to files in ', time.time() - start_time, 's\n')

# Pre-Analysis of Zensus Data (Gebäude und Wohnungen)
# ---------------------------------------------------
if perform_pre_analysis_zensus_data and (use_zensus_wohn or use_zensus_geb):
    print('\npre-analysis of zensus data ...')

    if use_zensus_geb:
        print('\tstart with zensus gebäudedaten 100m ...')
        geb100m.print_total_number_orig_df() # print total number of units and cells
        zensus_geb_merkmal_analyse_dict = {} # merkmale as keys, contain analyse dataframes
        if geb100m.df is None and geb100m.gdf is not None:
            geb100m.df = pd.DataFrame(geb100m.gdf)  # if gdf is loaded from file, df is not created

        for key_merkmal in zensus_m_filter_geb[1:]: # skip 'INSGESAMT'
            try:
                # stdout info (though diff info does not consider pos and neg values!)
                geb100m.print_total_q_diff_number_for_merkmal(key_merkmal, 'Gebäude')
                # create dataframe with further analysis
                zensus_geb_merkmal_analyse_dict[key_merkmal] = get_zensus_geb_merkmal_analyse_df(key_merkmal,geb100m.df,geb100m.m_dict)
                # write df to csv
                fp_zensus_analysis = os.path.join(fp_analysis_dir, 'zensus_geb_analysis_q' + str(
                    zensus_q_threshold) + '_' + key_merkmal + '.csv')
                zensus_geb_merkmal_analyse_dict[key_merkmal].to_csv(fp_zensus_analysis, encoding='utf-8', index=False)
                print('\tZensus Merkmals-Ausprägungen Häufigkeiten Analysedata also written to')
                print(fp_zensus_analysis)
            except:
                print('Warning: '+key_merkmal+' not found as Merkmal in zensus data!')

    if use_zensus_wohn:
        print('\tstart with zensus gebäudedaten 100m ...')
        wohn100m.print_total_number_orig_df() # print total number of units and cells
        zensus_wohn_merkmal_analyse_dict = {}
        if wohn100m.df is None and wohn100m.gdf is not None:
            wohn100m.df = pd.DataFrame(wohn100m.gdf)  # if gdf is loaded from file, df is not created

        for key_merkmal in zensus_m_filter_wohn[1:]: # skip 'INSGESAMT'
            try:
                # stdout info (though diff info does not consider pos and neg values!)
                wohn100m.print_total_q_diff_number_for_merkmal(key_merkmal, 'Wohnungen')
                # create dataframe with further analysis
                zensus_wohn_merkmal_analyse_dict[key_merkmal] = get_zensus_geb_merkmal_analyse_df(key_merkmal,wohn100m.df,wohn100m.m_dict)
                # write df to csv
                fp_zensus_analysis = os.path.join(fp_analysis_dir, 'zensus_wohn_analysis_q' + str(
                                                                    zensus_q_threshold) + '_' + key_merkmal + '.csv')
                zensus_wohn_merkmal_analyse_dict[key_merkmal].to_csv(fp_zensus_analysis, encoding='utf-8', index=False)
                print('\tZensus Merkmals-Ausprägungen Häufigkeiten Analysedata also written to')
                print(fp_zensus_analysis)
            except:
                print('Warning: '+key_merkmal+' not found as Merkmal in zensus data!')
#-----------------------------------------------------------------------------#
#------------------------- NRW Standorte Strom Wärme -------------------------#
#-----------------------------------------------------------------------------#

if use_ee_nrw and use_gvisys:
    start_time_dataset = time.time()
    print('NRW Standorte Strom Wärme (LANUV)')
    print('---------------------------------\n')

    # check filepaths
    if os.path.isdir(fp_eenrw_gdb) == False:
        print('Error: Directory does not exist: ' + fp_eenrw_gdb)
        print('Please download OSM data first and set folder path correctly. Will abort.')
        sys.exit()
    if os.path.isdir(fp_eenrw_crop) == False:
        print('Warning: Directory does not exist: ' + fp_eenrw_crop)
        print('To save cropped data will create directory: ' + fp_eenrw_crop)
        os.mkdir(fp_eenrw_crop)

    # initialize variables
    df_dict_eenrw_excel, gdf_dict_eenrw_excel, gdf_dict_eenrw_gdb = {}, {}, {}          # to store (geo-)dataframes
    art, layers_empty, sheets_empty = '', [], []                                        # for user feedback
    layer_whitelist, layer_blacklist, sheet_whitelist, wheet_blacklist = [], [], [], [] # for filtering

    if eenrw_layer_whitelist is not None:
        layer_whitelist = eenrw_layer_whitelist
    if eenrw_layer_blacklist is not None:
        layer_blacklist = eenrw_layer_blacklist

    # EE-NRW Geodatabase
    # ------------------

    # Warning handling
    if gdf_spatial_extent is None:
        print('Error: gdf_spatial_extent is None. Will abort. Reading unfiltered data can kill the memory.')
        sys.exit()
    if layer_whitelist == [] or layer_whitelist is None:
        print('Warning: layer_whitelist is empty. Will not filter layers by it.')
    if layer_blacklist == [] or layer_blacklist is None:
        print('Warning: layer_blacklist is empty. Will not filter layers by it.')
    if layer_whitelist == [] or layer_whitelist is None and layer_blacklist == [] or layer_blacklist is None:
        print('Warning: Will read all layers! Might take a while...')

    # list of wanted layers
    layers_wanted = fiona.listlayers(fp_eenrw_gdb)
    if layer_whitelist != [] and layer_whitelist is not None:
        layers_wanted = [x for x in layers_wanted if any (y in x for y in layer_whitelist)]
    if layer_blacklist != [] and layer_blacklist is not None:
        layers_wanted = [x for x in layers_wanted if not any (y in x for y in layer_blacklist)]

    print('layers_wanted: '+str(layers_wanted)+' (layernames from raw data filtered by whitelist and blacklist, including typos)')
    print('\nstart reading, cropping and writing layers (probably OVERWRITING!)...')
    print('from '+fp_eenrw_gdb)
    print('to '+fp_eenrw_crop+'\n')
    print('if cropped data of a layer (with corrected typos) exists already, load it instead of reading the raw data and cropping it again.')

    # read layers
    for layer_gdb in layers_wanted:
        # get gdf layer names by correcting typos in gdb layer name
        layer_gdf = layer_gdb
        if 'Windbetrieb' in layer_gdb:
            layer_gdf = layer_gdf.replace('Windbetrieb','WindBetrieb')
        if 'Planungsreg' in layer_gdb:
            layer_gdf = layer_gdf.replace('Planungsreg','PlanungsReg')

        # user info (print art only once) e.g. 'Biomasse'
        if len(layers_wanted) > 30 and layer_gdf.split('_')[0] != art:
            art = layer_gdf.split('_')[0]
            print('art: '+art)

        fp_eenrw_crop_layer_gpkg = os.path.join(fp_eenrw_crop, layer_gdf+'.gpkg')

        # read layer from gpkg if already cropped
        if os.path.isfile(fp_eenrw_crop_layer_gpkg):
            gdf_dict_eenrw_gdb[layer_gdf] = gpd.read_file(fp_eenrw_crop_layer_gpkg,driver='GPKG')
            print('\tfound already cropped data and loaded it: '+layer_gdf)
            continue
        # read layer from raw data (cropped to bbox)
        gdf_dict_eenrw_gdb[layer_gdf] = gpd.read_file(fp_eenrw_gdb,layer=layer_gdf,bbox=gdf_spatial_extent,engine='fiona')

        # to prevent writing empty layers to file (error) -> skip writing
        if gdf_dict_eenrw_gdb[layer_gdf].empty == True:
            layers_empty.append(layer_gdf)
            continue

        # write layer to gpkg
        gdf_dict_eenrw_gdb[layer_gdf].to_file(fp_eenrw_crop_layer_gpkg,driver='GPKG', OVERWRITE=True)  #

        # write layer to shapefile # NOTE DONT USE SHAPEFILES: slower, bigger, col names cut to 10 chars
        # adjust column names in current gdf if necessary for shapefile export
#            for key in gdf_dict_eenrw_gdb[layer_gdf].keys():
            # convert columns with dtype datetime (geodatabase) to str (shapefile)
#                if gdf_dict_eenrw_gdb[layer][key].dtype == 'datetime64[ns]':
#                    gdf_dict_eenrw_gdb[layer][key] = gdf_dict_eenrw_gdb[layer][key].dt.strftime('%Y-%m-%d %H:%M:%S')
            # convert ß in column name to B (shapefile)
#                if 'ß' in key:
#                    gdf_dict_eenrw_gdb[layer] = gdf_dict_eenrw_gdb[layer].rename(columns={key: key.replace('ß', 'B')})
#        if os.path.isdir(fp_eenrw_crop + '.shp') == False:
#            os.mkdir(fp_eenrw_crop + '.shp')
#        gdf_dict_eenrw_gdb[layer_gdf].to_file(fp_eenrw_crop + '.shp',driver='ESRI Shapefile') # layer in .shp directory

        print('\tLayer is read, cropped and written: '+layer_gdf)

    # user info
    print('\nFollowing layers were empty after cropping and will not be written to file:')
    for layer_gdf in layers_empty:
        print('\tLayer is read, cropped and empty:   ' + layer_gdf)
        del gdf_dict_eenrw_gdb[layer_gdf]

    # EE-NRW Excel-File
    # -----------------
    key_kwk, key_abw = None, None # keys for gdf_dict_eenrw_xlsx, also sheet names in excel file

    fp_eenrw_uncrop = fp_eenrw_dir + 'ind_abw_kwk_uncropped/'                                        # debugging directory, to check if cropping with geopandas.GeoDataframe.cx works
    check_dir(fp_eenrw_uncrop)

    # Check if file exists and download if not
    if os.path.isfile(fp_eenrw_standorte_xlsx) == False:
        print('\nError: fp_eenrw_standorte_xlsx is not a file. Will try to download.')
        os.chdir(fp_eenrw_dir)
        print('downloading '+os.path.basename(url_eenrw_standorte_xlsx_zip)+' ... from '+url_eenrw_standorte_xlsx_zip)
        wget.download(url_eenrw_standorte_xlsx_zip)
        print('extracting '+os.path.basename(url_eenrw_standorte_xlsx_zip)+' ...')
        with zipfile.ZipFile(fp_eenrw_dir+os.path.basename(url_eenrw_standorte_xlsx_zip), 'r') as zip_ref:
            zip_ref.extractall(fp_eenrw_dir)
        print('removing '+os.path.basename(url_eenrw_standorte_xlsx_zip)+' ...')
        os.remove(fp_eenrw_dir+os.path.basename(url_eenrw_standorte_xlsx_zip))
        # check again if file exists and search for file if not
        if os.path.isfile(fp_eenrw_standorte_xlsx) == False:
            print('Error: fp_eenrw_standorte_xlsx is still not a file. Will search for file.')
            for file in os.listdir(fp_eenrw_dir):
                if file.endswith('.xlsx') and 'Standorte' in file:
                    fp_eenrw_standorte_xlsx = fp_eenrw_dir+file
                    print('found file: '+fp_eenrw_standorte_xlsx)
                    break

    # read excel file, search for sheets with KWK and Abwärme in name
    print('\nreading '+fp_eenrw_standorte_xlsx+' ...')
    xl = pd.ExcelFile(fp_eenrw_standorte_xlsx)
    sheets = xl.sheet_names
    for sheet in sheets:
        if any(x in sheet for x in ['KWK','Kwk','kwk']):
            df_dict_eenrw_excel[sheet] = xl.parse(sheet)
            key_kwk = sheet
        if any(x in sheet for x in ['Abwärme','Abwaerme','abwärme','abwaerme']):
            df_dict_eenrw_excel[sheet] = xl.parse(sheet, converters={'Plz': str})
            key_abw = sheet
    print('read the following sheets from xlsx file into dataframe(s): ')
    print(str(list(df_dict_eenrw_excel.keys()))+'\n')

    # if georeferenced cropped data exists already load it from gpkg with layername
    # otherwise add geometry column to df from xlsx file and crop them to spatial extent

    # bounds used to crop KWK and Industrielle Abwärme data if not already cropped
    minx, miny, maxx, maxy = gdf_spatial_extent.to_crs(epsg=25832).total_bounds

    if key_kwk is None:
        print('Error: key_kwk is None. No KWK sheet found in xlsx file.')
    else: # KWK Sheet
        fp_eenrw_crop_layer_gpkg = fp_eenrw_crop + key_kwk + '.gpkg'
        fp_eenrw_uncrop_layer_gpkg = fp_eenrw_uncrop + key_kwk + '.gpkg'

        # if georeferenced cropped data exists already load it from gpkg with layername
        if os.path.isfile(fp_eenrw_crop_layer_gpkg) == True:
            gdf_dict_eenrw_excel[key_kwk] = gpd.read_file(fp_eenrw_crop_layer_gpkg)
            print(key_kwk+': found already cropped data. gdf is loaded from:')
            print(fp_eenrw_crop_layer_gpkg)
        # else add geometry column to df from xlsx file, convert to gdf, crop them to spatial extent and write to gpkg
        else:
            print(key_kwk+': start adding geometry column and cropping to spatial extent for df:')
            # coordinates from UTM32_Ost and UTM32_Nord columns as Point (epsg:25832)
            df_dict_eenrw_excel[key_kwk]['geometry'] = df_dict_eenrw_excel[key_kwk].apply(lambda x: Point(x['UTM32_Ost'], x['UTM32_Nord']), axis=1)
            gdf_dict_eenrw_excel[key_kwk] = gpd.GeoDataFrame(df_dict_eenrw_excel[key_kwk], geometry='geometry', crs={'init': 'epsg:25832'})
            gdf_dict_eenrw_excel[key_kwk].to_file(fp_eenrw_uncrop_layer_gpkg,driver='GPKG') # write layer to gpkg
            print(key_kwk+': df with geometry is uncropped and written to file: ')
            print('\t'+fp_eenrw_uncrop_layer_gpkg)
            gdf_dict_eenrw_excel[key_kwk] = gdf_dict_eenrw_excel[key_kwk].cx[minx:maxx, miny:maxy] # crop to spatial extent
            gdf_dict_eenrw_excel[key_kwk].to_file(fp_eenrw_crop_layer_gpkg,driver='GPKG')  # write layer to gpkg
            print(key_kwk+': df with geometry is cropped and written to file: ')
            print('\t'+fp_eenrw_crop_layer_gpkg)

    if key_abw is None:
        print('Error: key_abw is None. No Industrielle Abwärme sheet found in xlsx file.')
    else: # Industrielle Abwärme Sheet
        fp_eenrw_crop_layer_gpkg = fp_eenrw_crop + key_abw + '.gpkg'
        fp_eenrw_uncrop_layer_gpkg = fp_eenrw_uncrop + key_abw + '.gpkg'

        # if georeferenced cropped data exists already load it from gpkg with layername
        if os.path.isfile(fp_eenrw_crop_layer_gpkg) == True:
            gdf_dict_eenrw_excel[key_abw] = gpd.read_file(fp_eenrw_crop_layer_gpkg)
            print(key_abw+': found already cropped data. gdf is loaded from:')
            print(fp_eenrw_crop_layer_gpkg)
        # else add geometry column to df from xlsx file, convert to gdf, crop them to spatial extent and write to gpkg
        else:
            print(key_abw+': start adding geometry column and cropping to spatial extent for df:')
            # coordinates from Plz or Gemeindenamen as Point, (epsg:4326 -> epsg:25832): Ortsmittelpunkte # TODO: usage of gvisys as backup, not used, can be removed from function
            df_dict_eenrw_excel[key_abw]['geometry'] = add_geometry_to_df_eenrw_excel_abw_epsg4326(df_dict_eenrw_excel,key_abw,df_gvisys,gvisys_col_plz,gvisys_col_lon,gvisys_col_lat)
            gdf_dict_eenrw_excel[key_abw] = gpd.GeoDataFrame(df_dict_eenrw_excel[key_abw], geometry='geometry', crs='epsg:4326')
            gdf_dict_eenrw_excel[key_abw] = gdf_dict_eenrw_excel[key_abw].to_crs(epsg=25832) # crs conversion to epsg:25832
            gdf_dict_eenrw_excel[key_abw].to_file(fp_eenrw_uncrop_layer_gpkg,driver='GPKG') # write layer to gpkg
            print(key_abw+': df with geometry is uncropped and written to file:')
            print('\t'+fp_eenrw_uncrop_layer_gpkg)
            gdf_dict_eenrw_excel[key_abw] = gdf_dict_eenrw_excel[key_abw].cx[minx:maxx, miny:maxy] # crop to spatial extent
            gdf_dict_eenrw_excel[key_abw].to_file(fp_eenrw_crop_layer_gpkg,driver='GPKG')  # write layer to gpkg
            print(key_abw+': df with geometry is cropped and written to file:')
            print('\t'+fp_eenrw_crop_layer_gpkg)

    print('\nneeded time for dataset: ', str(int((time.time() - start_time_dataset)/60))+' min '+str(int((time.time() - start_time_dataset)%60))+' sec\n')

#-----------------------------------------------------------------------------#
#----------------------------- Schutzgebiete NRW -----------------------------#
#-----------------------------------------------------------------------------#

# folder structure
#
# fp_prot_nrw_raw_dir
#  |--- zips
#        |--- name1.zip
#               |--- randomname1.shp
#        |--- name2.zip
#               |--- randomname2a.shp
#               |--- randomname2b.shp
#  |--- shps
#        |--- name1.shp
#        |--- name2.shp
#
# fp_prot_nrw_crop_dir
#  |--- gpkgs
#        |--- shp1.gpkg

if use_prot_nrw:
    print('Schutzgebiete NRW')
    print('------------------\n')
    start_time_dataset = time.time()

    check_dir(fp_prot_nrw_raw_dir)
    check_dir(fp_prot_nrw_crop_dir)

    for filename_zip in url_prot_linfos_dict.keys():

        fp_dir_zip = os.path.join(fp_prot_nrw_raw_dir, filename_zip)
        # download zip if not already downloaded
        if os.path.isfile(fp_dir_zip) == False:
            print('download '+filename_zip+' from:')
            print('\t'+url_prot_linfos_dict[filename_zip])
            os.chdir(fp_prot_nrw_raw_dir)
            wget.download(url_prot_linfos_dict[filename_zip])
            print('downloaded '+filename_zip+' to:')
            print('\t'+fp_dir_zip)
        # unzip
        print('unzip '+filename_zip+' to:')
        print('\t'+fp_prot_nrw_raw_dir)
        with zipfile.ZipFile(fp_dir_zip, 'r') as zip_ref:
            zip_ref.extractall(fp_prot_nrw_raw_dir)
        print('unzipped '+filename_zip+' to:')
        print('\t'+fp_prot_nrw_raw_dir)
        # delete zip
        os.remove(fp_dir_zip)
        print('deleted '+filename_zip+' from:')
        print('\t'+fp_prot_nrw_raw_dir)

        fp_dir_raw = os.path.splitext(filename_zip)[0]
        check_dir(fp_dir_raw)


print('PART ONE processing time: '+str(int((time.time()-start_time_part1)/60))+' min '+str(int((time.time()-start_time_part1)%60))+' sec')

#########################################
# PART TWO: COMBINE DATA (POSTPROCESSING)
#########################################

print('---------------------------------------')
print('PART TWO: COMBINE DATA (POSTPROCESSING)')
print('---------------------------------------\n')

#-----------------------------------------------------------------------------#
#---------------- Hausumringe (ALKIS) and Zensus Gebäude Data ----------------#
#-----------------------------------------------------------------------------#
if use_hu and use_zensus_geb:
    start_time_dataset = time.time()
    print('Hausumringe (ALKIS) and Zensus Gebäude Data')
    print('-------------------------------------------\n')
    # KBS = EPSG:3035       for Zensusdaten
    # KBS = EPSG:4647       for Hausumringe (ALKIS)

    fp_hu_gpkg_crop_merk = os.path.join(fp_hu_dir_out, 'hu_merk_q'+str(zensus_q_threshold)+'.gpkg')                 # for reading and writing

    # variable definitions
    # --------------------
    key_hu_centroid = 'Centroid'            # key for gdf_hu for new column with centroid
    key_hu_cellid = 'Gitterzellen_ID'       # key for gdf_hu for new column with cellid
    key_hu_zensus = 'zensus'                # key for gdf_hu for new column with gfk-zensus-relevance
    key_hu_alt_rel = 'alt_rel'              # key for gdf_hu for new column with gfk-age-relevance
    key_hu_merkmale = []                    # will contain Merkmale as list e.g. 'BAUJAHR_MZ', 'Heiztyp'
    merkmals_auspraegungen_dict = {}        # will contain all possible Ausprägungen as list for each Merkmal (key)
    for merkmal in geb100m.m_filter[1:]:    # skip 'INSGESAMT' as Merkmal
        key_hu_merkmale.append(merkmal)
        merkmals_auspraegungen_dict[merkmal] = []
        for tuple in geb100m.m_dict[merkmal][0:-4]:
            merkmals_auspraegungen_dict[merkmal].append(tuple[2]) # skip last 4 entries (reserved for Q1, Q2, DiffAbs, DiffRel)
    merkmal_unbekannt = 'Unbekannt'         # default value for alloted Merkmals-Ausprägungen to Hausumringe
    key_zensus_cellid = geb100m.col_ref[0]  # theoretically usable for other grid sizes
    list_gfk_codes_zensus = hu_dict_df.loc[hu_dict_df[key_hu_zensus] == 1]['gfk_code'].to_list()  # gfk-codes counted in zensus
    list_gfk_codes_alt_rel = hu_dict_df.loc[hu_dict_df[key_hu_alt_rel] == 1]['gfk_code'].to_list()  # gfk-codes altersklassen-relevant
    counter = 0  # to print progress

    # 1) If modified data of Hausumringe (ALKIS) exists already: use that one load this data
    if os.path.isfile(fp_hu_gpkg_crop_merk):
        print('modified data of Hausumringe (ALKIS) exists already: use that one')
        gdf_hu = gpd.read_file(fp_hu_gpkg_crop_merk)

    # 2) If not: Messy Part starts: Use cropped hu data from Part One and modify
    #   2a) add new columns 'Centroid', 'Gitterzellen_ID', 'BAUJAHR_MZ', 'zensus', 'alt_rel'
    #   2b) assign values to new columns (approx. 1 min + 10 s + 30 min for 500.000 hu)
    else:
        try:
            gdf_hu.keys()                                   # check if gdf_hu exists
        except:
            if os.path.isfile(fp_hu_gpkg_crop):
                gdf_hu = gpd.read_file(fp_hu_gpkg_crop)     # otherwise load cropped data from Part One

        if geb100m.df is None and geb100m.gdf is not None:  # happens if geb100m.gdf is read from gpkg
            geb100m.df = pd.DataFrame(geb100m.gdf)          # df probably faster than gdf for following operations

        # add new columns:
        # ----------------
        gdf_hu[key_hu_centroid] = Point(0,0)                # Centroid
        gdf_hu[key_hu_cellid] = ''                          # Gitterzellen_ID
        gdf_hu[key_hu_zensus] = 0                           # indicate if hu is counted in zensus      (0 or 1)
        gdf_hu[key_hu_alt_rel] = 0                          # indicate if hu is altersklassen-relevant (0 or 1)
        for key_hu_merkmal in key_hu_merkmale:
            gdf_hu[key_hu_merkmal] = merkmal_unbekannt       # e.g. for keys 'BAUJAHR_MZ' oder 'Heiztyp'                # is overwritten later during .index.map()

        # assign values to new columns:
        # -----------------------------
        gdf_hu[key_hu_centroid] = gdf_hu.centroid                                       # ca. 1 min for 500.000 hu
        gdf_hu[key_hu_cellid] = gdf_hu['Centroid'].to_crs(epsg=3035).apply(
            lambda point: get_gridcell_id_from_point(point))    # < 10 s for 500.000 hu
        gdf_hu[key_hu_zensus] = gdf_hu['GFK'].apply(lambda x: 1 if x in list_gfk_codes_zensus else 0)
        gdf_hu[key_hu_alt_rel] = gdf_hu['GFK'].apply(lambda x: 1 if x in list_gfk_codes_alt_rel else 0)

        # extract hu with set zensus flag for merkmals zuweisung (copy to new gdf) to speed up iterations
        gdf_hu_zensus = gdf_hu.loc[gdf_hu[key_hu_zensus] == 1].copy() # only hu with zensus-flag set

        list_zensus_geb_cells = list(geb100m.df[key_zensus_cellid].unique()) # list of all zensus gebäude cells
        list_hu_zensus_cells = list(gdf_hu_zensus[key_hu_cellid].unique()) # list of all cells with hu whose zensus-flag is set
        list_hu_zensus_cells_not_in_zensus_geb_cells = list(set(list_hu_zensus_cells) - set(list_zensus_geb_cells)) # case 0) s. below
        list_zensus_geb_cells_not_in_hu_zensus_cells = list(set(list_zensus_geb_cells) - set(list_hu_zensus_cells)) # not iterated over
        list_zensus_geb_cells_and_hu_zensus_cells = list(set(list_zensus_geb_cells) & set(list_hu_zensus_cells)) # iterated over
        n_cells_to_iterate_over = len(list_zensus_geb_cells_and_hu_zensus_cells)  # to print progress (cells from case 0) already excluded)

        n_zensus_geb_without_corresponding_hu_zensus = geb100m.df[geb100m.df[key_zensus_cellid].isin(list_zensus_geb_cells_not_in_hu_zensus_cells)]['INSGESAMT'].astype(int).sum()
        n_hu_zensus_without_corresponding_zensus_geb = len(gdf_hu_zensus[gdf_hu_zensus[key_hu_cellid].isin(list_hu_zensus_cells_not_in_zensus_geb_cells)])

        # some preliminary info:
        print('\nSome preliminary info:')
        print('\tnumber of cells with zensus gebäude: ', len(list_zensus_geb_cells))
        print('\tnumber of cells with zensus gebäude without corresponding cells of hu whose zensus flag is set: ', len(list_zensus_geb_cells_not_in_hu_zensus_cells))
        print('\tnumber of cells with zensus gebäude with corresponding cells of hu whose zensus flag is set (to iterate over): ', len(list_zensus_geb_cells_and_hu_zensus_cells))
        print('\tnumber of cells with hu whose zensus-flag is set: ', len(list_hu_zensus_cells))
        print('\tnumber of cells with hu whose zensus-flag is set but without corresponding cell of zensus gebäude: ', len(list_hu_zensus_cells_not_in_zensus_geb_cells))
        print('\tnumber of cells with hu whose zensus-flag is set WITH corresponding cells of zensus gebäude (to iterate over): ', len(list_zensus_geb_cells_and_hu_zensus_cells))
        print('\tnumber of zensus gebäude in all cells with zensus gebäude: ', geb100m.df['INSGESAMT'].astype(int).sum())
        print('\tnumber of hu with zensus-flag set: ', len(gdf_hu_zensus))
        print('\tnumber of hu with zensus-flag set with corresponding zensus gebäude: ', len(gdf_hu_zensus) - n_hu_zensus_without_corresponding_zensus_geb)
        print('\tnumber of hu with zensus-flag set without any corresponding zensus gebäude: ', n_hu_zensus_without_corresponding_zensus_geb)
        print('\tnumber of zensus gebäude without any corresponding hu whose zensus-flag is set: ', n_zensus_geb_without_corresponding_hu_zensus)

        try:
            list_zensus_geb_cells_with_baujahr_more_than_geb_in_cells = list(geb100m.df[geb100m.df['DiffAbsAlt']<0][key_zensus_cellid])
            n_zensus_geb_cells_with_baujahr_more_than_geb_in_cells = len(geb100m.df[geb100m.df['DiffAbsAlt']<0])
            n_zensus_geb_with_baujahr_more_than_geb_in_cells = -geb100m.df[geb100m.df['DiffAbsAlt']<0]['DiffAbsAlt'].sum()
            print('\tnumber of cells with zensus gebäude whose DiffAbsAlt value is smaller zero: ', n_zensus_geb_cells_with_baujahr_more_than_geb_in_cells)
            print('\tsum of DiffAbsAlt values smaller zero: ', n_zensus_geb_with_baujahr_more_than_geb_in_cells)
        except:
            pass

        # statistics and comparison variables for case b): (keys are merkmale)
        n_count_case_b_cells = {} # number of cells with case b)
        geb_merk_more_than_hu_zensus_cells_diff_sum_dict = {} # sum of diff (n_geb_merk_cell - n_hu_zensus_cell) of case b) cells
        geb_merk_more_than_hu_zensus_cells_zensus_diffabs_pos_sum_dict = {} # sum of pos DiffAbs values of case b) cells
        geb_merk_more_than_hu_zensus_cells_zensus_diffabs_neg_sum_dict = {} # sum of neg DiffAbs values of case b) cells

        if False: # experimental (using sjoin instaed of iterating over all matching cells of both datasets)
            test_hu = gdf_hu_zensus[gdf_hu_zensus[key_hu_cellid].isin(list_zensus_geb_cells_and_hu_zensus_cells)].copy()
            test_hu['geometry'] = test_hu['geometry'].centroid
            test_hu = test_hu.to_crs(epsg=geb100m.gdf.crs.to_epsg())
            test_geb = geb100m.gdf[geb100m.gdf[key_zensus_cellid].isin(list_zensus_geb_cells_and_hu_zensus_cells)].copy()
            test_geb = geb100m.gdf.copy()
            sjoin_gdf = gpd.sjoin(test_hu, test_geb, how='left', op='within') # dunno... not sure how to continue...
        # TODO: try to create function like get_hu_merk_auspraeg_list_in_cell_ac()/_b() which can be applied ...
        # TODO: ... to all cells simultaneously with .apply() for a single Merkmal, to avoid iterating over all cells
        # TODO: BETTER APPROACH: use .sjoin to get hu's within cells (for all cells at once) and procede somehow...
        # to assign Merkmals-Ausprägungen to hu, iterate over all cells of hu gdf and apply following steps:
        # for each cell make case distiction and follow strategy :
        # 0) no matching zensus cell:            special case: -> skip cell
        # a) n_geb_merk_cell = n_hu_zensus_cell: regular case: -> i) assign BAUJAHR_MZ to hu
        # b) n_geb_merk_cell > n_hu_zensus_cell: special case: -> i) regard enough random values as to 2 instead of 3
        #                                                      -> ii) if still needed, regard enough other randomly
        #                                                          chosen/all values as one lower, repeat ii) if needed
        # c) n_geb_merk_cell < n_hu_zensus_cell: special case: -> i) as a) plus leave out some hu ('Unbekannt')
        # with n_geb_merk_cell = number of Gebäude in cell with known Merkmals-Ausprägung (Zensus) in current cell and
        # with n_hu_zensus_cell = number of Hausumringe in cell who most likely are counted in Zensus in current cell
        print('will allot Zensus Gebäude Merkmals-Ausprägungen to Hausumringe (ALKIS) might take 1 hour')
        print('for the following Merkmale: ', key_hu_merkmale)
        # same routine for each merkmal
        for key_hu_merkmal in key_hu_merkmale:
            print('start alloting Merkmal: ', key_hu_merkmal)
            counter = 0 # reset progress counter for current merkmal
            start_time = time.time() # reset start time for current merkmal
            # set statistics counter to zero
            n_count_case_b_cells[key_hu_merkmal] = 0
            geb_merk_more_than_hu_zensus_cells_diff_sum_dict[key_hu_merkmal] = 0
            geb_merk_more_than_hu_zensus_cells_zensus_diffabs_pos_sum_dict[key_hu_merkmal] = 0
            geb_merk_more_than_hu_zensus_cells_zensus_diffabs_neg_sum_dict[key_hu_merkmal] = 0

            # iterate over all cells with hu
            for cell in list_zensus_geb_cells_and_hu_zensus_cells:
                print_progress_hu_merkmal_assignment(counter, n_cells_to_iterate_over, start_time)
                counter += 1

                # case c0) skip cell (redundant, already excluded in list_zensus_geb_cells_and_hu_zensus_cells)
                #if cell not in geb100m.df[key_zensus_cellid].to_list(): # probably better: if cell not in list(gdf_hu_zensus[key_hu_cellid].unique()):
                #    continue

                # variables for case distinction and df
                geb_df = geb100m.df.loc[geb100m.df[key_zensus_cellid] == cell] # df extract with all geb in cell
                n_geb_merk_cell = sum(geb_df[merkmals_auspraegungen_dict[key_hu_merkmal]].astype(int).values[0])
                n_hu_zensus_cell = len(gdf_hu_zensus.loc[gdf_hu_zensus[key_hu_cellid] == cell]) # all hu in gdf_hu_zensus has zensus flag set (prefiltered)

                # statistics for case b)
                if n_geb_merk_cell > n_hu_zensus_cell:
                    n_count_case_b_cells[key_hu_merkmal] += 1
                    geb_merk_more_than_hu_zensus_cells_diff_sum_dict[key_hu_merkmal] += (n_geb_merk_cell - n_hu_zensus_cell)
                    if int(geb100m.df[geb100m.df[key_zensus_cellid] == cell][geb100m.m_dict[key_hu_merkmal][-2][2]]) > 0:
                        geb_merk_more_than_hu_zensus_cells_zensus_diffabs_pos_sum_dict[key_hu_merkmal] += int(geb100m.df[geb100m.df[key_zensus_cellid] == cell][geb100m.m_dict[key_hu_merkmal][-2][2]])
                    if int(geb100m.df[geb100m.df[key_zensus_cellid] == cell][geb100m.m_dict[key_hu_merkmal][-2][2]]) < 0:
                        geb_merk_more_than_hu_zensus_cells_zensus_diffabs_neg_sum_dict[key_hu_merkmal] -= int(geb100m.df[geb100m.df[key_zensus_cellid] == cell][geb100m.m_dict[key_hu_merkmal][-2][2]])

                # create list with all merkmals_auspraegungen_dict in cell e.g. ['BauVor1919','BauVor1919','Bau1979_86', ...]
                # case a), b) and c) are handled in different functions
                if n_geb_merk_cell <= n_hu_zensus_cell: # case a) + case c)
                    hu_merk_auspraeg_list_in_cell = get_hu_merk_auspraeg_list_in_cell_ac(geb_df,key_zensus_cellid,n_hu_zensus_cell,cell,merkmals_auspraegungen_dict[key_hu_merkmal],merkmal_unbekannt)
                elif n_geb_merk_cell > n_hu_zensus_cell: # case b)
                    hu_merk_auspraeg_list_in_cell = get_hu_merk_auspraeg_list_in_cell_b(geb_df,key_zensus_cellid,n_hu_zensus_cell,cell,merkmals_auspraegungen_dict[key_hu_merkmal],merkmal_unbekannt)

                # assign values to hu vector-wise
                gdf_hu_zensus.loc[(gdf_hu_zensus[key_hu_cellid] == cell), key_hu_merkmal] = hu_merk_auspraeg_list_in_cell
            print('finished alloting Merkmal: ', key_hu_merkmal, ' in ', str(int((time.time() - start_time)/60)), ' minutes and ', str(int(time.time() - start_time)%60), ' seconds')
            print('there were ', geb_merk_more_than_hu_zensus_cells_diff_sum_dict[key_hu_merkmal], ' more Gebäude with ', key_hu_merkmal, ' than Hausumringe in the same cells')
        # experimental code to assign merkmal values vectorwise for all hu at once
        # still slow, because still iterating over all cells(!) to use get_hu_merk_auspraeg_list_in_cell_ac()/b()
        if False:
            # list with cellids that are in zensus df
            celllist_zensus_with_values = list(geb100m.df[key_zensus_cellid].unique())
            # list of unique hu cellids
            celllist_hu_unique = list(gdf_hu_zensus[key_hu_cellid].unique())
            # gdf with all hu whose cells are also in zensus df, sorted by cellid
            gdf_hu_zensus = gdf_hu_zensus.loc[gdf_hu_zensus[key_hu_cellid].isin(celllist_zensus_with_values)].sort_values(key_hu_cellid)
            # dict with lists of all merkmals-auspraegungen which should be alloted to hu whose cell are also in zensus
            dict_hu_merk_auspraeg_list_for_all_cells = {} # key = key_hu_merkmal

            for key_hu_merkmal in key_hu_merkmale:
                dict_hu_merk_auspraeg_list_for_all_cells[key_hu_merkmal] = []
                # iterate over all cells with hu
                for cell in gdf_hu_zensus[key_hu_cellid].unique():
                    print_progress_hu_merkmal_assignment(counter, n_cells_to_iterate_over, start_time)
                    counter += 1

                    # case c0) skip cell
                    if cell not in geb100m.df[
                        key_zensus_cellid].to_list():  # probably better: if cell not in list(gdf_hu_zensus[key_hu_cellid].unique()):
                        continue

                    # variables for case distinction and df
                    geb_df = geb100m.df.loc[geb100m.df[key_zensus_cellid] == cell]  # df extract with all geb in cell
                    n_geb_merk_cell = sum(geb_df[merkmals_auspraegungen_dict[merkmal]].astype(int).values[0])
                    n_hu_zensus_cell = len(gdf_hu_zensus.loc[(gdf_hu_zensus[key_hu_cellid] == cell) & (gdf_hu_zensus[key_hu_zensus] == 1)])

                    # create list with all merkmals_auspraegungen_dict in cell e.g. ['BauVor1919','BauVor1919','Bau1979_86', ...]
                    # case a), b) and c) are handled in different functions
                    if n_geb_merk_cell <= n_hu_zensus_cell:  # case a) + case c)
                        hu_merk_auspraeg_list_in_cell = get_hu_merk_auspraeg_list_in_cell_ac(geb_df, key_zensus_cellid,
                                                                                             n_hu_zensus_cell, cell,
                                                                                             merkmals_auspraegungen_dict[
                                                                                                 merkmal],
                                                                                             merkmal_unbekannt)
                    elif n_geb_merk_cell > n_hu_zensus_cell:  # case b)
                        hu_merk_auspraeg_list_in_cell = get_hu_merk_auspraeg_list_in_cell_b(geb_df, key_zensus_cellid,
                                                                                            n_hu_zensus_cell, cell,
                                                                                            merkmals_auspraegungen_dict[
                                                                                                merkmal],
                                                                                            merkmal_unbekannt)
                    dict_hu_merk_auspraeg_list_for_all_cells[key_hu_merkmal].extend(hu_merk_auspraeg_list_in_cell)
                # assign auspraegungen of current merkmal to all hu whose cells are also in zensus dataset vector-wise
                gdf_hu_zensus.loc[
                        gdf_hu_zensus[key_hu_cellid].isin(celllist_zensus_with_values)
                        ].sort_values(key_hu_cellid)[key_hu_merkmal] = dict_hu_merk_auspraeg_list_for_all_cells[key_hu_merkmal]

        # assign values of gdf_hu_zensus back to gdf_hu
        for key_hu_merkmal in key_hu_merkmale:
            gdf_hu[key_hu_merkmal] = gdf_hu.index.map(gdf_hu_zensus[key_hu_merkmal]) # overwrites default values in gdf_hu with indices not in gdf_hu_zensus with NaN values, crap
            gdf_hu[key_hu_merkmal] = gdf_hu[key_hu_merkmal].fillna(merkmal_unbekannt) # fill NaN values with merkmal_unbekannt

        print('write cropped hu with alloted merkmale to '+fp_hu_gpkg_crop_merk) # ca. 2 min for 500.000 hu
        start_time = time.time()
        gdf_hu['Centroid'] = gdf_hu['Centroid'].astype(str) # https://github.com/geopandas/geopandas/issues/1883
        gdf_hu.to_file(fp_hu_gpkg_crop_merk, driver='GPKG',OVERWRITE=True)
        print('finished writing in %s seconds.' % (time.time() - start_time))
        fp_hu_shp_crop_merk = fp_hu_gpkg_crop_merk.replace('.gpkg','.shp')
        print('write cropped hu with alloted merkmale to '+fp_hu_shp_crop_merk) # ca. 3 min for 500.000 hu
        start_time = time.time()
        gdf_hu.to_file(fp_hu_shp_crop_merk, driver='ESRI Shapefile',OVERWRITE=True)
        print('finished writing in %s seconds.' % (time.time() - start_time))

    # case b) statistics
    try:
        print('case b) statistics (more gebäude with merkmal than hu with zensus flag set to 1 in cell):')
        for key_hu_merkmal in key_hu_merkmale:
            print('case b) in ', n_count_case_b_cells[key_hu_merkmal], ' cells for merkmal ', key_hu_merkmal)
            print('geb_merk_more_than_hu_zensus_cells_diff_sum_dict['+key_hu_merkmal+']: ', geb_merk_more_than_hu_zensus_cells_diff_sum_dict[key_hu_merkmal])
            print('geb_merk_more_than_hu_zensus_cells_zensus_diffabs_pos_sum_dict['+key_hu_merkmal+']: ', geb_merk_more_than_hu_zensus_cells_zensus_diffabs_pos_sum_dict[key_hu_merkmal])
            print('geb_merk_more_than_hu_zensus_cells_zensus_diffabs_neg_sum_dict['+key_hu_merkmal+']: ', geb_merk_more_than_hu_zensus_cells_zensus_diffabs_neg_sum_dict[key_hu_merkmal])
    except:
        print('more detailed case b) statistics (more gebäude with merkmal than hu with zensus flag set to 1 in cell) not available')
        print('only available if raw data is used to allot merkmals-ausprägungen to hausumringe and printed to stdout')
    # pre-analysis # TODO move to function
    # ------------
    n_hu_total = len(gdf_hu)
    n_hu_zensus1 = len(gdf_hu.loc[gdf_hu[key_hu_zensus] == 1])
    n_hu_zensus0_altrel1 = len(gdf_hu.loc[(gdf_hu[key_hu_zensus] == 0) & (gdf_hu[key_hu_alt_rel] == 1)])
    h_hu_zensus0_altrel0 = len(gdf_hu.loc[(gdf_hu[key_hu_zensus] == 0) & (gdf_hu[key_hu_alt_rel] == 0)])

    print('total number of hu: ', n_hu_total)
    print('total number of hu with zensus-flag set:', n_hu_zensus1, '(beheizte Wohngebäude)')
    print('total number of hu with zensus-flag unset and alt_rel-flag set: ', n_hu_zensus0_altrel1, ' (beheizte Nichtwohngebäude minus Schlösser und Burgen)')
    print('total number of hu with zensus-flag unset and alt_rel-flag unset: ', h_hu_zensus0_altrel0, ' (unbeheizte Gebäude plus Schlösser und Burgen)')

    if perform_pre_analysis_hu_merk:
        start_time = time.time()
        detailed = perform_pre_analysis_hu_merk_detailed
        # set True to get staticis (n_hu, perc_hu) for each merkmals-auspraegung per gfk_code
        # not recommended, takes super long to run and data is pretty useless
        # due to the fact that merkmal-assignment happens randomly
        # makes more sense to get merkmals-ausprägungs statistics for
        # beheizte wohngebäude      (all gfk with zensus = 1, alt_rel = 1)
        # beheizte nichtwohngebäude (all gfk with zensus = 0, alt_rel = 1)
        # unbeheizte gebäude        (all gfk with zensus = 0, alt_rel = 0)
        # todo this is not implemented yet (so use verbose = True and table calculater afterwards)
        # also... table calculator might have problems with floats in the table (libre calc certainly has... :/)

        # further analysis of hu with merkmalen per gfk_code (takes pretty long)
        print('start creating hu_gfk_merkmal_analysis_df ...')
        hu_gfk_merkmal_analysis_df = get_hu_gfk_merkmal_analysis_df(gdf_hu, hu_dict_df,key_hu_merkmale,
                                                                 merkmals_auspraegungen_dict,merkmal_unbekannt,
                                                                 detailed=detailed)
        if detailed:
            fp_hu_gfk_merkmal_analysis = os.path.join(fp_analysis_dir,'hu_gfk_merkmal_analysis_detailed_q'+str(zensus_q_threshold)+'.csv')
        else:
            fp_hu_gfk_merkmal_analysis = os.path.join(fp_analysis_dir,'hu_gfk_merkmal_analysis_q'+str(zensus_q_threshold)+'.csv')
        # write to csv
        hu_gfk_merkmal_analysis_df.to_csv(fp_hu_gfk_merkmal_analysis,encoding='utf-8',index=False)
        print('hu_gfk_merkmal_analysis_df written to '+fp_hu_gfk_merkmal_analysis)
        print('took '+str(int((time.time()-start_time)/60))+'min '+str((time.time()-start_time)%60)+' s in total for hu_gfk_merkmal_analysis_df')

        # further statistics (comparison with hu data with zensus data)
        list_zensus_geb_cells = list(geb_df[key_zensus_cellid].unique())
        list_hu_wg_cells = list(gdf_hu.loc[gdf_hu[key_hu_alt_rel]==1,key_hu_cellid].unique())
        # todo move to function
        if perform_pre_analysis_zensus_data: # prerequisite: merkmals zuweisung only for gfk with set zensus-flag
            hu_zensus_merkmal_analyse_dict = {}
            for key_hu_merkmal in key_hu_merkmale:
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal] = zensus_geb_merkmal_analyse_dict[key_hu_merkmal]
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal]['hu total'] = 0 # add column
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal]['hu % total'] = 0 # add column
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal]['hu % with'] = 0 # add column
                n_hu_merk_known = len(gdf_hu.loc[gdf_hu[key_hu_merkmal] != merkmal_unbekannt])
                # assign values for total number and percentages of hu with merkmals auspraegung
                for merkmals_auspraegung in merkmals_auspraegungen_dict[key_hu_merkmal]:
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                        hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                            key_hu_merkmal] == merkmals_auspraegung,
                        'hu total'] = len(gdf_hu[gdf_hu[key_hu_merkmal]==merkmals_auspraegung]
                                          )                                                             # hu total with ausprägung
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                        hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                            key_hu_merkmal] == merkmals_auspraegung,
                        'hu % total'] = 100*len(gdf_hu[gdf_hu[key_hu_merkmal]==merkmals_auspraegung]
                                                )/n_hu_zensus1                                          # hu % total with ausprägung
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                        hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                            key_hu_merkmal] == merkmals_auspraegung,
                        'hu % with'] = 100*len(gdf_hu[gdf_hu[key_hu_merkmal]==merkmals_auspraegung]
                                               )/n_hu_merk_known # hu % with with ausprägung
                # assign summed up values for hu with and without merkmal, total and percentages
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                        key_hu_merkmal] == 'with',
                    'hu total'] = n_hu_merk_known
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                        key_hu_merkmal] == 'without',
                    'hu total'] = n_hu_zensus1 - n_hu_merk_known
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                        key_hu_merkmal] == 'INSGESAMT',
                    'hu total'] = n_hu_zensus1
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                        key_hu_merkmal] == 'with',
                    'hu % total'] = n_hu_merk_known / n_hu_zensus1 * 100
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                        key_hu_merkmal] == 'without',
                    'hu % total'] = (n_hu_zensus1 - n_hu_merk_known) / n_hu_zensus1 * 100
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                        key_hu_merkmal] == 'INSGESAMT',
                    'hu % total'] = 100
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                        key_hu_merkmal] == 'with',
                    'hu % with'] = 100
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                        key_hu_merkmal] == 'without',
                    'hu % with'] = (n_hu_zensus1 - n_hu_merk_known)/ n_hu_merk_known * 100
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].loc[
                    hu_zensus_merkmal_analyse_dict[key_hu_merkmal][
                        key_hu_merkmal] == 'INSGESAMT',
                    'hu % with'] = (n_hu_zensus1) /  n_hu_merk_known * 100
                fp_hu_zensus_comparison_merkmal = os.path.join(fp_analysis_dir,'hu_zensus_comparison_'+key_hu_merkmal+'_q'+str(zensus_q_threshold)+'.csv')
                hu_zensus_merkmal_analyse_dict[key_hu_merkmal].to_csv(fp_hu_zensus_comparison_merkmal,encoding='utf-8',index=False)
    print('took '+str(int((time.time()-start_time_dataset)/60))+'min '+str((time.time()-start_time_dataset)%60)+' s in total for dataset')

#-----------------------------------------------------------------------------#
#--------------------------------- SUB AREAS ---------------------------------#
#-----------------------------------------------------------------------------#

if use_subareas and not (use_hu and use_zensus_geb and use_rwb and use_ee_nrw):
    print('Warning: use_subareas is True, but use_hu, use_zensus_geb, use_rwb and use_ee_nrw are not all True.')
    print('Please set all to True. Will skip sub area data aggregation.')

if use_subareas and (use_hu and use_zensus_geb and use_rwb and use_ee_nrw):
    start_time_dataset = time.time()
    print('SUB AREA DATA AGGREGATION')
    print('-------------------------------------------\n')

    # read subareas into geodataframe (download and unzip if necessary)
    # -------------------------------
    print('search for subarea file (offline/online) and read into geodataframe...')

    # check directory structure
    if os.path.exists(fp_subareas_dir):
        if os.path.isdir(fp_subareas_dir):
            print('directory '+fp_subareas_dir+' exists')
        else:
            print('Error: File '+fp_subareas_dir+' exists, but is not a directory. Will abort.')
            sys.exit()
    else: # make directory
        print('directory '+fp_subareas_dir+' does not exist, will create it')
        os.mkdir(fp_subareas_dir)

    # change current directory
    os.chdir(fp_subareas_dir)

    # read subarea file into geodataframe if exists (e.g. Baublocke for Wuppertal)
    gdf_subareas = None
    for file in os.listdir('.'):
        # only works if a single shape file or geopackage file is given
        if file.endswith('.shp') or file.endswith('.gpkg'):
            print('\tfile '+file+' exists')
            fp_subareas_file = os.path.join(fp_subareas_dir,file)
            # read subarea file into geodataframe
            gdf_subareas = gpd.read_file(fp_subareas_file)
            print('\tread file '+fp_subareas_file+' into geodataframe')
            break

    # backup: download subarea file if necessary and read from there
    if gdf_subareas is None:
        filename = url_subareas.split('/')[-1]
        # download subarea file if necessary
        if not os.path.isfile(fp_subareas_dir+filename):
            wget.download(url_subareas)
        # unzip file if necessary
        if filename.endswith('.zip'):
            with zipfile.ZipFile(filename, 'r') as zip_ref:
                zip_ref.extractall('.')
        # read subarea file into geodataframe
        for file in os.listdir('.'):
            # only works if a single shape file or geopackage file is given
            if file.endswith('.shp') or file.endswith('.gpkg'): gdf_subareas = gpd.read_file(file)

    if gdf_subareas is None:
        print('Error: could not read any subarea file into geodataframe. Will abort.')
        sys.exit()

    # aggregate values from other datasets into subareas
    # ------------------------------------------------------
    # will use the following datasets:
    # a) HU ALKIS + ZENSUS      -> get number of houses per subarea with specific age (later with specific heiztyp too) # TODO WIP
    # b) RWB LANUV              -> get Wärmebedarf per subarea                                                          # TODO WIP
    # c) EE NRW LANUV           -> get installed power capacity per subarea per energy source                           # TODO WIP

    # Initialize GDFs for subareas to aggregate data into and HU (geometry = Points)
    gdf_subareas_aggr = gdf_subareas.copy()
    gdf_hu_points = gdf_hu.copy()
    gdf_hu_points['geometry'] = gdf_hu_points[key_hu_centroid]
    gdf_hu_points = gdf_hu_points.drop(columns=[key_hu_centroid])
    gdf_hu_points['geometry'] = gpd.GeoSeries.from_wkt(gdf_hu_points['geometry'])
    gdf_hu_points = gpd.GeoDataFrame(gdf_hu_points,geometry='geometry',crs=gdf_hu.crs.to_epsg())

    # a) HU ALKIS + ZENSUS
    # --------------------
    # add columns to subareas geodataframe
    gdf_subareas['alle_Geb_sum_ALKIS'] = 0                      # Anzahl aller Gebäude
    gdf_subareas['beheizte_WonGeb_sum_ALKIS'] = 0               # Anzahl beheizter Wohngebäude, flags: zensus = 1, alt_rel = 0
    gdf_subareas['beheizte_NichtWohnGeb_sum_ALKIS'] = 0         # Anzahl beheizter Nicht-Wohngeb, flags: zensus = 0, alt_rel = 1
    gdf_subareas['unbeheizte_Geb_sum_ALKIS'] = 0                # Anzahl unbeheizter Gebäude, flags: zensus = 0, alt_rel = 0

    for merkmal in key_hu_merkmale:
        for merkmals_auspraegung in merkmals_auspraegungen_dict[merkmal]:
            gdf_subareas_aggr[merkmals_auspraegung] = 0         # Wohngebäudeanzahl(!) nach Merkmalsausprägung

    # resources:
    # https://stackoverflow.com/questions/71359323/how-to-sum-the-number-of-entries-in-a-dataframe-that-are-located-within-a-geopan
    # https://gis.stackexchange.com/questions/346550/accelerating-geopandas-for-selecting-points-inside-polygon
    # https://gis.stackexchange.com/questions/262131/geopandas-intersects-speed

    subarea_indices_with_hu = [] # debug
    subareas_epsg = gdf_subareas.crs.to_epsg()

    # combine hu alkis geodataframe with subareas geodataframe (check for hu within subareas)
    print('\nstart combining hu alkis geodataframe with subareas geodataframe (check for hu within subareas)...')
    print('number of subareas: '+str(len(gdf_subareas_aggr.index))+', number of hu: '+str(len(gdf_hu_points)))

    gdf_hu_points = gdf_hu_points.to_crs(epsg=subareas_epsg) # project to subarea crs
    sjoin_gdf = gpd.sjoin(gdf_hu_points, gdf_subareas_aggr, op='within') # spatial join

    # count number of Gebäude per subarea (hu)
    count_sjoin_gdf = sjoin_gdf['index_right'].value_counts()
    gdf_subareas['alle_Geb_sum_ALKIS'] = gdf_subareas.index.map(count_sjoin_gdf)
    # count number of Wohngebäude per subarea (hu with flags zensus = 1)
    count_sjoin_gdf = sjoin_gdf.loc[sjoin_gdf['zensus']==1]['index_right'].value_counts()
    gdf_subareas['beheizte_WonGeb_sum_ALKIS'] = gdf_subareas.index.map(count_sjoin_gdf)
    # count number of beheizte Nichtwohngebäude per subarea (hu with flags zensus = 1, alt_rel = 0)
    count_sjoin_gdf = sjoin_gdf.loc[(sjoin_gdf['zensus']==1) & (sjoin_gdf['alt_rel']==0)]['index_right'].value_counts()
    gdf_subareas['beheizte_NichtWohnGeb_sum_ALKIS'] = gdf_subareas.index.map(count_sjoin_gdf)
    # count number of unbeheizte Gebäude per subarea (hu with flags zensus = 0, alt_rel = 0)
    count_sjoin_gdf = sjoin_gdf.loc[(sjoin_gdf['zensus']==0) & (sjoin_gdf['alt_rel']==0)]['index_right'].value_counts()
    gdf_subareas['unbeheizte_Geb_sum_ALKIS'] = gdf_subareas.index.map(count_sjoin_gdf)
    for merkmal in key_hu_merkmale:
        for merkmals_auspraegung in merkmals_auspraegungen_dict[merkmal]:
            sum_sjoin_gdf_wb = sjoin_gdf.groupby('index_right')[merkmals_auspraegung].sum() # number of Wohngebäude with Merkmalsauasprägung in subareas
            gdf_subareas_aggr[merkmals_auspraegung] = gdf_subareas_aggr.index.map(sum_sjoin_gdf_wb)

    # b) Raumwärmebedarfsmodell LANUV
    # -------------------------------
    # check for columns with area information, if not available calculate area and add column (not needed for Baubloecke Wuppertal)
    if 'area' in gdf_subareas_aggr.columns:
        gdf_subareas_aggr = gdf_subareas_aggr.rename(columns={'area':'FLAECHE'})
    elif 'AREA' in gdf_subareas_aggr.columns:
        gdf_subareas_aggr = gdf_subareas_aggr.rename(columns={'AREA':'FLAECHE'})
    if 'FLAECHE' not in gdf_subareas_aggr.columns:
        gdf_subareas_aggr['FLAECHE'] = 0
        gdf_subareas_aggr['FLAECHE'] = gdf_subareas_aggr['geometry'].area

    # read RWB modell LANUV into geodataframe
    gdf_subareas_aggr['Geb_sum_LANUV'] = 0                      # Gebäudeanzahl in LANUV dataset
    gdf_subareas_aggr['WBabsMWh/a_whole_subarea'] = 0           # Wärmebedarf absolut in MWh/a, RWB uses kWh/a          # makes kind of sense, but also not comparable if subarea have different sizes
    gdf_subareas_aggr['WB_kWh/m2a_per_subarea'] = 0             # Wärmebedarf spezif. in kWh/m2a, RWB uses kWh/m2a      # doesn't make sense with not heated buildings

    gdf_rwb_hu_centroids = gdf_rwb_hu.copy()
    gdf_rwb_hu_centroids['geometry'] = gdf_rwb_hu_centroids.centroid
    gdf_rwb_hu_centroids = gdf_rwb_hu_centroids.to_crs(epsg=subareas_epsg) # project to subarea crs

    if 'index_left' in gdf_rwb_hu_centroids.columns:
        gdf_rwb_hu_centroids.drop('index_left', axis=1, inplace=True)
    if 'index_right' in gdf_rwb_hu_centroids.columns:
        gdf_rwb_hu_centroids.drop('index_right', axis=1, inplace=True)
    if 'index_left' in gdf_subareas_aggr.columns:
        gdf_subareas_aggr.drop('index_left', axis=1, inplace=True)
    if 'index_right' in gdf_subareas_aggr.columns:
        gdf_subareas_aggr.drop('index_right', axis=1, inplace=True)

    sjoin_gdf = gpd.sjoin(gdf_rwb_hu_centroids, gdf_subareas_aggr, op='within') # spatial join

    # count number of Gebäude per subarea (hu)
    count_sjoin_gdf = sjoin_gdf['index_right'].value_counts()
    gdf_subareas_aggr['Geb_sum_LANUV'] = gdf_subareas_aggr.index.map(count_sjoin_gdf)
    # sum up Wärmebedarf absolut in GWh/a, RWB uses kWh/a
    sum_sjoin_gdf = sjoin_gdf.groupby('index_right')['WB_HU'].sum()
    gdf_subareas_aggr['WBabsMWh/a_whole_subarea'] = gdf_subareas_aggr.index.map(sum_sjoin_gdf)
    # spezifischer Wärmebedarf für Subarea
    gdf_subareas_aggr['WB_kWh/m2a_per_subarea'] = gdf_subareas_aggr['WBabsMWh/a_whole_subarea'] / gdf_subareas_aggr['FLAECHE']

    # combine hu geodataframe with subareas geodataframe (check for hu within subareas)
    print('number of subareas: '+str(len(gdf_subareas_aggr.index))+', number of hu: '+str(len(gdf_rwb_hu)))

    check_dir(fp_subareas_aggr_dir)
    gdf_subareas_aggr.to_file(fp_subareas_aggr_dir + 'test2.shp', driver='ESRI Shapefile')
    gdf_subareas_aggr.to_file(fp_subareas_aggr_dir + 'test2.gpkg', driver='GPKG')

    # c) EE_NRW
    # ---------
    gdf_subareas_aggr['Pw_sum_MW'] = 0          # installed heating power per subarea in MW, total                      # from EE NRW LANUV
    gdf_subareas_aggr['Pw_EE_MW'] = 0           # installed heating power per subarea in MW, renewable                  # from EE NRW LANUV
    gdf_subareas_aggr['Pw_conv_MW'] = 0         # installed heating power per subarea in MW, conventional               # from EE NRW LANUV

    # write to shapefile and to gpkg
    check_dir(fp_subareas_aggr_dir)
    print('write shapefile and gpkg to '+fp_subareas_aggr_dir)
    start_time = time.time()
    gdf_subareas_aggr.to_file(os.path.join(fp_subareas_aggr_dir,'subareas_aggr.shp'), driver='ESRI Shapefile')
    print('\tfinished writing shapefile in '+str(time.time()-start_time)+' s')
    start_time = time.time()
    gdf_subareas_aggr.to_file(os.path.join(fp_subareas_aggr_dir,'subareas_aggr.gpkg'), driver='GPKG')
    print('\tfinished writing gpkg in '+str(time.time()-start_time)+' s')

    print('took '+str(int((time.time()-start_time_dataset)/60))+'min '+str((time.time()-start_time_dataset)%60)+' s in total for assigning merkmale to hu')


###############################################################################

end_time_total = time.time()
print('total processing time: '+str(int((end_time_total-start_time_total)/60))+' min '+str(int((end_time_total-start_time_total)%60))+' sec')