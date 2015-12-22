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

# Setting up external library openmp

SET(OPENMP_PROJECT openmp_project CACHE INTERNAL "openmp project name")
SET(OPENMP_DIR ${CMAKE_BINARY_DIR}/externals/openmp CACHE INTERNAL "openmp project directory")
SET(OPENMP_LIB)
ExternalProject_Add(${OPENMP_PROJECT}
	GIT_REPOSITORY https://github.com/llvm-mirror/openmp.git
	GIT_TAG "master"
	INSTALL_COMMAND ""
	PREFIX ${OPENMP_DIR}
    CMAKE_CACHE_ARGS
        -DCMAKE_C_COMPILER:STRING=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER:STRING=${CMAKE_CXX_COMPILER}
)

ExternalProject_Get_Property(${OPENMP_PROJECT} INSTALL_DIR)
ExternalProject_Get_Property(${OPENMP_PROJECT} SOURCE_DIR)
ExternalProject_Get_Property(${OPENMP_PROJECT} BINARY_DIR)

LINK_DIRECTORIES(${BINARY_DIR}/runtime/src/)
SET(OPENMP_LIB runtime/src/ CACHE INTERNAL "OpenMP Lib")
SET(OPENMP_INCLUDE_DIR ${BINARY_DIR}/runtime/src/ CACHE INTERNAL "Openmp Include")