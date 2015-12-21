INCLUDE(ExternalProject)
IF (NOT OpenMP_FLAG_DETECTED)
   INCLUDE(OpenMP.cmake)
ENDIF()

INCLUDE(Protobuf.cmake)
INCLUDE(Jansson.cmake)
