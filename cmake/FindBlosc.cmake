# input variables
# BLOSC_ROOT

find_path(BLOSC_INCLUDE_DIR NAMES blosc.h
   HINTS ${BLOSC_ROOT}/include/)

find_library(BLOSC_LIBRARY blosc
   HINTS ${BLOSC_ROOT}/lib
   DOC "blosc library path")

find_library(BLOSC_STATIC_LIBRARY libblosc
   HINTS ${BLOSC_ROOT}/lib
   DOC "blosc static library path")

find_library(BLOSC_DEBUG_LIBRARY bloscd
   HINTS ${BLOSC_ROOT}/lib
   DOC "blosc debug library path")

find_library(BLOSC_DEBUG_STATIC_LIBRARY libbloscd
   HINTS ${BLOSC_ROOT}/lib
   DOC "blosc debug library path")

get_filename_component(BLOSC_LIBRARY_DIR ${BLOSC_LIBRARY} DIRECTORY)
