
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

add_library(${VG_LIB}
  ${VG_SOURCE_FILES}
)
add_dependencies(${VG_LIB} openmp)

IF (NOT OpenMP_FLAG_DETECTED)
   INCLUDE_DIRECTORIES(${OPENMP_DIR})
ENDIF()


