# import libraries
import geopandas as gpd
import pandas as pd
from shapely.geometry import Point, Polygon
from shapely import wkt
import matplotlib.pyplot as plt
import numpy as np
import fiona
import os       # for file and folder paths
import sys      # for sys.path.append() and sys.exit()
import wget     # to download files from web
import time     # for processing time measurement
import xmltodict
import random   # for random age assignment to hausumringe
import pgeocode # to get geo coordinates from postal codes (plz)
from geopy.geocoders import Nominatim # if pgeocode doesn't work for some plz

###############################################################################
################################# NEW METHODS #################################
###############################################################################

# General functions
# -----------------

def check_dir(fp_dir, verbose=True, abort=True):
    """
    check if directory exists, if not try to create it
    optionally abort if directory cannot be created
    :param fp_dir: string, path to directory
    :param verbose: boolean, if True print messages
    :param abort: boolean, if True abort if directory cannot be created
    :return: None
    """
    if os.path.exists(fp_dir):
        if os.path.isdir(fp_dir):
            if verbose: print('directory '+fp_dir+' exists')
        if not os.path.isdir(fp_dir):
            if verbose: print('Error: File '+fp_dir+' exists, but is not a directory. Will abort.')
            if abort: sys.exit()
    else: # make directory
        if verbose: print('directory '+fp_dir+' does not exist, try to create it')
        try:
            os.mkdir(fp_dir)
        except:
            if verbose: print('did not work, will abort')
            if abort: sys.exit()
        if os.path.isdir(fp_dir):
            if verbose: print('directory '+fp_dir+' created')
    return None

# functions for DVG (digitale Verwaltungsgrenzen)
# -----------------------------------------------

def get_dvg_geodataframe(dvg_list, fp_dvg):
    """
    get geodataframe of digitale Verwealtungsgrenzen for a list of Gemeinden or AGS.

    Parameters:
    ----------
    dvg_list: list
        list contains Gemeindenamen or AGS (Amtliche Gemeindeschlüssel) as strings
        Remark: mixed lists won't work e.g. ['05124000', 'Solingen']
    fp_dvg: string
        filepath to shapefile with digitale Verwaltungsgrenzen of all Gemeinden

    Returns:
    -------
    geopandas GeoDataFrame
        geodataframe of all Verwaltungsgebiete cropped to the searched ones
        each Verwaltungsgebiet is a single entry in geodataframe
    """
# TODO: Errorcheck!


    if dvg_list[0].isdigit():
        # check if values in column with AGS (KN) match elements of argument list
        return gpd.read_file(fp_dvg).loc[gpd.read_file(fp_dvg)['KN'].isin(dvg_list)]
    else:
        # check if values in column with Names (GN) match elements of argument list
        return gpd.read_file(fp_dvg).loc[gpd.read_file(fp_dvg)['GN'].isin(dvg_list)]

#-----------------------------------------------------------------------------#

def get_gridcell_id_from_point(point,size='100m'):
    """
    Returns INSPIRE-grid cell ID for given point and cell size
    Attention: Convert point coordinates to EPSG:3035 before usage!

    Example:
    gdf['Cell_ID] = gdf_hu['Centroid'].to_crs(epsg=3035).apply(lambda point: get_gridcell_id_from_point(point))

    :param point: shapely.geometry.point.Point (EPSG:3035)
    :param size: str, allowed values: '100km', '10km', '1km', '100m'
    :return: str, INSPIRE-grid cell ID e.g. '100mN31153E41077' (EPSG:3035)
    """
    # allowed values for size (cell size)
    sizes = ['100m', '1km', '10km', '100km']

    # error handling
    if size not in sizes:
        print('Error: Wrong size! Accepted values: 100km, 10km, 1km, 100m')
        return []

    # get number of digits to cut from cell coordinates for naming
    # INSPIRE cell-code: 100m:5dig, 1km:4dig, 10km:3dig, 100km:2dig
    dig = sizes.index(size) + 2

    return size + 'N' + str(int(point.y))[:-dig] + 'E' + str(int(point.x))[:-dig]

#-----------------------------------------------------------------------------#

def get_gdf_spatial_extent_epsg3035(gdf):
    """
    get spatial extents and return as gdf with rectangle as geometry
    output gdf is in epsg:3035
    :param gdf: geopandas gdf
    :return: gdf_spatial_extent: geopandas gdf
    """
    minx, miny, maxx, maxy = gdf.to_crs(epsg=3035).total_bounds
    spatial_extent_epsg3035 = Polygon([(minx, miny), (minx, maxy), (maxx, maxy), (maxx, miny)])
    print('spatial_extent_epsg3035.bounds=', spatial_extent_epsg3035.bounds)
    gdf_spatial_extent = gpd.GeoDataFrame(index=[0], geometry=[spatial_extent_epsg3035])
    gdf_spatial_extent.set_crs(epsg=3035, inplace=True)
    return gdf_spatial_extent

#-----------------------------------------------------------------------------#

def  get_gdf_within_spatial_extent(gdf, gdf_spatial_extent):
    """
    get gdf with all dvg within spatial extent
    :param gdf_dvg_all: geopandas gdf, all dvg
    :param gdf_spatial_extent: geopandas gdf, spatial extent
    :return: gdf_dvg_within_spatial_extent: geopandas gdf
    """
    gdf_orig_crs_as_epsg = gdf.crs.to_epsg()
    gdf = gdf.to_crs(epsg=gdf_spatial_extent.crs.to_epsg()) # project to same crs
    gdf_within_spatial_extent = gdf.sjoin(gdf_spatial_extent, how='inner', op='intersects')
    gdf_within_spatial_extent = gdf_within_spatial_extent.to_crs(epsg=gdf_orig_crs_as_epsg) # project back to orig. crs
    return gdf_within_spatial_extent

#-----------------------------------------------------------------------------#

def get_celllist_zensus(gdf, size):
    """
# get a list with INSPIRE-compatible cell-names of certain size
# which cover the geometry of a given geodataframe as rectangle
# 
# INPUT
# gdf is a GeoDataframe (geopandas)
# size is a string with one of the following values: '100km', '10km', '1km', '100m'
#
# Sketch to draw rectangular map with grid cells for a given city
#
# legend: 
# cells outside city map: [ ]
# cells within city map: [X],[Y],[c],[o]
# cells within city map defining the city bounds: [X], [Y]
# cells within city map including some city area: [c]
# cells within city map including none city area: [o]
# 
# minx, maxx, miny, maxy: bounds of city with cut digits

# ..y^..minx..............maxx+1col.......
# ...|[ ]|[ ] [ ] [ ] [ ] [ ]|[ ] [ ].....
# ..5+...|...................|........5...
# ...|[ ]|[o] [c] [o] [Y] [o]|[o] [ ]+1row
# ..4+...|-------------------|--------maxy
# ...|[ ]|[X] [c] [c] [c] [c]|[X] [ ].....
# ..3+...|...................|........3...
# ...|[ ]|[c] [c] [c] [c] [c]|[c] [ ].....
# ..2+...|...................|........2...
# ...|[ ]|[o] [o] [Y] [o] [o]|[o] [ ].....
# ..1+...|-------------------|--------miny
# ...|[ ]|[ ] [ ] [ ] [ ] [ ]|[ ] [ ].....
#----+---+---+---+---+---+---+---+---+--->
# ..0|...1...2...3...4...5...6...7...8...x

# example calculation from sketch: 
# dx = (maxx)-(minx)+1 = (6)-(1)+1 = 6 
# dy = (maxy)-(miny)+1 = (4)-(1)+1 = 4
# makes 24 cells
    """
    # allowed values for size (cell size)
    sizes = ['100m', '1km', '10km', '100km']

    # error handling
    if size not in sizes:
        print('Error: Wrong size! Accepted values: 100km, 10km, 1km, 100m')
        return []

    celllist = []
    
    # convert to INSPIRE-compatible CRS EPSG:3035 (ETRS89 LAEA)
    gdf = gdf.to_crs(epsg=3035)

    # bounds of all geodataframe elements combined
    minx_full, maxx_full = min(gdf.bounds['minx']), max(gdf.bounds['maxx'])
    miny_full, maxy_full = min(gdf.bounds['miny']), max(gdf.bounds['maxy'])

    # get number of digits to cut from cell coordinates for naming
    # INSPIRE cell-code: 100m:2dig, 1km:3dig, 10km:4dig, 100km:5dig
    dig = sizes.index(size) + 2
        
    # bounds of all geodataframe elements combined with cut digits
    minx, maxx = int(str(int(minx_full))[:-dig]), int(str(int(maxx_full))[:-dig])
    miny, maxy = int(str(int(miny_full))[:-dig]), int(str(int(maxy_full))[:-dig])
        
    # number of cells in x and y direction (see sketch above)
    dx, dy = maxx - minx + 1, maxy - miny + 1
    
    # cell coordinates as ranges (digits cut according to size)
    xrange = range(minx, maxx + 1, 1)
    yrange = range(miny, maxy + 1, 1)
    
    # print some outputs
    print('xrange=',xrange,'yrange=',yrange)
    print('dx = ', dx,' Number of Cells in x-direction')
    print('dy = ', dy, 'Number of Cells in y-direction')
    print('dx*dy=', dx*dy, 'Number of Cells in rectangle between bounds\n')

    print('city bounds with cut digits')
    print('minx =', minx,'\tmaxx =', maxx)
    print('miny =', miny,'\tmaxy =', maxy)    
    
    for y in yrange:
        for x in xrange:
            celllist.append(size + 'N' + str(y) + 'E' + str(x))

    # print some more output
    print(celllist[0], 'Cell name with minx and miny')
    print(celllist[dx-1], 'Cell name with maxx and miny')
    print(celllist[dx*dy-dx], 'Cell name with minx and maxy')
    print(celllist[dx*dy-1], 'cell name with maxx and maxy\n')

    return celllist

#-----------------------------------------------------------------------------#

def get_celllist_rp(gdf):
    """
    get list of cell-names for Regionalpläne (epsg:25832) which
    cover the spatial extent of a given geodataframe as rectangle

    cell-names are e.g. rp_32280_5624_8_nw
    with numbers as cell coordinates in kilometers epsg:25832
    x-coordinate is predated by '32' for whatever reason
    8 stands for 8km x 8km cell size

    tested with: https://www.opengeodata.nrw.de/produkte/infrastruktur_bauen_wohnen/regionalplan/rp_tiff/

    :param gdf: geopandas geodataframe
    :param size: string
    :return: celllist_rp: list of cell-names
    """
    minx, miny, maxx, maxy = gdf.to_crs(epsg=25832).total_bounds
    minx, miny, maxx, maxy = int(minx/1000), int(miny/1000), int(maxx/1000), int(maxy/1000)
    minx, miny, maxx, maxy = int(minx/8)*8, int(miny/8)*8, int(maxx/8)*8, int(maxy/8)*8
    dx, dy = maxx - minx + 1, maxy - miny + 1
    xrange = range(minx, maxx + 1, 8)
    yrange = range(miny, maxy + 1, 8)
    celllist_rp = []

    for y in yrange:
        for x in xrange:
            celllist_rp.append('rp_32' + str(x) + '_' + str(y) + '_8_nw')
    return celllist_rp

#-----------------------------------------------------------------------------#

