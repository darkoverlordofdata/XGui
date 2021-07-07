#
# use cmake to build for debugging
#
# use gmake to build the release app bundle
#
include $(GNUSTEP_MAKEFILES)/common.make

CC = clang
CXX = clang++

APP_NAME = CatLock

CatLock_HEADERS = 	src/main.h \
					src/XGuiApplication.h \
					src/XGuiFont.h \
					src/XGuiWidget.h \
					src/XGuiLabel.h \
					src/XGuiWindow.h

CatLock_OBJC_FILES = src/main.m \
					src/XGuiApplication.m \
					src/XGuiFont.m \
					src/XGuiWidget.m \
					src/XGuiLabel.m \
					src/XGuiWindow.m

CatLock_RESOURCE_FILES = ./CatLock.png

OBJCFLAGS=  -I/usr/local/include \
			-I/usr/local/include/X11 \
			-I/usr/local/include/freetype2

LDFLAGS=  -lX11 -lXext -lXpm -lImlib2 -lXft


-include GNUmakefile.preamble

-include GNUmakefile.local

include $(GNUSTEP_MAKEFILES)/application.make

-include GNUmakefile.postamble



