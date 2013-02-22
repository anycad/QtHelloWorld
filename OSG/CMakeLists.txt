
# Find the QtWidgets library
# FIND_PACKAGE(Qt5Widgets)
FIND_PACKAGE(OpenSceneGraph)

INCLUDE(OsgUtils)
OSG_USE_DIRECTORIES()

# C++ Source File
FILE(GLOB PROJECT_SOURCE_FILES 
	src/*.cpp
	src/*.h
	D:/ThirdParty/OpenSceneGraph-3.0.1/src/src/osgQt/*.cpp
	)

# QRC Source file	
# SET(PROJECT_QRC Resource.qrc)	
# QT5_ADD_RESOURCES(QRC_SOURCE_FILE ${PROJECT_QRC})

ADD_DEFINITIONS("-DOSGQT_LIBRARY")

# Executable
ADD_EXECUTABLE(HelloOsg ${PROJECT_SOURCE_FILES} ${PROJECT_QRC})


OSG_USE_MODULES(HelloOsg)

IF(Qt_USEV5 )
	QT5_USE_MODULES(HelloOsg Widgets OpenGL WebKit WebKitWidgets)
ELSE()
	# Use the Widgets module from Qt 4.
	SET(QT4_LIBS Core Gui OpenGL WebKit)
	FOREACH(LINKLIB ${QT4_LIBS}) 
		QT4_USE_MODULES(HelloOsg ${LINKLIB})
	ENDFOREACH(LINKLIB)
ENDIF()



	
