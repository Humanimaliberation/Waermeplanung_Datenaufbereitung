#!/bin/bash

# little bash script to change georeferencing in .tif files with gdwalwarp
# from Ground Control Points (GCP) to geoaffine georeferencing and then
# building a single .vrt mosaic file from them with gdalbuildvrt
# gdwalwarp and gdabuildvrt has to be installed

# references:
# https://gis.stackexchange.com/questions/354605/importing-massive-amounts-of-raster-files
# https://gis.stackexchange.com/questions/417843/gdalbuildvrt-does-not-support-ungeoreferenced-image
# https://trac.osgeo.org/gdal/ticket/1689 # huge files, whack compression rates
# https://stackoverflow.com/questions/71052310/compress-output-raster-and-parallelize-gdalwarp-from-r
# https://kokoalberti.com/articles/geotiff-compression-optimization-guide/

# bash for loop iterating over filenames taken from: 
# https://www.cyberciti.biz/faq/bash-loop-over-file/

# how to use: 
# 1) check if original files are in the folders "./sw/" and/or "./farbe/" 
# 2) run script from terminal or execute otherwise
#
# TODO: probably set some tiling for mosaic file
#
# WARNING! the outputted .tif files with geoaffine georeferencing might
# WARNING! take up extremely much more space! e.g. 16,9 GB instead of 482,2 MB
# WARNING! in case of 811 sw(!) tiles in bbox around Wuppertal, Velbert, Solingen
# WARNING! when no compression is set, still 1,8 GB with "COMPRESS=DEFLATE" (sw)

mkdir ./sw_affine 	# new directory (to put modified schwarzweiß files into)
mkdir ./farbe_affine	# new directory (to put modified farbe tiles into)
mkdir ./vrt		# new directory (to put vrt files into)

echo ".tif files has to be in the folders \"./sw/\" and/or \"./farbe/\"!"
echo "created directories \"./sw_affine/\", \"./farbe_affine/\" and \"./vrt/\""
echo ".tif files with geoaffine georeferencing will be put in \"./*_affine/\" "
echo "single .vrt files will then be created and written to \"./vrt/\" "

# begin with schwarzweiß tiles
# ----------------------------
cd ./sw 		# working directory (original files are here)
FILES="./*.tif"
for f in $FILES
do    
  # FAILSAFE #
  # Check if "$f" FILE exists and is a regular file and then apply gdwalwarp
  if [ -f "$f" ]
    then
      # create same named files with geoaffine georeferencing
      gdalwarp -of GTiff -co "COMPRESS=DEFLATE" "$f" "../sw_affine/$f"
    else
      echo "Warning: Some problem with \"$f\""
  fi
done
cd ../vrt
# now create single mosaic .vrt file from all tif files
gdalbuildvrt ./abk_all_sw.vrt ../sw_affine/*.tif
cd ..

# NOTE: DOESNT SEEM TO WORK FOR COLORED TILES!!!
# do the same stuff with farbe tiles 
# ----------------------------------
cd ./farbe
FILES="./*.tif"
for f in $FILES
do    
  # FAILSAFE #
  # Check if "$f" FILE exists and is a regular file and then apply gdwalwarp
  if [ -f "$f" ]
    then
      # create same named files with geoaffine georeferencing
      gdalwarp -of GTiff -co "COMPRESS=DEFLATE" "$f" "../farbe_affine/$f" 
    else
      echo "Warning: Some problem with \"$f\""
  fi
done
cd ../vrt
# now create single mosaic .vrt file from all .tif files
gdalbuildvrt ./abk_all_farbe.vrt ../farbe_affine/*.tif



