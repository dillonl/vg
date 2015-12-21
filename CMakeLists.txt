# =================================
# vg
#
# vg/CMakeLists.tx
# =================================

#Set up min CMake version
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

#Set project name
PROJECT(vg)

INCLUDE(ExternalProject)

SET(VERSION_MAJOR "1")
SET(VERSION_MINOR "3")
SET(VERSION_PATCH "0")
SET(VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}")

IF("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
  MESSAGE(SEND_ERROR "In-source builds are not allowed, please build this in the bin directory!")
ENDIF("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")

INCLUDE_DIRECTORIES(src)

# add subfolders
ADD_SUBDIRECTORY(cmakefiles)
ADD_SUBDIRECTORY(deps)
ADD_SUBDIRECTORY(src)
#ADD_SUBDIRECTORY(test)

#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/)

# set header and source files
set(VG_TOOLS_SOURCES
	src/main.cpp
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
if (NOT "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang") # clang Doesnt use pthread
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
endif()

set(CMAKE_BUILD_TYPE Debug) # uncomment this when you need a debug build

IF (NOT OpenMP_FLAG_DETECTED)
   
ENDIF()
INCLUDE_DIRECTORIES(${OPENMP_INCLUDE})

#create binary
add_executable(vg
  ${VG_TOOLS_SOURCES}
)

add_dependencies(vg ${PROTOBUF_PROJECT} ${OPENMP_PROJECT} )

# link libraries to executables
target_link_libraries(vg
  ${VG_LIB}
  ${OPENMP_LIB}
  ${JANSSON_LIB}
#  fastahack_lib
#  ${GSSW_LIB}
)
