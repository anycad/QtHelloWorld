
# Find the QtWidgets library
FIND_PACKAGE(Qt5Widgets)

# C++ Source File
FILE(GLOB PROJECT_SOURCE_FILES 
	*.cpp
	*.h)
# QRC Source file	
#SET(PROJECT_QRC texture.qrc)	
#QT5_ADD_RESOURCES(QRC_SOURCE_FILE ${PROJECT_QRC})

LINK_DIRECTORIES("C:/Qt/Qt5.0.1/5.0.1/msvc2010/lib")
	
# Executable
ADD_EXECUTABLE(hellogl_es2 ${PROJECT_SOURCE_FILES} ${PROJECT_QRC} ${QRC_SOURCE_FILE})
TARGET_LINK_LIBRARIES(hellogl_es2 optimized libGLESv2 debug libGLESv2d )
# Use the Widgets module from Qt 5.
QT5_USE_MODULES(hellogl_es2 Widgets OpenGL)