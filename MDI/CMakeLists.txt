
# Find the QtWidgets library
FIND_PACKAGE(Qt5Widgets)

# C++ Source File
FILE(GLOB PROJECT_SOURCE_FILES 
	src/*.cpp
	src/*.h
	mdi.rc)
# QRC Source file	
SET(PROJECT_QRC Resource.qrc)	
QT5_ADD_RESOURCES(QRC_SOURCE_FILE ${PROJECT_QRC})
	
# Executable
ADD_EXECUTABLE(MDI ${PROJECT_SOURCE_FILES} ${PROJECT_QRC} ${QRC_SOURCE_FILE})

# Use the Widgets module from Qt 5.
QT5_USE_MODULES(MDI Widgets)