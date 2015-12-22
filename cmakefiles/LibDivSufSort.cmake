# Setting up external library openmp

SET(LIBDIVSUFSORT_PROJECT libdivsufsort_project CACHE INTERNAL "libdivsufsort project name")
SET(LIBDIVSUFSORT_DIR ${CMAKE_BINARY_DIR}/externals/libdivsufsort CACHE INTERNAL "libdivsufsort project directory")
SET(LIBDIVSUFSORT_LIB)
ExternalProject_Add(${LIBDIVSUFSORT_PROJECT}
	GIT_REPOSITORY https://github.com/y-256/libdivsufsort.git
	GIT_TAG "master"
	INSTALL_COMMAND ""
	PREFIX ${LIBDIVSUFSORT_DIR}
	CMAKE_ARGS
		-DBUILD_DIVSUFSORT64=1
    CMAKE_CACHE_ARGS
        -DCMAKE_C_COMPILER:STRING=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER:STRING=${CMAKE_CXX_COMPILER}
)

ExternalProject_Get_Property(${LIBDIVSUFSORT_PROJECT} INSTALL_DIR)
ExternalProject_Get_Property(${LIBDIVSUFSORT_PROJECT} SOURCE_DIR)
ExternalProject_Get_Property(${LIBDIVSUFSORT_PROJECT} BINARY_DIR)

#LINK_DIRECTORIES(${BINARY_DIR}/runtime/src/)
#SET(LIBDIVSUFSORT_LIB ${BINARY_DIR}/lib/.a CACHE INTERNAL "libdivsufsort Lib")
SET(LIBDIVSUFSORT_INCLUDE_DIR ${BINARY_DIR}/include/ ${SOURCE_DIR}/android/ CACHE INTERNAL "libdivsufsort Include")