def get_celllist_abk(gdf,colour=True):
    """
    get list of cell-names for Amtliche Basiskarten (epsg:25832)
    either for colored tiles or black/white tiles which
    cover the spatial extent of a given geodataframe as rectangle

    cell-names are e.g. abk_32280_5657_1 (color)
    with numbers as cell coordinates in kilometers epsg:25832
    x-coordinate is predated by '32' for whatever reason
    1 stands for 1km x 1km cell size

    :param gdf: geopandas geodataframe
    :param colour: boolean, if True colour cell-names, else black/white
    :param size: string
    :return: celllist_abk: list of cell-names (colour or black/white)
    """

    minx, miny, maxx, maxy = gdf.to_crs(epsg=25832).total_bounds
    minx, miny, maxx, maxy = int(minx/1000), int(miny/1000), int(maxx/1000), int(maxy/1000)
    dx, dy = maxx - minx + 1, maxy - miny + 1
    xrange = range(minx, maxx + 1, 1)
    yrange = range(miny, maxy + 1, 1)
    celllist_abk = []

    for y in yrange:
        for x in xrange:
            if colour: celllist_abk.append('abk_32' + str(x) + '_' + str(y) + '_1')
            else: celllist_abk.append('abk_sw_32' + str(x) + '_' + str(y) + '_1')
    return celllist_abk

#-----------------------------------------------------------------------------#

def download_tiff_tiles(url_abk_dir, fp_abk_dir, celllist_abk, verbose=True):
    if verbose: print('\nstart downloading tiff files from ' + url_abk_dir)
    if verbose: print('\tskip files that already exist in ' + os.path.join(fp_abk_dir, 'farbe'))
    if verbose: print('\t' + str(len(celllist_abk)) + ' files to download/check...')
    os.chdir(fp_abk_dir)  # change current directory to download directory
    i_skip, i_download = 0, 0
    start_time = time.time()
    for cellname in celllist_abk:
        if (i_skip + i_download) % 100 < 1 and verbose:
            print('\t\twip: already downloaded ' + str(i_download) + ' files, skipped ' + str(i_skip) + ' files')
        if os.path.isfile(os.path.join(fp_abk_dir, cellname + '.tif')):
            i_skip += 1
            continue
        else:
            wget.download(os.path.join(url_abk_dir, cellname + '.tif'))
            i_download += 1
    if verbose:
        print('\tfinished  in ' + str(time.time() - start_time) + ' seconds:')
        print('\ndownloaded ' + str(i_download) + ' files\n skipped ' + str(i_skip) + ' files')
    return None

################################################################################

# functions for OSM and EE_NRW data
# ---------------------------------

def get_gdf_dict_layerwise(fp):
    """
    read layers from geodatabase or shape file into geodataframes

    :param fp: string, filepath to geodatabase or shape file
    :return: dict {layername1: gdf1, layername2: gdf2, ...}
    :stout: prints layer name and processing time
    """

    layers = fiona.listlayers(fp)
    gdf_dict = {}

    print('layers to read: ', layers)
    for layer in layers:
        print('reading layer: ' + layer + ' into gdf_dict[\'' + layer + '\']...')
        start = time.time()
        if 'shp' in fp[-4:]:
            gdf_dict[layer] = gpd.read_file(fp, layer=layer)
        if 'gdb' in fp[-4:]:
            gdf_dict[layer] = gpd.read_file(fp, driver='OpenFileGDB', layer=layer)
        end = time.time()
        print('done in ' + str(end - start) + ' seconds.')
    return gdf_dict

#-----------------------------------------------------------------------------#

def write_gdf_dict_to_file(gdf_dict,fp,type='shp'):
    """
    write all layers in gdf_dict to directory fp (shp or gdb)

    :param gdf_dict: dict = {layername1: gdf1, layername2: gdf2, ...}
    :param fp: str = file path
    :param type: str = file type (shp, gdb, ...)
    :return: None

    works for data types: shp, gdb (not tested for other types)

    Example:
    --------
    input:      fp = '.../data/example.shp/' or fp = '.../data/example.shp'
    condition:  os.path.isdir(fp) == True
    output:     '.../data/example.shp/layername1.shp',
                '.../data/example.shp/layername2.shp', ...

    """
    # Error handling
    if not os.path.isdir(fp):
        print('Error: fp is not a directory')
        return None

    if type not in fp[-4:]:
        print('Warning: file type does not match fp extension e.g. <dir-name>.shp')
        print('will use file type: '+type)

    # add '/' to end of fp if not present
    if fp[:-1] != '/' and fp[:-1] != '\\':
        fp = fp + '/'

    # write all layers in gdf_dict to directory fp
    for layer in gdf_dict.keys():
        print('write layer '+layer+' to '+fp+layer+'.shp')
        start = time.time()

        # check for file type
        if type == 'shp':
            gdf_dict[layer].to_file(fp+layer+'.shp',driver='ESRI Shapefile')
        if type == 'gdb':
            gdf_dict[layer].to_file(fp+layer,driver='FileGDB')
        else:
            print('file type not supported')
            gdf_dict[layer].to_file(fp+layer+'_test')

        end = time.time()
        print('done in ' + str(end - start) + ' seconds.')
    return None

################################################################################

# functions for Hausumringe ALKIS
# -------------------------------

def get_hu_gfk_analysis_df(gdf_hu, hu_dict_df,
                           key_gfk_code='GFK', key_gfk_text='GFK_text',
                           key_hu_gfk_code='GFK', key_hu_zensus='zensus', key_hu_alt_rel='alt_rel',
                           key_hu_dict_gfk_code='gfk_code', key_hu_dict_gfk_text='gfk_text',
                           key_hu_dict_zensus='zensus', key_hu_dict_alt_rel='alt_rel'):
    """
    get df with all gfk codes and texts and number of hu per gfk code

    :param gdf_hu: geopandas GeoDataFrame with hu (must contain columns key_hu_<...> from parameter list)
    :param hu_dict_df: dict with list of gfk codes and list of gfk texts

    :param key_gfk_code: key (column name) for returned df
    :param key_gfk_text:  key (column name) for returned df
    :param key_hu_zensus: key (column name) for returned df, has to equal key in gdf_hu!
    :param key_hu_alt_rel: key (column name) for returned df, has to equal key in gdf_hu!
    :param key_hu_dict_gfk_code: key for hu_dict_df to get gfk codes
    :param key_hu_dict_gfk_text: key for hu_dict_df to get gfk texts
    :param key_hu_dict_zensus: key for hu_dict_df to get gfk zensus flags
    :param key_hu_dict_alt_rel: key for hu_dict_df to get gfk alt_rel flags
    :return: pandas DataFrame
    """
    hu_gfk_analysis_df = pd.DataFrame(columns=[key_gfk_code, key_gfk_text, key_hu_zensus, key_hu_alt_rel, 'n_hu'])
    hu_gfk_analysis_df[key_gfk_code] = list(hu_dict_df[key_hu_dict_gfk_code])
    hu_gfk_analysis_df[key_gfk_text] = list(hu_dict_df[key_hu_dict_gfk_text])
    hu_gfk_analysis_df[key_hu_zensus] = list(hu_dict_df[key_hu_dict_zensus]) # same key as in gdf_hu
    hu_gfk_analysis_df[key_hu_alt_rel] = list(hu_dict_df[key_hu_dict_alt_rel]) # same key as in gdf_hu
    hu_gfk_analysis_df['n_hu'] = 0
    # fill in number of hu per gfk_code
    for i, gfk_code in enumerate(list(hu_dict_df[key_hu_dict_gfk_code])):
        hu_gfk_analysis_df.loc[i,'n_hu'] = len(gdf_hu.loc[gdf_hu[key_hu_gfk_code] == gfk_code])
        return hu_gfk_analysis_df

