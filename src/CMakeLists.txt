
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
if (NOT "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang") # clang Doesnt use pthread
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
endif()

SET(VG_SOURCE_FILES
		alignment.cpp
		caller.cpp
		edit.cpp
		entropy.cpp
		gssw_aligner.cpp
		index.cpp
		json2pb.cpp
		mapper.cpp
		path.cpp
		pileup.cpp
		position.cpp
		region.cpp
		utility.cpp
		vg.cpp
		vg_set.cpp
)

SET(VG_LIB vg_lib CACHE STRING "THE VG LIBRARY")

INCLUDE_DIRECTORIES(${OPENMP_INCLUDE} ${PROTOBUF_INCLUDE_DIRS})

add_library(${VG_LIB}
  ${VG_SOURCE_FILES}
)

add_dependencies(${VG_LIB} ${PROTOBUF_PROJECT} ${OPENMP_PROJECT} )
