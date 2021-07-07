cmake_minimum_required ( VERSION 3.19 )
###################################################################################
#
#   Experimental cmake build for CMake Tools tooling
#   Execute first: ./configure 
#   cd build
#   make
#   xgui_demo
#
#   then use F5 to debug.
#
###################################################################################
project ( xgui_demo VERSION 0.0.1 )

#
set ( VERSION 0.0.1 )
set ( RELEASE_NAME xgui_demo )

#
# enable features
#
include ( CMakeToolsHelpers OPTIONAL )

#
#   application source
#

list ( APPEND C_SOURCES src/main.m )
list ( APPEND C_SOURCES src/XGuiApplication.m )
list ( APPEND C_SOURCES src/XGuiFont.m )
list ( APPEND C_SOURCES src/XGuiWidget.m )
list ( APPEND C_SOURCES src/XGuiLabel.m )
list ( APPEND C_SOURCES src/XGuiWindow.m )
#
#   application includes
#
set ( INCLUDES "${INCLUDES};/usr/local/include" )
set ( INCLUDES "${INCLUDES};/usr/local/include/X11" )
set ( INCLUDES "${INCLUDES};/usr/local/include/freetype2" )
set ( INCLUDES "${INCLUDES};/usr/local/include/objc" )
set ( INCLUDES "${INCLUDES};/usr/local/GNUstep/System/Library/Headers" )



#
#   compiler options
#
# Libs: 
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fobjc-arc" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fblocks" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fobjc-runtime=gnustep-2.0" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fexceptions" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fobjc-exceptions" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -funwind-tables" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -L/usr/local/lib" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -L/usr/local/GNUstep/System/Library/Libraries" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -w -std=c18 -O3" )

# definitions 

include_directories(AFTER ${INCLUDES})

#
#   compile ccode & link executable
#
add_executable ( ${PROJECT_NAME} ${C_SOURCES} ${RESOURCES} )

target_link_libraries ( ${PROJECT_NAME} m objc gnustep-base pthread X11 Xext Xpm Imlib2 Xft )
install (TARGETS ${PROJECT_NAME} RUNTIME DESTINATION . )

include (CPack)

# (generated from template: objc. Do not modify. )