#-----------------------------------------------------------------------------#
def get_hu_gfk_merkmal_analysis_df(gdf_hu, hu_dict_df, key_hu_merkmale,
                                   merkmals_auspraegungen_dict, merkmal_unbekannt,
                                   detailed=False,
                                   key_gfk_code='GFK', key_gfk_text='GFK_text',
                                   key_hu_gfk_code='GFK', key_hu_zensus='zensus', key_hu_alt_rel='alt_rel',
                                   key_hu_dict_gfk_code='gfk_code', key_hu_dict_gfk_text='gfk_text',
                                   key_hu_dict_zensus='zensus', key_hu_dict_alt_rel='alt_rel'):
    """
    get df with all gfk codes and texts and number of hu per gfk code
    uses get_hu_gfk_analysis_df() to get this base df and adds extra
    columns for number of hu with alloted merkmale (absolute and relative)
    optionally adds extra columns for number of hu with specific auspraegung
    of each merkmal (absolute and relative) if detailed=True

    :param gdf_hu: geopandas GeoDataFrame with hu (must contain columns key_hu_<...> from parameter list)
    :param hu_dict_df: dict with list of gfk codes and list of gfk texts
    :param key_hu_merkmale: list of strings (merkmale alloted to hu)
                            (must be same as keys in gdf_hu used for mermal related columns)
    :param merkmals_auspraegungen_dict: dict with list of strings (auspraegungen of merkmale)
                            e.g. {'merkmal1': ['auspr1', 'auspr2', 'auspr3'], 'merkmal2': ['auspr1', 'auspr2']}
                            e.g. {'BAUJAHR_MZ': ['BauVor1918', 'Bau1918_47',...], 'HEIZTYP': ['Etagenheiz', ...]}
    :param merkmal_unbekannt: string to identify if merkmals auspraegung could not be alloted in any hu
                            #todo alternatively check if value is not in merkmals_auspraegungen_dict
                            #that'd be more robust, if the default values in the data change
    :param detailed: bool, if True, adds extra columns for number of hu with alloted merkmal-auspraegungen
                            usage is not recommended, not really useful and slower, testing only

    :param key_gfk_code: key (column name) for returned df
    :param key_gfk_text:  key (column name) for returned df
    :param key_hu_zensus: key (column name) for returned df, has to equal key in gdf_hu!
    :param key_hu_alt_rel: key (column name) for returned df, has to equal key in gdf_hu!
    :param key_hu_dict_gfk_code: key for hu_dict_df to get gfk codes
    :param key_hu_dict_gfk_text: key for hu_dict_df to get gfk texts
    :param key_hu_dict_zensus: key for hu_dict_df to get gfk zensus flags
    :param key_hu_dict_alt_rel: key for hu_dict_df to get gfk alt_rel flags
    :return: pandas DataFrame

    example usage:
    hu_gfk_merkmal_analysis_df = get_hu_gfk_merkmal_analysis_df(gdf_hu, hu_dict_df, key_hu_merkmale,
                                                               merkmals_auspraegungen_dict, merkmal_unbekannt)

    outputs df like this (detailed = False):
    gfk_code        | gfk_text         | zensus | alt_rel | n_hu | with_m_1 | perc_with_m_1 | with_m_2 | ...
    '31001_1000'    | 'WohngebÃ¤ude'   | 1      | 1       | 100  | 32       | 32            | 36       | ...
    '31001_1010'    | 'Wohnhaus'       | 1      | 1       | 150  | 50       | 33.3333333    | ...      | ...
    ...             | ...              | ...    | ...     | ...  | ...      | ...           | ...      | ...
    with key_hu_merkmale = ['m_1', 'm_2', ...] e.g. ['BAUJAHR_MZ', 'HEIZTYP', ...]

    outputs df like this (detailed = True):
    gfk_code        | gfk_text         | zensus | alt_rel | n_hu | with_m_1 | perc_with_m_1 | n_hu_m1_a1 | perc_m1_a1 |...
    '31001_1000'    | 'WohngebÃ¤ude'   | 1      | 1       | 100  | 32       | 32            | 16         | 50              | ...
    '31001_1010'    | 'Wohnhaus'       | 1      | 1       | 150  | 50       | 33.3333333    | 4          | 12.5            | ...
    ...             | ...              | ...    | ...     | ...  | ...      | ...           | ...        | ...             | ...
    with key_hu_merkmale = ['m_1', ...] e.g. ['BAUJAHR_MZ', ...]
    with merkmals_auspraegungen_dict = {'m_1': ['m1_a1', 'm1_a2', ...], ...}
                                  e.g. {'BAUJAHR_MZ': ['BauVor1918', 'Bau1918-1947', ...], ...}

    Note: percentages with merkmal are calculated with respect to number of hu with gfk code in total
    Note: percentages with merkmal-auspraegung are calculated with respect to number of hu with gfk code with merkmal(!) in total
    Note: Default percentages are 999 if otherwise division by zero would occur (no hu with gfk code or with gfk code and merkmal)
    """
    # get base analysis df with gfk codes & texts, zensus & alt_rel flags and n_hu as columns
    hu_gfk_merkmal_analysis_df = get_hu_gfk_analysis_df(gdf_hu, hu_dict_df,
                                                        key_gfk_code=key_gfk_code,
                                                        key_gfk_text=key_gfk_text,
                                                        key_hu_gfk_code=key_hu_gfk_code,
                                                        key_hu_zensus=key_hu_zensus,
                                                        key_hu_alt_rel=key_hu_alt_rel,
                                                        key_hu_dict_gfk_code=key_hu_dict_gfk_code,
                                                        key_hu_dict_gfk_text=key_hu_dict_gfk_text,
                                                        key_hu_dict_zensus=key_hu_dict_zensus,
                                                        key_hu_dict_alt_rel=key_hu_dict_alt_rel)
    # add extra columns for each merkmal with default values
    for key_hu_merkmal in key_hu_merkmale:
        hu_gfk_merkmal_analysis_df['with_'+key_hu_merkmal] = 0         # total number of hu with merkmal
        hu_gfk_merkmal_analysis_df['perc_with_'+key_hu_merkmal] = 0    # percentage of hu with merkmal
        if detailed:
            for merkmal_auspraegung in merkmals_auspraegungen_dict[key_hu_merkmal]:
                hu_gfk_merkmal_analysis_df['n_hu_'+merkmal_auspraegung] = 0
            for merkmal_auspraegung in merkmals_auspraegungen_dict[key_hu_merkmal]:
                hu_gfk_merkmal_analysis_df['perc_'+merkmal_auspraegung] = 0
    # fill in values to extra columns
    # note: iterate over gfk_code not gfk_text, some codes have the same text value!!! (Umformer) implemented *sigh*
    for i, gfk_code in enumerate(list(hu_dict_df[key_hu_dict_gfk_code])):
        n_hu = hu_gfk_merkmal_analysis_df.loc[i,'n_hu']
        for key_hu_merkmal in key_hu_merkmale:
            n_hu_with_merkmal = len(gdf_hu.loc[(gdf_hu[key_hu_gfk_code] == gfk_code) & (gdf_hu[key_hu_merkmal] != merkmal_unbekannt)])
            hu_gfk_merkmal_analysis_df.loc[i,'with_'+key_hu_merkmal] = n_hu_with_merkmal
            if n_hu > 0: hu_gfk_merkmal_analysis_df.loc[i,'perc_with_'+key_hu_merkmal] = 100*n_hu_with_merkmal/n_hu
            else: hu_gfk_merkmal_analysis_df.loc[i,'perc_with_'+key_hu_merkmal] = 999
            if detailed:
                for merkmal_auspraegung in merkmals_auspraegungen_dict[key_hu_merkmal]:
                    n_hu_with_merkmal_auspraegung = len(gdf_hu.loc[(gdf_hu[key_hu_gfk_code] == gfk_code) & (gdf_hu[key_hu_merkmal] == merkmal_auspraegung)])
                    hu_gfk_merkmal_analysis_df.loc[i,'n_hu_'+merkmal_auspraegung] = n_hu_with_merkmal_auspraegung
                    if n_hu_with_merkmal > 0: hu_gfk_merkmal_analysis_df.loc[i,'perc_'+merkmal_auspraegung] = 100*n_hu_with_merkmal_auspraegung/n_hu_with_merkmal
                    else: hu_gfk_merkmal_analysis_df.loc[i,'perc_'+merkmal_auspraegung] = 999
    return hu_gfk_merkmal_analysis_df
#-----------------------------------------------------------------------------#

def get_hu_merk_auspraeg_list_in_cell_ac(geb_df,geb_key,n_hu,cell,merkmals_auspraegungen,merkmal_unbekannt):
    """
    get list of merkmals_auspraegungen in cell (case a,c)
    needed for allotment to hausumringe (hu) in cell
    length of list has to be equal to number of hu in cell

    s. also get_hu_merk_auspraeg_list_in_cell_b()

    special case:   0) no gebäude with recorded merkmal in cell
    -> strategy:        skip cell

    regular case:   a) same number of gebäude with recorded merkmal
                            as hu counted in zensus within cell
    -> strategy:        ai) allot merkmals_auspraegungen to hu

    special case:   b) more gebäude with recorded merkmal
                            than hu counted in zensus within cell
    -> strategy:        bi) regard enough random values as to 2 instead of 3 in cell
                        bii) if still needed, regard enough other randomly chosen values
                            as one lower, repeat bii) if necessary

    special case:   c) less gebäude with recorded merkmal
                            than hu counted in zensus within cell
    -> strategy:        ci) assign merkmals_auspraegungen to hu
                            and leave out some hu ('Unbekannt')
                            Note: don't regard area or OI of hu,
                                  leave out last hu's in cell

    :param geb_df: pandas dataframe, must contain zensus gebaeude data
                    formatted as in zensusdata.df s. class zensusdata()
    :param geb_key: str, key of cellid in geb_df
    :param n_hu: int, number of hu in cell
    :param cell: str, cellid
    :param merkmals_auspraegungen: list of str, e.g. ['BauVor1919', ...]
    :param merkmal_unbekannt: str, e.g. 'Unbekannt'
    :return: list of str, hu_altersklassen in cell e.g. ['BauVor1919','BauVor1919','Bau1979_86', ...]
    """
    # create list with all merkmals_auspraegungen in cell as strings e.g. ['BauVor1919','BauVor1919','Bau1979_86', ...]
    list_zensus_merk_ausp_count_in_cell_obj = geb_df.loc[geb_df[geb_key] == cell][merkmals_auspraegungen].values[0]
    list_zensus_merk_ausp_count = [int(i) for i in list_zensus_merk_ausp_count_in_cell_obj] # unused in case a
    list_hu_merk_ausp_in_cell = []
    for i, val in enumerate(list_zensus_merk_ausp_count):
        if val != 0:
            for n in range(val):
                list_hu_merk_ausp_in_cell.append(merkmals_auspraegungen[i])
    # in case of c) fill up list with 'Unbekannt' until length of list equals number of hu in cell
    for i in range(n_hu - len(list_hu_merk_ausp_in_cell)):
        list_hu_merk_ausp_in_cell.append(merkmal_unbekannt)
    return list_hu_merk_ausp_in_cell

#-----------------------------------------------------------------------------#

def get_hu_merk_auspraeg_list_in_cell_b(geb_df, geb_key, n_hu, cell, merkmals_auspraegungen, merkmal_unbekannt):
    """
    get list of merkmals_auspraegungen in cell (case b)
    needed for allotment to hausumringe (hu) in cell
    length of list has to be equal to number of hu in cell

    s. also get_hu_merk_auspraeg_list_in_cell_ac()

    special case:   0) no gebäude with recorded merkmal in cell
    -> strategy:        skip cell

    regular case:   a) same number of gebäude with recorded merkmal
                            as hu counted in zensus within cell
    -> strategy:        ai) allot merkmals_auspraegungen to hu

    special case:   b) more gebäude with recorded merkmal
                            than hu counted in zensus within cell
    -> strategy:        bi) regard enough random values as to 2 instead of 3 in cell
                        bii) if still needed, regard enough other randomly chosen values
                            as one lower, repeat bii) if necessary

    special case:   c) less gebäude with recorded merkmal
                            than hu counted in zensus within cell
    -> strategy:        ci) assign merkmals_auspraegungen to hu
                            and leave out some hu ('Unbekannt')
                            Note: don't regard area or OI of hu,
                                  leave out last hu's in cell

    :param geb_df: pandas dataframe, must contain zensus gebaeude data
                    formatted as in zensusdata.df s. class zensusdata()
    :param geb_key: str, key of cellid in geb_df
    :param n_hu: int, number of hu in cell
    :param cell: str, cellid
    :param merkmals_auspraegungen: list of str, e.g. ['BauVor1919', 'Bau1919_48', 'Bau1948_78' ...]
    :param merkmal_unbekannt: str, e.g. 'Unbekannt' # not used, only needed for case c)
    :return: list_hu_merk_ausp_in_cell: list of str, e.g. ['BauVor1919','BauVor1919','Bau1979_86', ...]
    """
    diff = sum(geb_df.loc[geb_df[geb_key] == cell][merkmals_auspraegungen].astype(int).values[0]) - n_hu

    # create list with all merkmals_auspraegungen in cell as strings e.g. ['BauVor1919','BauVor1919','Bau1979_86', ...]
    list_zensus_merk_ausp_count_obj = geb_df.loc[geb_df[geb_key] == cell][merkmals_auspraegungen].values[0]
    list_zensus_merk_ausp_count = [int(i) for i in list_zensus_merk_ausp_count_obj]

    # special case preperation: reduce number of altersklassen in list to number of hu in cell
    # i) set enough random values of 3 as 2 if possible otherwise regard all values of 3 as 2
    idx_val_3 = [i for i in range(len(list_zensus_merk_ausp_count)) if list_zensus_merk_ausp_count[i] == 3]
    if len(idx_val_3) > diff and len(idx_val_3) > 0: idx_val_3 = random.sample(idx_val_3, diff)
    for i in idx_val_3:
        list_zensus_merk_ausp_count[i] = 2
        diff -= 1

    # ii) if needed: decrease (random sample or all) values of >2 by 1, repeat if still needed and possible
    idx_val_greater_2 = [i for i in range(len(list_zensus_merk_ausp_count)) if list_zensus_merk_ausp_count[i] > 2]
    while diff > 0 and len(idx_val_greater_2) > 0:
        if len(idx_val_greater_2) > diff: idx_val_greater_2 = random.sample(idx_val_greater_2, diff)
        for i in idx_val_greater_2:
            list_zensus_merk_ausp_count[i] -= 1
            diff -= 1
        idx_val_greater_2 = [i for i in range(len(list_zensus_merk_ausp_count)) if list_zensus_merk_ausp_count[i] > 2]

    # iii) if needed: decrease (random sample or all) values of >2 by 1, repeat if still needed and possible
    idx_val_greater_0 = [i for i in range(len(list_zensus_merk_ausp_count)) if list_zensus_merk_ausp_count[i] > 0]
    while diff > 0 and len(idx_val_greater_0) > 0:
        if len(idx_val_greater_0) > diff: idx_val_greater_0 = random.sample(idx_val_greater_0, diff)
        for i in idx_val_greater_0:
            list_zensus_merk_ausp_count[i] -= 1
            diff -= 1
        idx_val_greater_0 = [i for i in range(len(list_zensus_merk_ausp_count)) if list_zensus_merk_ausp_count[i] > 0]

    # now continue like in a)
    list_hu_merk_ausp_in_cell = []
    for i, val in enumerate(list_zensus_merk_ausp_count):
        for n in range(val):
            list_hu_merk_ausp_in_cell.append(merkmals_auspraegungen[i])

    return list_hu_merk_ausp_in_cell

