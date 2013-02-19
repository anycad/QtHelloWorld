

CMAKE_MINIMUM_REQUIRED(VERSION 2.8.9)

PROJECT(HelloWorld)

IF (WIN32) 
SET(CMAKE_PREFIX_PATH "C:/Qt/Qt5.0.1/5.0.1/msvc2010")
ELSE(WIN32) 
SET(CMAKE_PREFIX_PATH "/usr/local/Qt-5.0.1")
ENDIF(WIN32)

# Find includes in corresponding build directories
SET(CMAKE_INCLUDE_CURRENT_DIR ON)
# Run moc automatically when needed.
SET(CMAKE_AUTOMOC ON)

ADD_SUBDIRECTORY(MDI)