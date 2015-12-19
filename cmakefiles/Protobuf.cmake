#  For more information, please see: http://software.sci.utah.edu
# 
#  The MIT License
# 
#  Copyright (c) 2015 Scientific Computing and Imaging Institute,
#  University of Utah.
# 
#  
#  Permission is hereby granted, free of charge, to any person obtaining a
#  copy of this software and associated documentation files (the "Software"),
#  to deal in the Software without restriction, including without limitation
#  the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  and/or sell copies of the Software, and to permit persons to whom the
#  Software is furnished to do so, subject to the following conditions:
# 
#  The above copyright notice and this permission notice shall be included
#  in all copies or substantial portions of the Software. 
# 
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  DEALINGS IN THE SOFTWARE.

# Setting up external library protobuf
include(FindProtobuf)
#IF(NOT ${PROTOBUF_FOUND})
    SET(PROTOBUF_PROJECT protobuf_project CACHE INTERNAL "protobuf project name")
    SET(PROTOBUF_DIR ${CMAKE_BINARY_DIR}/externals/protobuf CACHE INTERNAL "protobuf project directory")
    SET(PROTOBUF_LIB)
    ExternalProject_Add(${PROTOBUF_PROJECT}
        GIT_REPOSITORY https://github.com/google/protobuf.git
        GIT_TAG "master"
        UPDATE_COMMAND ""
        PATCH_COMMAND ""
        BINARY_DIR ${PROTUBUF_DIR}
        SOURCE_DIR ${PROTOBUF_DIR}
        CONFIGURE_COMMAND ./autogen.sh COMMAND ./configure
        BUILD_COMMAND "make" -j4
        BUILD_IN_SOURCE 1
        INSTALL_COMMAND  ""
        CMAKE_CACHE_ARGS
        -DCMAKE_C_COMPILER:STRING=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER:STRING=${CMAKE_CXX_COMPILER}
    )
    
    ExternalProject_Get_Property(${PROTOBUF_PROJECT} INSTALL_DIR)
    ExternalProject_Get_Property(${PROTOBUF_PROJECT} SOURCE_DIR)
    ExternalProject_Get_Property(${PROTOBUF_PROJECT} BINARY_DIR)
    
    LINK_DIRECTORIES(${SOURCE_DIR}/src/.libs/)
    SET(PROTOBUF_LIBRARY ${SOURCE_DIR}/src/.libs/libprotobuf.a CACHE INTERNAL "ProtoBuf Lib")
    SET(PROTOBUF_INCLUDE_DIR ${SOURCE_DIR}/src/ CACHE INTERNAL "ProtoBuf Include")
	SET(PROTOBUF_PROTOC_EXECUTABLE ${SOURCE_DIR}/src/protoc CACHE INTERNAL "ProtoBuf Executable")
    message("ProtobufInclude ${PROTOBUF_INCLUDE_DIR}")

	message("asdf: ${PROTOBUF_PROTOC_EXECUTABLE} ${SOURCE_DIR}")

#ENDIF()