#-----------------------------------------------------------------------------#

def print_progress_hu_merkmal_assignment(counter, n_hu_cells, start_time):
    if counter % 1000 == 0 and counter != 0:
        print('\tassigned Merkmals-Ausprägungen to hu in ' + str(counter) + ' of ' + str(n_hu_cells) + ' cells')
    if counter % 5000 == 0 and counter != 0:
        print('took ' + str(int(time.time() - start_time)) + 's so far, ' +
              'estimated remaining time: ' + str(
            int((time.time() - start_time) * (n_hu_cells - counter) / counter)) + 's')

###############################################################################
################################# OLD METHODS #################################
###############################################################################

def add_geometry_to_df_eenrw_excel_abw_epsg4326(df_dict_eenrw_excel,key_abw,df_gvisys,gvisys_col_plz,gvisys_col_lon,gvisys_col_lat):
    """
    add geometry as points to df_eenrw_excel_abw in epsg:4326
    uses different approaches to get coordinates from plz or ort
    a) pgeocode with plz                (epsg:4326)
    b) df_gvisys with plz (own method)  (epsg:4326) (not needed)
    c) geopy with plz                   (epsg:4326)
    d) df_gvisys with ort (own method)  (epsg:4326) (not needed)
    default geometry is Point(0,0)      (epsg:4326)

    Note: #TODO remove b) and d) and gvisys related parameters
                to reduce dependencies or keep as backup

    :param df_dict_eenrw_excel: dict, from read_excel_eenrw()
    :param key_abw: str, key of df_dict_eenrw_excel to access df
    :param df_gvisys: pandas dataframe, from GV-ISys
    :param gvisys_col_plz: str, column number of plz in df_gvisys
    :param gvisys_col_lon: str, column number of lon in df_gvisys
    :param gvisys_col_lat: str, column number of lat in df_gvisys
    :return: df_eenrw_excel_abw['geometry']: pandas dataframe
    """
    # DEBUGGING NOTE: show columns['Plz','Ort','geometry'] of df_dict_eenrw_excel[key_abw] for specific plz with
    # df_dict_eenrw_excel[key_abw][df_dict_eenrw_excel[key_abw]['Plz'] == plz][['Plz','Ort','geometry']]
    df = df_dict_eenrw_excel[key_abw]
    df['geometry'] = Point(0, 0)    # default geometry is Point(0,0)
    lon, lat = np.nan, np.nan
    counter = -1                                    # for user feedback (progress)
    counter_pgeocode = 0                            # for user feedback (analysis) method a)
    counter_df_gvisys_plz = 0                       # for user feedback (analysis) method b)
    counter_geopy = 0                               # for user feedback (analysis) method c)
    counter_df_gvisys_ort = 0                       # for user feedback (analysis) method d)
    counter_no_coordinates = 0                      # for user feedback (analysis) no coordinates found
    geolocator = Nominatim(user_agent="my_request")
    pgeocode_postal_codes = list(pgeocode.Nominatim('de')._index_postal_codes()['postal_code'])  # strings

    # get coordinates of orts-mittelpunkte from plz or ort
    print('\tstart assigning coordinates of orts-mittelpunkte from plz for '+ str(len(df)) + ' entries in df')
    for plz in list(df['Plz'].unique()):
        counter += 1
        if counter % 100 == 0:
            print('\t\tcounter: ' + str(counter) + ' of ' + str(len(list(df['Plz'].unique())))+' unique PLZ in df used to assign coordinates to geometry')

        orte = df[df['Plz'] == plz]['Ort'].values
        orte = list(set(orte))  # remove duplicates
        ort = orte[0]  # first entry

        # method a) get coordinates from plz with pgeocode (wgs84, epsg:4326) if plz is in __index_postal_codes()
        if str(plz) in pgeocode_postal_codes:
            lon, lat = pgeocode.Nominatim('de').query_postal_code(plz)[['longitude', 'latitude']] # numpy.float64 or NaN
            counter_pgeocode += 1
            #print('\t\tplz = '+str(plz)+' used method a) pgeocode, orte = '+str(orte)) # works well&fast, too much stout

        # method b) try own method with plz and coordinates from gvisys
        if lon is np.nan or lat is np.nan:
            # exctract from gvisys dataframe with current plz
            df_gvisys = df_gvisys.loc[df_gvisys[gvisys_col_plz] == plz]
            lon, lat = _get_lon_lat_from_plz(plz, df_gvisys, gvisys_col_plz, gvisys_col_lon, gvisys_col_lat)  # string
            if lon is not np.nan and lat is not np.nan:
                counter_df_gvisys_plz += 1
                #print('\t\tplz = ' + str(plz) + ' used method b) gvisys (plz), orte = ' + str(orte)) # debugging

        # method c) second try to get coordinates from ort with geopy (wgs84, epsg:4326) # slow
        if lat is np.nan or lon is np.nan:
            lon, lat = geolocator.geocode(plz).longitude, geolocator.geocode(plz).latitude  # float64
            counter_geopy += 1
            #print('\t\tplz = ' + str(plz) + ' used method c) geopy (plz), orte = ' + str(orte)) # debugging

        # method d) own method with ort and coordinates from gvisys, problem are citys like hagen
        if lon is np.nan or lat is np.nan:
            lon, lat = _get_lon_lat_from_ort(ort, df_gvisys, gvisys_col_ort, gvisys_col_lon, gvisys_col_lat)
            counter_df_gvisys_ort += 1
            #print('plz = ' + str(plz) + ' used method d) gvisys (ort), orte = ' + str(orte)) # debugging

        # convert to float (own methods return string with german decimal seperator)
        if lon is not np.nan and type(lon) is str:
            lon = float(lon.replace(',', '.'))
        if lat is not np.nan and type(lat) is str:
            lat = float(lat.replace(',', '.'))

        # error message if no coordinates where found (skip row and keep default geometry value)
        if lat is np.nan or lon is np.nan:
            print('\tno coordinates found for plz ' + str(plz) + ' and ort ' + str(ort))
            counter_no_coordinates += 1
            continue

        # assign Points (epsg:4326) to dataframe
        Point4326 = Point(float(lon), float(lat))
        row_indexer = df.loc[df['Plz'] == plz].index.to_list()
        col_indexer = df.loc[df['Plz'] == plz].columns.get_loc('geometry')
        df.iloc[row_indexer, col_indexer] = Point4326

        # assign default values to lon and lat for next iteration
        lon, lat = np.nan, np.nan

    print('\tNumber of PLZ for which coordinates where derived by:')
    print('\t\tmethod a) (pgeocode plz): ' + str(counter_pgeocode))
    print('\t\tmethod b) (gvisys plz): ' + str(counter_df_gvisys_plz))
    print('\t\tmethod c) (geopy plz): ' + str(counter_geopy))
    print('\t\tmethod d) (gvisys ort): ' + str(counter_df_gvisys_ort))
    print('\tNumber of PLZ for which no coordinates where found: ' + str(counter_no_coordinates))

    return df['geometry']

#-----------------------------------------------------------------------------#

def _get_lon_lat_from_plz(plz, df_gvisys, gvisys_col_plz, gvisys_col_lon, gvisys_col_lat):
    # DEPRECATED
    # never used, plz which dont work with pgeocode are not in df_gvisys
    # gv-isys uses (wgs84, epsg:4326)
    lon, lat = np.nan, np.nan
    # if df_gvisys has entries for plz get coordinates (all entries with plz have coordinates)
    if plz in list(df_gvisys.iloc[:, gvisys_col_plz]):
        # if plz has multiple entries in gvisys, use first entry
        lon = df_gvisys[df_gvisys.iloc[:, gvisys_col_plz] == plz][gvisys_col_lon].values[0]  # as string
        lat = df_gvisys[df_gvisys.iloc[:, gvisys_col_plz] == plz][gvisys_col_lat].values[0]  # as string
    return lon, lat

#-----------------------------------------------------------------------------#

def _get_lon_lat_from_ort_equal(ort, df_gvisys, gvisys_col_gem, gvisys_col_lon, gvisys_col_lat):
    # check if df_gvisys has entries whose gemeindenamen matches ort (equal!) (Groß-/Kleinschreibung beachtet)
    lon, lat = np.nan, np.nan
    df = df_gvisys.loc[df_gvisys.iloc[:, gvisys_col_gem] == ort]
    if len(df) > 0:
        lon_list = list(df[gvisys_col_lon].values)
        lat_list = list(df[gvisys_col_lat].values)
        for lon in lon_list:
            if lon is not np.nan:
                lon = lon
                break
        for lat in lat_list:
            if lat is not np.nan:
                lat = lat
    return lon, lat

def _get_lon_lat_from_ort(ort, df_gvisys, gvisys_col_gem, gvisys_col_lon, gvisys_col_lat):
    # DEPRECATED
    # never used, all plz which dont work with pgeocode worked with geopy
    # gv-isys uses (wgs84, epsg:4326)

    # check if df_gvisys has entries whose gemeindenamen matches ort (equal!) (Groß-/Kleinschreibung beachtet)
    lon, lat = _get_lon_lat_from_ort_equal(ort, df_gvisys, gvisys_col_gem, gvisys_col_lon, gvisys_col_lat)
    # try out other variants of ortsname
    if lon is np.nan or lat is np.nan:
        lon, lat = _get_lon_lat_from_ort_equal(ort+', Stadt', df_gvisys, gvisys_col_gem, gvisys_col_lon, gvisys_col_lat)
    if lon is np.nan or lat is np.nan:
        lon, lat = _get_lon_lat_from_ort_equal(ort+', Hansestadt', df_gvisys, gvisys_col_gem, gvisys_col_lon, gvisys_col_lat)

    # if coordinates where found, return them
    if lon is not np.nan and lat is not np.nan:
        return lon, lat
    # otherwise, try to find coordinates by searching gemeindenamen which contain ort (Groß-/Kleinschreibung beachtet)
    # WARNING!!! PRONE TO ERRORS, e.g. ort = 'Hagen' matches 'Hagenburg', 'Hagenbach', 'Hagenbünach', 'Hagenow' in NRW
    df = df_gvisys.loc[df_gvisys.iloc[:, gvisys_col_gem].str.contains(ort) == True]
    # df_gvisys.loc[df_gvisys.iloc[:, gvisys_col_gem].str.contains('Hagen') == True][[gvisys_col_gem,gvisys_col_plz,gvisys_col_lon]]
    # check for entries whose coordinates are not NaN and use the first one
    if len(df) > 0:
        lon_list = list(df[gvisys_col_lon].values)
        lat_list = list(df[gvisys_col_lat].values)
        for lon in lon_list:
            if lon is not np.nan:
                lon = lon
                break
        for lat in lat_list:
            if lat is not np.nan:
                lat = lat
    return lon, lat

#-----------------------------------------------------------------------------#

