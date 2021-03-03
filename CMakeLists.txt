cmake_minimum_required(VERSION 3.0)

project ("demo_sdl2" LANGUAGES C)

set(CMAKE_C_FLAGS "-std=c99 -g -Wall")

## use pkgconfig to solve SDL2 dependencies (Linux only)
# include(FindPkgConfig) # pkg-config --list-all  | grep -i sdl2
# pkg_search_module(SDL2 REQUIRED sdl2)
# pkg_search_module(SDL2_IMG REQUIRED SDL2_image)
# pkg_search_module(SDL2_TTF REQUIRED SDL2_ttf)
# set(SDL2_ALL_LIBS ${SDL2_LIBRARIES} ${SDL2_IMG_LIBRARIES} ${SDL2_TTF_LIBRARIES})
# set(SDL2_ALL_INC ${SDL2_INCLUDE_DIRS} ${SDL2_IMG_INCLUDE_DIRS} ${SDL2_TTF_INCLUDE_DIRS})

## use a CMake3 package to solve SDL2 dependencies
find_package(SDL2 REQUIRED)
set(SDL2_ALL_INC ${SDL2_INCLUDE_DIRS})
set(SDL2_ALL_LIBS ${SDL2_LIBRARIES} -lSDL2_ttf -lSDL2_image) # add extra SDL2 libraries

## print this 
message(STATUS "SDL2 include dir: ${SDL2_ALL_INC}")
message(STATUS "SDL2 all libraries: ${SDL2_ALL_LIBS}")

## compilation rules
include_directories(${SDL2_ALL_INC})
add_executable(minimal minimal.c)
target_link_libraries(minimal ${SDL2_ALL_LIBS} m)
add_executable(demo main.c demo.c)
target_link_libraries(demo ${SDL2_ALL_LIBS} m)
add_executable(model main.c model.c)
target_link_libraries(model ${SDL2_ALL_LIBS} m)

## copy useful data files in build dir
foreach(file "background.png" "bomb.png" "mario.png" "arial.ttf")
  file(COPY ${file} DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
endforeach(file)