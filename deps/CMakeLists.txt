IF (NOT OpenMP_FLAG_DETECTED)
   ExternalProject_Add(openmp
		PREFIX ${CMAKE_CURRENT_BINARY_DIR}/openmp
   		GIT_REPOSITORY https://github.com/clang-omp/llvm.git
		BUILD_IN_SOURCE
  		BUILD_COMMAND cmake --build .
  		INSTALL_COMMAND ""
   )
   SET(OPENMP_DIR ${CMAKE_CURRENT_BINARY_DIR}/openmp CACHE STRING "THE OpenMP Directory")
ENDIF()