def convert_cellname_to_wkt_str(cellname):
    # note cell coordinates in meter
        
    sizes = ['100m', '1km', '10km', '100km']

    for idx, size in enumerate(sizes):
        
        # check for size e.g. with cellname = "100mN31153E41077"
        if size == cellname[0:(len(size))]:
        
            # get x and y coordinates from cellname string (with cut digits according to size)
            y_str_cut, x_str_cut = cellname.split('N')[1].split('E')
            
            # get x and y coordinates as int with full digits in meter
            x, y = int(x_str_cut)*10**(idx+2), int(y_str_cut)*10**(idx+2)
            
            # create WKT-String with square polygon where (x,y) are the corner coordinates in the south west 
            wkt_str = Polygon(((x,y),(x+10**(idx+2),y),(x+10**(idx+2),y+10**(idx+2)),(x,y+10**(idx+2)))).wkt
            return wkt_str
    
    # error handling
    print('Error, could not create WKT string with Polygon')
    return []
    
#-----------------------------------------------------------------------------#

def convert_100mcelllist_to_empty_geodataframe(celllist):
# inputs list of cellnames and outputs geodataframe with cells as polygons with cellname as attribute
    
    gdf = gpd.GeoDataFrame({'Gitter_ID_100m':[],'geometry':[]})
    print(gdf.crs)
    gdf.set_crs('epsg:3035')
    print(gdf.crs)
    
    for cellname in celllist:
        gdf.append(cellname, convert_cellname_to_wkt_str(cellname))
    return gdf

#-----------------------------------------------------------------------------#

def df_add_geometry_str_from_cellname(df):
    
    #df['geometry'] = pd.Series(dtype='str')
    df['geometry'] = ''
    
    # add column with geometry as string
    print('start row iterations to add string values to geometry column...')
    for idx, row in df.iterrows():
        df.loc[idx,'geometry'] = convert_cellname_to_wkt_str(row['Gitter_ID_100m'])
    print('finished row iterations to add string values to geometry column')
    return df

    # -----------------------------------------------------------------------------#

def get_hu_zensus_merkmal_analyse(gdf_hu, key_hu_merkmal, key_hu_zensus, zensus_q_threshold, merkmals_auspraegungen):

    n_hu_total_zensus = len(gdf_hu.loc[gdf_hu[key_hu_zensus] == 1])  # hu that should be counted in zensus (Wohngebäude)
    print(key_hu_merkmal + ' with zensus_q_threshold = ' + str(zensus_q_threshold) + ': Hausumringanalyse:')
    n_hu_with_merkmal = len(gdf_hu.loc[gdf_hu[key_hu_merkmal] != merkmal_unbekannt])
    n_hu_without_merkmal = len(gdf_hu.loc[gdf_hu[key_hu_merkmal] == merkmal_unbekannt])
    if n_hu_total_zensus != 0:
        n_hu_with_merkmal_perc = 100 * n_hu_with_merkmaln_hu_total_zensus
    else:
        n_hu_with_merkmal_perc = 999
    print('\ttotal number of hu with ' + key_hu_merkmal + ': ' + str(n_hu_with_merkmal))
    print('\ttotal number of hu without ' + key_hu_merkmal + ': ' + str(n_hu_without_merkmal))
    print('\tpercentage of hu with ' + key_hu_merkmal + ' that should be counted in zensus: ' + str(
        n_hu_with_merkmal_perc))
    print('\tpercentage of hu without ' + key_hu_merkmal + ' that should be counted in zensus: ' + str(
        100 - n_hu_with_merkmal_perc))

    return None


def get_zensus_geb_merkmal_analyse_df(key_merkmal, zensus_geb_df, m_dict, verbose=True):
    """
    get a dataframe which counts total number and percantage of units
    in remapped zensus dataset with certain key_merkmal (e.g. 'BAUJAHR_MZ')
    note: works for gebäude and for wohnungs datasets

    :param key_merkmal: string, key for m_dict
    :param zensus_geb_df: pandas dataframe, with zensus gebäudedata remapped as in zensus.df
    :param m_dict: dict, as defined in zensus.m_dict
    :return: zensus_geb_merkmal_analyse_df: pandas dataframe
    """

    merkmals_auspraegungen = []             # will contain all possible Merkmal_Ausprägungen
    for tuple in m_dict[key_merkmal][0:-4]:
        merkmals_auspraegungen.append(tuple[2]) # skip last 4 entries (reserved for Q1, Q2, DiffAbs, DiffRel)

    n_geb_total = zensus_geb_df['INSGESAMT'].astype(int).sum()

    # df with count of geb with certain merkmal_auspraegung in zensus dataset
    n_geb_merk_ausp = zensus_geb_df[merkmals_auspraegungen].astype(int).sum()
    n_geb_merk_total = n_geb_merk_ausp.sum()

    # create analysis dataframe with total number and percentages of geb for all merkmal_auspraegungen
    zensus_geb_merkmal_analyse_df = pd.DataFrame({key_merkmal: n_geb_merk_ausp.index,
                                                    'total': n_geb_merk_ausp.values,
                                                    '% total': 100 * n_geb_merk_ausp / n_geb_total,
                                                    '% with': 100 * n_geb_merk_ausp / n_geb_merk_total})
    zensus_geb_merkmal_analyse_df = zensus_geb_merkmal_analyse_df.reset_index(drop=True)

    # add extra rows for aggregated values (with merkmal, without merkmal, INSGESAMT)
    zensus_geb_merkmal_analyse_df = zensus_geb_merkmal_analyse_df.append(
                                    pd.DataFrame({key_merkmal: 'with',
                                                  'total': n_geb_merk_total,
                                                  '% total': 100 * n_geb_merk_total / n_geb_total,
                                                  '% with': 100 }, # 100 * n_geb_merk_total / n_geb_merk_total
                                                 index=[0])
                                    , ignore_index=True)
    zensus_geb_merkmal_analyse_df = zensus_geb_merkmal_analyse_df.append(
                                    pd.DataFrame({key_merkmal: 'without',
                                                  'total': n_geb_total - n_geb_merk_total,
                                                  '% total': 100 * (n_geb_total - n_geb_merk_total) / n_geb_total,
                                                  '% with': 100 * (n_geb_total - n_geb_merk_total) / n_geb_merk_total },
                                                 index=[0])
                                    , ignore_index=True)
    zensus_geb_merkmal_analyse_df = zensus_geb_merkmal_analyse_df.append(
                                    pd.DataFrame({key_merkmal: 'INSGESAMT',
                                                  'total': n_geb_total,
                                                  '% total': 100,
                                                  '% with': 100 * n_geb_total / n_geb_merk_total },
                                                index=[0])
                                    , ignore_index=True)
    if verbose: print(zensus_geb_merkmal_analyse_df)
    return zensus_geb_merkmal_analyse_df

###############################################################################
################################### CLASSES ###################################
###############################################################################

