INCLUDE(ExternalProject)
message("OPENMP: ${OpenMP_FLAG_DETECTED}")
IF (NOT OpenMP_FLAG_DETECTED)
   INCLUDE(OpenMP.cmake)
ENDIF()

INCLUDE(Protobuf.cmake)
