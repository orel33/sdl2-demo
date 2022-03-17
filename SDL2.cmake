##### Find SDL2 include and libraries #####

# set(SDL2_PATH "" CACHE STRING "Custom SDL2 Library path")

find_path(SDL2_INCLUDE_DIR 
  NAMES SDL.h
  PATH_SUFFIXES SDL2 include/SDL2 include
  # NO_DEFAULT_PATH
  # PATHS ${SDL2_PATH}
  DOC "Where the SDL2 headers can be found"
  REQUIRED
  )

find_library(SDL2_LIBRARY
  NAMES SDL2
  PATH_SUFFIXES lib
  # NO_DEFAULT_PATH
  # PATHS ${SDL2_PATH}
  DOC "Where the SDL2 Library can be found"
  REQUIRED
)

find_library(SDL2_IMAGE_LIBRARY
  NAMES SDL2_image
  PATH_SUFFIXES lib
  # NO_DEFAULT_PATH
  # PATHS ${SDL2_PATH}
  DOC "Where the SDL2 Image Library can be found"
  REQUIRED
)

find_library(SDL2_TTF_LIBRARY
  NAMES SDL2_ttf
  PATH_SUFFIXES lib
  # NO_DEFAULT_PATH
  # PATHS ${SDL2_PATH}
  DOC "Where the SDL2 TTF Library can be found"
  REQUIRED
)

### use this variables in your CMakeLists.txt
set(SDL2_ALL_INC ${SDL2_INCLUDE_DIR})
set(SDL2_ALL_LIBS ${SDL2_LIBRARY} ${SDL2_IMAGE_LIBRARY} ${SDL2_TTF_LIBRARY})

### REMOVE THIS ###

## V0: use pkgconfig to solve SDL2 dependencies (Linux only)
# include(FindPkgConfig) # pkg-config --list-all  | grep -i sdl2
# pkg_search_module(SDL2 REQUIRED sdl2)
# pkg_search_module(SDL2_IMG REQUIRED SDL2_image)
# pkg_search_module(SDL2_TTF REQUIRED SDL2_ttf)
# set(SDL2_ALL_LIBS ${SDL2_LIBRARIES} ${SDL2_IMG_LIBRARIES} ${SDL2_TTF_LIBRARIES})
# set(SDL2_ALL_INC ${SDL2_INCLUDE_DIRS} ${SDL2_IMG_INCLUDE_DIRS} ${SDL2_TTF_INCLUDE_DIRS})

## V1: use a CMake3 package to solve SDL2 dependencies
# find_package(SDL2 REQUIRED)
# set(SDL2_ALL_INC ${SDL2_INCLUDE_DIRS})
# set(SDL2_ALL_LIBS ${SDL2_LIBRARIES} -lSDL2_ttf -lSDL2_image) # add extra SDL2 libraries

## V3: use a CMake3 package to solve SDL2 dependencies
# list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/sdl2)
# find_package(SDL2 REQUIRED)
# find_package(SDL2_image REQUIRED)
# find_package(SDL2_ttf REQUIRED)
# set(SDL2_ALL_INC ${SDL2_INCLUDE_DIRS} ${SDL2_TTF_INCLUDE_DIRS} ${SDL2_IMAGE_INCLUDE_DIRS})
# set(SDL2_ALL_LIBS ${SDL2_LIBRARIES} ${SDL2_IMAGE_LIBRARIES} ${SDL2_TTF_LIBRARIES})


# Version MacOS : tous les liens regroupés dans /usr/local/lib...
# include_directories("/usr/local/include/SDL2")
# link_directories("/usr/local/lib")
# add_executable(demo main.c demo.c)
# target_link_libraries(demo m SDL2 SDL2_image SDL2_ttf)

### pb sous MacOS avec find_package(SDL2 REQUIRED)
# -- SDL2 include dir: /usr/local/Cellar/sdl2/2.0.20/include/SDL2
# -- SDL2 all libraries: -L/usr/local/Cellar/sdl2/2.0.20/lib  -lSDL2  # chaque lib dans un subdir spécifique...
