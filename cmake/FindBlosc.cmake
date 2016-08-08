# input variables
# BLOSC_ROOT

# output variables
# BLOSC_FOUND
# BLOSC_VERSION
# BLOSC_INCLUDE_DIRS
# BLOSC_LIBRARY
# BLOSC_STATIC_LIBRARY
# BLOSC_DEBUG_LIBRARY
# BLOSC_DEBUG_STATIC_LIBRARY
# BLOSC_LIBRARY_DIR

find_path(BLOSC_INCLUDE_DIRS NAMES blosc.h
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

if(BLOSC_INCLUDE_DIRS)
   file(READ "${BLOSC_INCLUDE_DIRS}/blosc.h" _blosc_version_file)
   string(REGEX REPLACE ".*#define BLOSC_VERSION_MAJOR[ \t]+([0-9]+).*" "\\1"
         BLOSC_VERSION_MAJOR ${_blosc_version_file})
   string(REGEX REPLACE ".*#define BLOSC_VERSION_MINOR[ \t]+([0-9]+).*" "\\1"
         BLOSC_VERSION_MINOR ${_blosc_version_file})
   string(REGEX REPLACE ".*#define BLOSC_VERSION_RELEASE[ \t]+([0-9]+).*" "\\1"
         BLOSC_VERSION_RELEASE "${_blosc_version_file}")
   set(BLOSC_VERSION "${BLOSC_VERSION_MAJOR}.${BLOSC_VERSION_MINOR}.${BLOSC_VERSION_RELEASE}")
endif()

find_package_handle_standard_args(Blosc 
   REQUIRED_VARS BLOSC_INCLUDE_DIRS
   HANDLE_COMPONENTS
   VERSION_VAR BLOSC_VERSION)
  
mark_as_advanced(BLOSC_INCLUDE_DIRS)