class zensusdata:
    """
    A class to store and preprocess grid-based zensusdata for (Q)GIS
    ...
    Attributes
    ----------
    fp : str
        filepath to csv file with grid-based zensus data
    celllist: list
        list of strings with cell-names for filtering
    col_ref: list
        list of strings as [identifier, key1, key2, value, quality]
    m_dict : dict
        dictionary for possible Merkmal and Ausprägung values
        and new keynames for remapping into new format of df
        Merkmal-name as keys with each field as list of tuples
        like  {key1:[(str, str, str), ...], key2:[(str, str, str), ...], ...}
        tuples contain (ausprägung_code, ausprägung_text, new_zensus_key)
        except last 4 tuples which are reserved for q- and diff-columns
        {key1:[...,('','q1',<q1-columnname>), ('','q2',<q2-columnname>),
        ('','Diff_abs',<DiffAbs-columnname>), ('','Diff_rel',<DiffRel-columnname>)], ...}
    m_filter : list
        list of Merkmal names for filtering, must include 'INSGESAMT'
    df_orig : pandas dataframe
        dataframe with zensus data in original format
    df : pandas dataframe
        dataframe with zensus data reformatted (remapped)
    gdf : geopandas geodataframe
        geodataframe with zensus data (remapped) and grid-geometry
        
    Methods
    -------
    read_zensusdata_from_csv()
        reads zensus data from csv file and stores it in .df_orig
        optionally filters for .celllist and .m_filter
    remap_zensusdata()
        remaps zensus data from .df_orig to .df according to m_dict
    add_diff_columns()
        adds diff columns to .df : INSGESAMT - sum(Merkmal) abs|rel
    add_geometry_column()
        adds geometry column to .df : geometry as WKT-strings
    get_gdf_from_df()
        creates geodataframe from .df (with geometry column)
    print_total_number_orig_df()
        prints some statistics about .df_orig
    print_total_q_diff_number_for_merkmal()
        prints some statistics about .df for specific Merkmal

    Methods internal:
    -----------------
    _create_empty_dataframe_with_new_columns()
        creates empty df for remapping .df_orig to
    _get_col_dict()
        returns dict with new column names for remapping
    _convert_cellname_to_wkt_str(cellname)
        converts cellname to WKT string with polygon geometry
    _get_colname_for_remapped_df(merkmal, auspraegung)
        returns new column name for remapped df from self.m_dict

    Example:
    ---------
    instantiate class object with filepath to csv file
    >>> geb100m = zensusdata(fp=path_to_csv_file)

    define celllist and m_filter (has to include 'INSGESAMT'!) for filtering
    >>> geb100m.celllist = [cell1, cell2, ...]
    >>> geb100m.m_filter = ['INSGESAMT','BAUJAHR_MZ','HEIZTYP']

    read originally formatted zensus data and access head of it
    >>> geb100m.df_orig = geb100m.read_zensusdata_from_csv()
    >>> geb100m.df_orig.head()

    remap .df_orig to .df and access head of it
    note: new column names according to default self.m_dict)
    >>> geb100m.df = geb100m.remap_zensusdata()
    >>> geb100m.df.head()

    add diff columns and geometry as wkt strings to .df
    >>> geb100m.df = geb100m.add_diff_columns()
    >>> geb100m.df = geb100m.add_geometry_column()

    convert pandas dataframe to geopandas geodataframe
    >>> geb100m.gdf = geb100m.get_gdf_from_df()

    print out some statistics
    >>> geb100m.print_total_number_orig_df()
    >>> geb100m.print_total_q_diff_number_for_merkmal('BAUJAHR_MZ')
    >>> geb100m.print_total_q_diff_number_for_merkmal('HEIZTYP')
    """ 
    def __init__(self, fp=None, celllist=None, m_filter=None, df_orig=None, df=None,
                 gdf=None, col_dict=None, col_ref=None, m_dict=None):
        """
        Parameters
        ----------
        fp : str
            filepath to csv file with grid-based zensus data
        celllist: list
            list of strings with cell-names for filtering
        m_filter : list
            list of Merkmal names for filtering
        df_orig : pandas dataframe
            pandas dataframe with zensus data in original format
        df : pandas dataframe
            pandas dataframe with zensus data, optionally remapped / with geometry data
        gdf : geopandas geodataframe
            geopandas geodataframe with zensus data
        col_ref: list
            list of strings as [identifier, key1, key2, value, quality]
        col_dict: dict
            [list, string, string]
            list contains a list of strings with new column names
            string, string contain names of absolute and relative difference column names
            e.g. {'BAUJAHR_MZ': [['WhgVor1981','Whg1981_00','WhgNac2000'],'WhgDiffAbs','WhgDiffRel')]
        m_dict : dict
            dictionary for possible Merkmal and Ausprägung values
            and new keynames for remapping into new format of df
            Merkmal-name as keys with each field as list of tuples
            like  {key1:[(str, str, str), ...], key2:[(str, str, str), ...], ...}
            tuples contain (ausprägung_code, ausprägung_text, new_zensus_key)
            except last 4 tuples which are reserved for q- and diff-columns
            {key1:[...,('','q1',<q1-columnname>), ('','q2',<q2-columnname>),
            ('','Diff_abs',<DiffAbs-columnname>), ('','Diff_rel',<DiffRel-columnname>)], ...}
        """
        # attribute assignment without default values
        if fp is not None:
            self.fp = fp
        else:
            self.fp = None

        if celllist is not None:
            self.celllist = celllist
        else:
            self.celllist = None

        if df_orig is not None:
            self.df_orig = df_orig
        else:
            self.df_orig = None

        if df is not None:
            self.df = df
        else:
            self.df = None

        if gdf is not None:
            self.gdf = gdf
        else:
            self.gdf = None

        if col_dict is not None:
            self.col_dict = col_dict
        else:
            self.col_dict = None
        
        # attribute assignment with default values
        if col_ref is not None: self.col_ref = col_ref
        else: self.col_ref = ['Gitter_ID_100m','Merkmal','Auspraegung_Text','Anzahl','Anzahl_q']
        
        if m_filter is not None: self.m_filter = m_filter
        else: self.m_filter = ['INSGESAMT','BAUJAHR_MZ','HEIZTYP']

        if m_dict is not None: self.m_dict = m_dict
        else:
            self.m_dict={
                    'INSGESAMT' : [('0','Einheiten insgesamt','INSGESAMT')],
                    'NUTZUNG_DETAIL_HHGEN' : [('1','von Eigentümer/-in bewohnt','vonEigBew'),
                                              ('11','Eigentum: mit aktuell geführtem Haushalt','EigMitGefH'),
                                              ('12','Eigentum: ohne aktuell geführtem Haushalt','EigOhnGefH'),
                                              ('2','Zu Wohnzwecken vermietet','VermWhZweck'),
                                              ('21','Vermietet: mit aktuell geführtem Haushalt','VerMitGefH'),
                                              ('22','Vermietet: ohne aktuell geführtem Haushalt','VerOhnGefH'),
                                              ('3','Ferien- und Freizeitwohnung','FerFreiWhg'),
                                              ('4','Leer stehend','Leerstand'),
                                              ('5','Diplomaten-/Streitkräftewohnung','DiplStreitW'),
                                              ('99','Gewerbl. Nutzung','GewerbNutz'),
                                              ('','q1','Q1Nutzung'),         # Qualität 1 (stark abweichend)
                                              ('','q2','Q2Nutzung'),         # Qualität 2 (inakzeptabel abweichend)
                                              ('','Diff_abs','DiffAbsNtz'),  # Differenz absolut ggü. Insgesamt
                                              ('','Diff_rel','DiffRelNtz')], # Differenz relativ ggü. Insgesamt
            #        'WOHNEIGENTUM' :  
                    'WOHNFLAECHE_10S' : [('01','Unter 30','Unter30qm'),
                                         ('02','30 - 39','30-39 qm'),
                                         ('03','40 - 49','40-49 qm'),
                                         ('04','50 - 59','50-59 qm'),
                                         ('05','60 - 69','60-69 qm'),
                                         ('06','70 - 79','70-79 qm'),
                                         ('07','80 - 89','80-89 qm'),
                                         ('08','90 - 99','90-99 qm'),
                                         ('09','100 - 109','100-109 qm'),
                                         ('10','110 - 119','110-119 qm'),
                                         ('11','120 - 129','120-129 qm'),
                                         ('12','130 - 139','130-139 qm'),
                                         ('13','140 - 149','140-149 qm'),
                                         ('14','150 - 159','150-159 qm'),
                                         ('15','160 - 169','160-169 qm'),
                                         ('16','170 - 179','170-179 qm'),
                                         ('17','180 und mehr','180+ qm'),
                                         ('99','t.n.z., gewerblich','tnzGewerb'),
                                         ('','q1','Q1WFläche'),         # Qualität 1 (stark abweichend)
                                         ('','q2','Q2WFläche'),         # Qualität 2 (inakzeptabel abweichend)
                                         ('','Diff_abs','DiffAbsFla'),  # Differenz absolut ggü. Insgesamt
                                         ('','Diff_rel','DiffRelFla')], # Differenz relativ ggü. Insgesamt
            #        'RAUMANZAHL' :
                    'GEBAEUDEART_SYS' : [('1','Gebäude mit Wohnraum',''),
                                         ('11','Wohngebäude',''),
                                         ('111','Wohngebäude (ohne Wohnheime)',''),
                                         ('12','Sonstiges Gebäude mit Wohnraum',''),
                                         ('','q1','Q1GArtSys'),          # Qualität 1 (stark abweichend)
                                         ('','q2','Q2GArtSys'),          # Qualität 2 (inakzeptabel abweichend)
                                         ('','Diff_abs','DiffAbsArt'),   # Differenz absolut ggü. Insgesamt
                                         ('','Diff_rel','DiffRelArt')],  # Differenz relativ ggü. Insgesamt
                    'BAUJAHR_MZ' : [('1','Vor 1919','BauVor1919'),
                                    ('2','1919 - 1948','Bau1919_48'),
                                    ('3','1949 - 1978','Bau1948_78'),
                                    ('4','1979 - 1986','Bau1979_86'),
                                    ('5','1987 - 1990','Bau1987_90'),
                                    ('6','1991 - 1995','Bau1991_95'),
                                    ('7','1996 - 2000','Bau1996_00'),
                                    ('8','2001 - 2004','Bau2001_04'),
                                    ('9','2005 - 2008','Bau2005_08'),
                                    ('10','2009 und später','BauNac2008'),
                                    ('','q1','Q1Baujahr'),               # Qualität 1 (stark abweichend)
                                    ('','q2','Q2Baujahr'),               # Qualität 2 (inakzeptabel abweichend)
                                    ('','Diff_abs','DiffAbsAlt'),        # Differenz absolut ggü. Insgesamt
                                    ('','Diff_rel','DiffRelAlt')],       # Differenz relativ ggü. Insgesamt
            #        'EIGENTUM' : [],   # not used
            #        'GEBTYPBAUWEISE' : [('1','Freistehendes Haus'),      # not used
            #                            ('2','Doppelhaus hälfte'),       # SIC! aus Merkmalsbeschreibung
            #                            ('3','Gereihtes Haus'),
            #                            ('4','Anderer Gebäudetyp'),
            #                            ('','Diff_abs','DiffAbsBau'),     # Differenz absolut ggü. Insgesamt
            #                            ('','Diff_rel','DiffRelBau')],    # Differenz relativ ggü. Insgesamt
                    'GEBTYPGROESSE' : [('1','Freistehendes Einfamilienhaus'), # not used
                                       ('2','Einfamilienhaus: Doppelhaushälfte'),
                                       ('3','Einfamilienhaus: Reihenhaus'),
                                       ('4','Freistehendes Zweifamilienhaus'),
                                       ('5','Zweifamilienhaus: Doppelhaushälfte'),
                                       ('6',''),
                                       ('7',''),
                                       ('8',''),
                                       ('9',''),
                                       ('10',''),
                                       ('','q1','Q1Groesse'),            # Qualität 1 (stark abweichend)
                                       ('','q2','Q2Groesse'),            # Qualität 2 (inakzeptabel abweichend)
                                       ('','Diff_abs','DiffAbsGro'),     # Differenz absolut ggü. Insgesamt
                                       ('','Diff_rel','DiffRelGro')],    # Differenz relativ ggü. Insgesamt
                    'HEIZTYP' : [('1','Fernheizung (Fernwärme)','Fernwärme'),
                                 ('2','Etagenheizung','EtagenHeiz'),
                                 ('3','Blockheizung','BlockHeiz'),
                                 ('4','Zentralheizung','ZentrlHeiz'),
                                 ('5','Einzel-Mehrraumöfen (auch Nachtspeicherheizung)','1+Raumöfen'),
                                 ('6','Keine Heizung im Gebäude oder in den Wohnungen','KeineHeiz'),
                                 ('','q1','Q1Heiztyp'),                   # Qualität 1 (stark abweichend)
                                 ('','q2','Q2Heiztyp'),                   # Qualität 2 (inakzeptabel abweichend)
                                 ('','Diff_abs','DiffAbsHei'),            # Differenz absolut ggü. Insgesamt
                                 ('','Diff_rel','DiffRelHei')],           # Differenz relativ ggü. Insgesamt
            #        'ZAHLWOHNGN_HHG' :
                }
            """
            dictionary for possible Merkmal and Ausprägung names 
            and new keynames for remapping into new format of df

            last four tuples are reserved for: 
            i) quality control and ii) calculating differences
            thus second entry of those tuples should not be changed
            they are 'q1','q2','Diff_abs' and 'Diff_rel'

            Accessing Data
            --------------
            m_dict[<Merkmalname>] : list
                contains a list of touples for each Merkmal
            m_dict[<Merkmalname>][<index>] : tuple
                contains three strings: ausprägung_code, ausprägung_text, new_zensus_key
            """

    #-----------------------------------------------------------------------------#

    def read_zensusdata_from_csv(self,fp=None,celllist=None,m_filter=None,col_ref=None,crop_to_celllist=True,crop_to_m_filter=True,delimiter=','):
        """
        reads zensus data from csv file to a pandas dataframe
        if self.celllist is defined it will crop dataframe 
        to rows with cellnames matching those in celllist
        if self.m_filter is defined it will crop dataframe
        to rows with Merkmale matching those in m_filter

        Parameters
        ----------
        fp : str, filepath to csv file with zensus data (grid-based)
            if None, self.fp is used
        celllist : list, list of cellnames to crop dataframe to
            if None, self.celllist is used
        m_filter : list, list of Merkmale to crop dataframe to
            if None, self.m_filter is used
        col_ref : dict, dictionary with column names of zensus data
            if None, self.col_ref is used
        crop_to_celllist : bool, if True, crop dataframe to celllist
        crop_to_m_filter : bool, if True, crop dataframe to m_filter
        delimiter: string, delimiter of csv file

        Returns
        -------
        dataframe : pandas dataframe
            pandas dataframe with (cropped) zensus data
        
        Self-Modification:
        ------------------
        None

        """
        start_time = time.time()
        print('\treading zensus data and cropping it to celllist and m_filter ...')

        # initialize variables
        if fp is None: fp = self.fp
        if crop_to_celllist is not True: print('Warning! Wont crop zensus data to celllist!')
        else:
            if celllist is None: celllist = self.celllist
            if celllist is None: print('Warning! celllist is not defined. Wont crop zensus data to celllist!')
        if crop_to_m_filter is not True: print('Warning! Wont crop zensus data to m_filter!')
        else:
            if m_filter is None: m_filter = self.m_filter
            if m_filter is None: print('Warning! m_filter is not defined. Wont crop zensus data m_filter!')

        if col_ref is None:
            identifier = self.col_ref[0]
            merkmal = self.col_ref[1]
        else:
            identifier = 'Gitter_ID_100m'
            merkmal = 'Merkmal'

        # read csv
        print('\t\tstarting to read whole csv file into dataframe...')
        dataframe = pd.read_csv(fp, encoding = 'unicode_escape', delimiter=delimiter)
        print('\t\tcsv file completely read into dataframe')

        # filter df
        if crop_to_celllist and celllist is not None:
            print('\t\tstarting to crop df to rows whose identifier values match those in celllist...')
            dataframe = dataframe.loc[dataframe[identifier].isin(celllist)]
            print('\t\tfinished cropping df to celllist')

        if crop_to_m_filter and m_filter is not None:
            if merkmal in dataframe.columns: # only in original format
                print('\t\tstarting to crop df to merkmale in m_filter...')
                dataframe = dataframe.loc[dataframe[merkmal].isin(m_filter)]
                print('\t\tfinished df cropping')

        print('\tzensus data read and cropped in ', time.time() - start_time, 's')
        return dataframe

    #-----------------------------------------------------------------------------#

    def _create_empty_dataframe_with_new_columns(self,m_dict=None,m_filter=None,col_ref=None,col_dict=None):
        """
        Parameters
        ----------
        m_dict : dict, optional
            dictionary for possible Merkmal and Ausprägung values
            and new keynames for remapping into new format of df
            Merkmal-name as keys with each field as list of tuples
            like  {key1:[(str, str, str), ...], key2:[(str, str, str), ...], ...}
            tuples contain (ausprägung_code, ausprägung_text, new_zensus_key)
            except last 4 tuples which are reserved for q- and diff-columns
            {key1:[...,('','q1',<q1-columnname>), ('','q2',<q2-columnname>),
            ('','Diff_abs',<DiffAbs-columnname>), ('','Diff_rel',<DiffRel-columnname>)], ...}
        m_filter : list, optional
            contains a list of Merkmal names to filter
        col_ref : list, optional
            contains a list of strings [identifier, key1, key2, valuename, qualityname]
        col_dict: dict, optional
            [list, string, string]
            list contains a list of strings with new column names
            string, string contain names of absolute and relative difference column names

        Returns
        -------
        df : pandas dataframe
            new empty dataframe to remap zensus data into with .remap_zensusdata()

        """
        if m_dict is None: m_dict = self.m_dict
        if m_filter is None: m_filter = self.m_filter
        if col_ref is None: col_ref = self.col_ref
        if col_dict is None: col_dict = self.col_dict
        if col_dict is None: self._get_col_dict()

        if m_filter is None:
            print('Error! m_filter is not defined. Wont create new dataframe!')
        if col_ref is None:
            identifier = 'Gitter_ID_100m'
        else:
            identifier = self.col_ref[0]

        # create empty df
        df = pd.DataFrame()
        df[identifier] = []

        if col_dict is not None:
            df['INSGESAMT'] = []
            for merkmal in col_dict.keys():
                for new_col_name in col_dict[merkmal][0]:
                    df[new_col_name] = []                           # ausprägungs columns
                for extra_column_names in col_dict[merkmal][1:]:
                    df[extra_column_names] = []                     # q1, q2, diff_abs, diff_rel columns

        else: # if col_dict is None:
            # add columns to empty df for each ausprägung  wanted merkmale
            for merkmal in m_filter:
                # create new columns for each key and attribute combination
                # new keyname is hardcoded keyname in merkmal's dictionary (3rd value of touple)
                for ausprägung_tuple in m_dict[merkmal]:
                    # skip diff columns
                    #if ausprägung_tuple[1] == 'q1' or ausprägung_tuple[1] == 'q2': continue # dont skip quality columns
                    if ausprägung_tuple[1] == 'Diff_abs' or ausprägung_tuple[1] == 'Diff_rel': continue
                    df[ausprägung_tuple[2]] = []

        return df

    #-----------------------------------------------------------------------------#

    def _get_colname_for_remapped_df(self, merkmal, ausprägung):
        """
        get colname from self.m_dict
        :param merkmal: string, used as key for self.m_dict
        :param ausprägung: string, either ausprägung_text or ausprägung_code
        :return: string, colname for remapped df
        """
        # ausprägung either ausprägung_text or ausprägung_code
        for ausprägung_tuple in self.m_dict[merkmal]:
            if ausprägung_tuple[0] == ausprägung or ausprägung_tuple[1] == ausprägung:
                return ausprägung_tuple[2]
        return None

    #-----------------------------------------------------------------------------#

#    def new_val_for_zensus_new_df(val_old_df,val_new_df):
#        if val_new_df == '00':
#            # write value from old df to new df
#            return val_old_df
#        else:
#            # add value from old df to new df
#            return str(int(val_new_df) + int(val_old_df))
    
    #-----------------------------------------------------------------------------#

    def remap_zensusdata(self,q_thresshold=0):
        """
        remaps pandas self.df_orig into a new column format to store in self.df
        remapping is done according to self.m_dict, self.m_filter and q_thresshold

        Parameters
        ----------
        q_trhesshold : int, optional
            allowed maximum quality value for values to be used in new df
            accepted values are 0, 1, 2 (0 is best, 2 is worst quality)

        Parameters used from self
        -------------------------
        m_dict : dict
            dictionary for possible Merkmal and Ausprägung values
            and new keynames for remapping into new format of df
            Merkmal-name as keys with each field as list of tuples
            like  {key1:[(str, str, str), ...], key2:[(str, str, str), ...], ...}
            tuples contain (ausprägung_code, ausprägung_text, new_zensus_key)
            except last 4 tuples which are reserved for q- and diff-columns
            {key1:[...,('','q1',<q1-columnname>), ('','q2',<q2-columnname>),
            ('','Diff_abs',<DiffAbs-columnname>), ('','Diff_rel',<DiffRel-columnname>)], ...}
        m_filter : list
            contains a list of Merkmal names to filter
        df_orig : pandas dataframe
            contains zensus data in original data format
        col_ref : list
            contains a list of strings [identifier, key1, key2, valuename, qualityname]

        Returns
        -------
        df : pandas dataframe

        Note: Datatypes are strings instead of int or float, probably stupid idea, dunno
            thought it would be easier to handle missing values this way, not needed yet

        Detailed Description
        --------------------
        original df has multiple row entries for each cell,
        cell names are in the column with the key identifier,
        merkmale are in the column with the key key1 and
        ausprägungen are in the column with the key key2

        e.g. (shortened) (key 2 chosen for text instead of code)
        self.df_orig:
        identifier  key1            key2            value  quality
        cell1       'INSGESAMT'     ''              20      0
        cell1       'BAUJAHR_MZ'    'Vor 1919'      5       0
        cell1       'BAUJAHR_MZ'    '1919 - 1948'   10      1
        cell1       'BAUJAHR_MZ'    '1949 - 1978'   4       2
        cell1       'HEIZTYP'       ...             ...     ...
        ...         ...             ...             ...     ...
        cell2       'INSGESAMT'     ''              30      0

        this df will be remapped into a new df with one row entry per cell
        each key1 key2 combination defined in self.m_dict will be a new column
        (if key1 value is in self.m_filter)
        values will be remapped if quality is below q_thresshold

        if multiple key1 key2 combination in self.m_dict share the same
        new column name their values will be summed up (if below q_thresshold)

        extra columns will be added to sum up values for each key1 whose
        quality is either 1 (q1-column) or 2 (q2-column)

        e.g. (if m_filter contains 'BAUJAHR_MZ' and q_threshold == 0) sth like:
        new dataframe:
        identifier 'INSGESAMT' 'BauVor1919' 'Bau1919_48' 'Bau1949_78' ... 'Q1Baujahr' 'Q2Baujahr'
        cell1       20          5            10           0           ...   10          4
        cell2       30          ...          ...          ...         ...   ...         ...
        ...

        keys are defined in self.col_ref as a list of strings
        [identifier, key1, key2, valuename, qualityname]
        default:
        ['Gitter_ID_100m', 'Merkmal', 'Ausprägung', 'Anzahl', 'Anzahl_q']

        self.m_dict defines for each key1 which key2 values are possible.
        during remapping the new column names for relevant key1, key2 combinations
        according to self.m_filter are saved in self.col_dict

        IMPORTANT NOTE:
        prerequisite: self.df_orig rows must be sorted by value of identifier !!!
        e.g. order like cell1, cell1, cell2, cell2, cell1, cell3, ... does not work!
        """
        start_time = time.time()
        print('\tremapping zensus data from .remap_zensusdata()...')

        # Error Handling
        for merkmal in self.m_filter:
            if self.m_dict.__contains__(merkmal) == False:
                print('ERROR: ',merkmal,'from m_filter does not apper in m_dict')
                return None

        if self.col_dict == None: self.col_dict = self._get_col_dict()

        # for readability
        col_dict = self.col_dict
        identifier, m, a, value, quality = self.col_ref
        
        # create empty df
        df_new = self._create_empty_dataframe_with_new_columns()
        
        # add temporary first line / row and pre-define non-values
        df_new = df_new.append(pd.Series(index=df_new.columns).fillna('temp'),ignore_index=True)
        df_idx = 0
        
        # predefine empty row with non-values for appending new rows
        empty_row = pd.Series(index=df_new.columns).fillna('00')
        
        # convert df to dict for faster looping 
        df_dict = self.df_orig.to_dict('records')

        # read old dataframe row-wise
        for row in df_dict:
            if row[m] not in self.m_filter: continue

            # check if identifier is new, if so append new row, assign identifier value
            if row[identifier] != df_new[identifier][df_idx]:
            #if row[identifier] not in df_new[identifier].values:   # alt. condition (slower, safer)
                df_new = df_new.append(empty_row, ignore_index=True)
                df_idx = df_idx + 1
                df_new[identifier][df_idx] = row[identifier]

            # add row value from old df to column in remapped df according to quality...

            # no quality check: all values good
            if quality is None or q_thresshold == 2:
                colname = self._get_colname_for_remapped_df(row[m], row[a])
                if colname is not None:
                    # add value from row in old df to new df
                    df_new[colname][df_idx] = str(int(row[value] + int(df_new[colname][df_idx])))

            # quality check: good values only
            elif int(row[quality]) == 0:
                colname = self._get_colname_for_remapped_df(row[m], row[a])      # New Merkmal-Ausprägungs column name
                if colname is not None:
                    # add value from row in old df to new df (aggred. Q0)
                    df_new[colname][df_idx] = str(int(row[value] + int(df_new[colname][df_idx])))

            # quality check: bad values only
            elif int(row[quality]) == 1:
                colname_q = self.col_dict[row[m]][1]                            # Q1 column name
                if colname_q is not None:
                    # add value from row in old df to new df (Q1)
                    df_new[colname_q][df_idx] = str(int(row[value] + int(df_new[colname_q][df_idx])))

                if q_thresshold == 0: continue
                colname = self._get_colname_for_remapped_df(row[m], row[a])      # New Merkmal-Ausprägungs column name
                if colname is not None:
                    # add value from row in old df to new df (aggr. Q0, Q1)
                    df_new[colname][df_idx] = str(int(row[value] + int(df_new[colname][df_idx])))

            # quality check: unacceptable values only
            elif int(row[quality]) == 2:
                colname_q = self.col_dict[row[m]][2]                            # Q2 column name
                if colname_q is not None:
                    # add value from row in old df to new df (Q2)
                    df_new[colname_q][df_idx] = str(int(row[value] + int(df_new[colname_q][df_idx])))

                if q_thresshold <= 1: continue
                colname = self._get_colname_for_remapped_df(row[m], row[a])      # New Merkmal-Ausprägungs column name
                if colname is not None:
                    # add value from row in old df to new df (aggr. Q0, Q1, Q2)
                    df_new[colname][df_idx] = str(int(row[value] + int(df_new[colname][df_idx])))

        # delete temporary first line / row and reset indices to start at 0
        df_new = df_new.drop(0)
        df_new.reset_index(drop=True, inplace=True)

        print('\tzensus data remapped in ', time.time() - start_time, 's')
        return df_new

    #-----------------------------------------------------------------------------#

    def _get_col_dict(self, m_filter=None, m_dict=None):
        """
        get dictionary of new column names from m_dict filtered by Merkmale in m_filter

        Note: if m_dict contains multiple Ausprägungen for one Merkmal with same new
        column name, the column name will only be once in the dictionary

        Note: Merkmal 'INSGESAMT' is not included in the dictionary

        col_dict will have the form: {merkmal:([colname1,colname2,...],colname_diffabs,colname_diffrel)}

        example parameter:
        ------------------
        m_filter = ['BAUJAHR_MZ']
            if m_filter == None: m_filter = self.m_filter
        m_dict['BAUJAHR_MZ'] = [('01','vor 1919','WhgVor1949'),('02','1919 - 1948,'WhgVor1949),...,(,'Diff_rel','DiffRelAlt')]
            if m_dict == None: m_dict = self.m_dict

        example return:
        ---------------
        col_dict['BAUJAHR_MZ'] = [['WhgVor1949',...], 'DiffAbsAlt', 'DiffRelAlt']
        """
        print('\t\tstart _get_col_dict')
        if m_filter == None:
            m_filter = self.m_filter
        if m_dict == None:
            m_dict = self.m_dict

        col_dict = {}
        for merkmal in m_filter:
            # Error Checking
            if merkmal not in m_dict.keys():
                print('ERROR: ',merkmal,'from m_filter does not apper in m_dict')
                continue
            if merkmal == 'INSGESAMT':
                continue

            col_dict[merkmal] = [[],'','','','']

            # add column names to list in dictionary with merkmal as key
            for ausprägung_tuple in m_dict[merkmal]:

                # write Quality and Diff column names seperately
                if ausprägung_tuple[1] == 'q1':
                    col_dict[merkmal][1] = ausprägung_tuple[2]
                elif ausprägung_tuple[1] == 'q2':
                    col_dict[merkmal][2] = ausprägung_tuple[2]
                elif ausprägung_tuple[1] == 'Diff_abs':
                    col_dict[merkmal][3] = ausprägung_tuple[2]
                elif ausprägung_tuple[1] == 'Diff_rel':
                    col_dict[merkmal][4] = ausprägung_tuple[2]

                elif ausprägung_tuple[2] not in col_dict[merkmal][0]:
                    col_dict[merkmal][0].append(ausprägung_tuple[2])    # add new column name to list

        print('\t\tfinished _get_col_dict')
        return col_dict

    #-----------------------------------------------------------------------------#

    def add_diff_columns(self,df=None):
        """
        add difference values of INSGESAMT column and sum of columns for one merkmal
        to two new diff columns: absolute and relative to INSGESAMT

        :param df: dataframe to add diff columns to (default: self.df)
        :return: df with added diff columns

        note: uses self.col_dict and self.m_filter to get column names

        datatypes:
                    absolute difference as numpy int64
                    relative difference as numpy float64

        example:
        --------
        if self.df is something like this:

        identifier 'INSGESAMT' 'BauVor1919' 'Bau1919_48' 'Bau1949_78' ... 'Q1Baujahr' 'Q2Baujahr'
        cell1       20          5            10           0           ...   10          4
        cell2       30          ...          ...          ...         ...   ...         ...
        ...

        function call will return df with added diff columns like this:

        identifier 'INSGESAMT' 'BauVor1919' 'Bau1919_48' 'Bau1949_78' ... 'Q1Baujahr' 'Q2Baujahr' 'DiffAbsAlt' 'DiffAbsRel'
        cell1       20          5            10           0           ...   10          4            5            0.25
        cell2       30          ...          ...          ...         ...   ...         ...          ...          ...
        ...

        """
        start_time = time.time()
        print('\tadding diff columns ... ')

        if df is None: df = self.df

        # Precondition Checking
        if self.col_dict == None:
            print('Info: col_dict is None, now running _get_col_dict() first')
            self.col_dict = self._get_col_dict()

        # add difference values to dataframe for each merkmal
        for merkmal in self.m_filter:
            if merkmal == 'INSGESAMT':  # don't calc diff INSGESAMT - INSGESAMT
                continue

            # for readability
            colname_list = self.col_dict[merkmal][0]
            colname_diff_abs = self.col_dict[merkmal][3]
            colname_diff_rel = self.col_dict[merkmal][4]

            # add difference columns to dataframe if not already existing
            if colname_diff_abs not in df.columns:
                print('add column ',colname_diff_abs,' for ',merkmal,' to df')
                df[colname_diff_abs] = np.nan
            if colname_diff_rel not in df.columns:
                print('add column ',colname_diff_rel,' for ',merkmal,' to df')
                df[colname_diff_rel] = np.nan

            # calculate difference of INSGESAMT and sum of columns for merkmal
            print('\t\tstart add absolute diff values for ',merkmal,'...')
            df.loc[:,colname_diff_abs] = df.loc[:,'INSGESAMT'].astype(int) - df.loc[:, colname_list].astype(int).sum(axis=1)
            print('\t\tstart add relative diff values for ',merkmal,'...')
            df.loc[:,colname_diff_rel] = df.loc[:,colname_diff_abs] / df.loc[:,'INSGESAMT'].astype(int)
            print('\t\tfinished adding diff values for ',merkmal)

        print('\tdiff columns added in ', time.time() - start_time, 's')
        return df

    #-----------------------------------------------------------------------------#

    def _convert_cellname_to_wkt_str(self,cellname,size):
        # factor to get coordinates in meter
        size_dict = {'100m' : 2,
                      '1km' : 3,
                      '10km' : 4,
                      '100km' : 5
                      }
        # edge size in meter
        m = 10**size_dict[size]
    
        # get x and y coordinates from cellname string (with cut digits according to size)
        y_str_cut, x_str_cut = cellname.split('N')[1].split('E')
        
        # get x and y coordinates as int with full digits in meter
        x, y = int(x_str_cut)*m, int(y_str_cut)*m
        
        # create WKT-String with square polygon where (x,y) are the corner coordinates in the south west 
        wkt_str = Polygon(((x,y),(x+m,y),(x+m,y+m),(x,y+m))).wkt
        return wkt_str
        
        # error handling
        print('Error, could not create WKT string with Polygon')
        return []

    #-----------------------------------------------------------------------------#

    def add_geometry_column(self,df=None,identifier=None):
        """
        add geometry column to df with WKT string from identifier column
        identifier column must contain cellnames in INSPIRE grid format
        e.g. "100mN31153E41077"

        :param df: pandas dataframe (default: self.df)
        :param identifier: str (default: self.col_ref[0])
        :return: df: pandas dataframe (now with geometry column)
        """
        start_time = time.time()
        print('\tadding geometry column ...')

        if df is None:
            df = self.df
        
        if identifier is None and self.col_ref[0] is None:
            print('Error: No row identifier column defined!')
            return None
        if identifier is None and self.col_ref[0] is not None:
            identifier = self.col_ref[0]
        
        # possible sizes for INSPIRE compatible grids
        sizes = ['100m', '1km', '10km', '100km']
        
        # get size from cellname = "100mN31153E41077"
        size = None
        for size_str in sizes:
            if size_str in list(df[identifier])[1]: # safetyhalber Gitterzellenname aus zweiter Zeile nehmen
                size = size_str
        if size is None:
            print('Error, could not extract grid cell size from cellname')
        
        # add geometry column
        df['geometry'] = ''

        if False:
            # add values to geometry column as strings in wkt format
            print('\t\tstart row iterations to add string values to geometry column...')
            for index, cellname in enumerate(df[identifier]):
                df.loc[index,'geometry'] = self._convert_cellname_to_wkt_str(cellname,size)
            print('\t\tfinished row iterations to add string values to geometry column')

        if True: #todo don't iterate to get wkt strings, use pandas apply function
            df['geometry'] = df[identifier].apply(lambda cellname: self._convert_cellname_to_wkt_str(cellname,size))

        # important code line below if geometry column is not a geoseries
        # happens when df is read from csv file with pandas read_csv function
        # and geometry column is a string column
        # not important if geometry column is added with zensusdata.add_geometry_column()
        #df['geometry'] = gpd.GeoSeries.from_wkt(df['geometry'])

        print('\tgeometry column added in ', time.time() - start_time, 's')
        return df

    #-----------------------------------------------------------------------------#

    def get_gdf_from_df(self,df=None):
        """
        convert WKT strs in geometry column of .df into geometry objects
        and create .gdf geodataframe from .df dataframe
        :param df: pandas dataframe (default: self.df)
        :return: gdf: geopandas geodataframe
        """
        start_time = time.time()
        print('\tconverting dataframe to geodataframe ...')

        if df is None: df = self.df

        df['geometry'] = gpd.GeoSeries.from_wkt(df['geometry'])  # WKT strs to geometry objs
        gdf = gpd.GeoDataFrame(df, geometry='geometry', crs='epsg:3035')  # geodataframe

        print('\tdataframe converted to geodataframe in ', time.time() - start_time, 's')
        return gdf

    #-----------------------------------------------------------------------------#
    def print_total_number_orig_df(self):
        """
        print total number of units and cells in original zensus dataframe
        :return: None
        """
        if self.df_orig is not None:
            units_total = self.df_orig.loc[self.df_orig['Merkmal'] == 'INSGESAMT']['Anzahl'].astype(int).sum()
            cells_total = len(self.df_orig[self.col_ref[0]].unique())
            print('\toriginal zensus dataframe (cropped and filtered but not remapped) contains:')
            print(units_total, ' units in ', cells_total, ' cells')

    def print_total_q_diff_number_for_merkmal(self,key_merkmal,units='units'):
        """
        print total sum of q1, q2, diff_abs columns and
        average of dff_rel column for given merkmal in df
        (diff_abs sum and diff_rel avg only in total!
        seperately for pos and neg values not implemented yet!)

        :param: key_merkmal: str, used on self.m_dict to get .df column names
        :param: units: str, e.g. Gebäude or Wohnungen (depends on which zensus data is used)
        :return: None
        """
        if self.df is None and self.gdf is not None:
            df = pd.DataFrame(self.gdf)
        elif self.df is not None and self.gdf is None:
            print('Error: No dataframe defined!')
            return None
        else:
            df = self.df
        q1_merkmal_sum = df[self.m_dict[key_merkmal][-4][2]].astype(int).sum()
        q2_merkmal_sum = df[self.m_dict[key_merkmal][-3][2]].astype(int).sum()
        diff_abs_merkmal_sum = df[self.m_dict[key_merkmal][-2][2]].astype(int).sum() # pos and neg values!
        diff_rel_merkmal_avg = df[self.m_dict[key_merkmal][-1][2]].astype(float).mean() # pos and neg values!
        print('\t'+ units + ' '+ key_merkmal + ':')
        print('\t\t'+ units + ' Q1 ' + key_merkmal + ' Summe: ', q1_merkmal_sum)
        print('\t\t'+ units + ' Q2 ' + key_merkmal + ' Summe: ', q2_merkmal_sum)
        print('\t\t'+ units + ' DiffAbs ' + key_merkmal + ' Summe: ', diff_abs_merkmal_sum)
        print('\t\t'+ units + ' DiffRel ' + key_merkmal + ' Mittelwert: ', diff_rel_merkmal_avg)