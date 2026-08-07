# GNUmakefile for SmallReSiever (Linux/GNUstep)
#
# RSS reader using SmallStepLib for app lifecycle, menus, and window style,
# and libxml2 for RSS/Atom parsing.
#
# Build SmallStepLib first: cd ../SmallStepLib && make && make install
# Then: make

include $(GNUSTEP_MAKEFILES)/common.make

# Guard: always build the app by default. An explicit .DEFAULT_GOAL makes
# plain 'make' immune to reordering of rules below (e.g. a before-all::
# block before the application.make include would otherwise become the
# default goal and silently skip the app build).
.DEFAULT_GOAL := all

APP_NAME = SmallReSiever

SmallReSiever_OBJC_FILES = \
	App/main.m \
	App/AppDelegate.m \
	RSS/RSSParser.m \
	RSS/RSSFeed.m \
	RSS/RSSItem.m

SmallReSiever_HEADER_FILES = \
	App/AppDelegate.h \
	RSS/RSSParser.h \
	RSS/RSSFeed.h \
	RSS/RSSItem.h

SmallReSiever_INCLUDE_DIRS = \
	-I. \
	-IApp \
	-IRSS \
	$(SMALLSTEP_INCLUDE_DIRS)

# SmallStep framework (shared discovery - SmallStepLib/GNUmakefile.include)
-include ../SmallStepLib/GNUmakefile.include

# libxml2 (FOSS) for RSS/Atom parsing
ADDITIONAL_OBJCFLAGS += -std=gnu99 $(shell xml2-config --cflags 2>/dev/null || echo -I/usr/include/libxml2)
ADDITIONAL_LDFLAGS   += $(shell xml2-config --libs 2>/dev/null || echo -lxml2)
SmallReSiever_LIBRARIES_DEPEND_UPON = -lobjc -lgnustep-gui -lgnustep-base -lxml2
SmallReSiever_LDFLAGS = $(SMALLSTEP_LIB_PATH) $(SMALLSTEP_LDFLAGS) -Wl,--allow-shlib-undefined
SmallReSiever_ADDITIONAL_LDFLAGS = $(SMALLSTEP_LIB_PATH) $(SMALLSTEP_LDFLAGS) -lSmallStep
SmallReSiever_TOOL_LIBS = -lSmallStep -lobjc

SmallReSiever_RESOURCE_FILES = \
	Resources/SmallReSiever.png \
	Resources/logo.png
# Application icon (bare filename; copied into the bundle Resources dir)
SmallReSiever_APPLICATION_ICON = SmallReSiever.png


include $(GNUSTEP_MAKEFILES)/application.make

# Copy the shared logo into Resources before the build (defined after
# the application.make include so it is not the makefile default goal)
before-all::
	mkdir -p Resources && cp -f ../SmallStepLib/Resources/logo.png Resources/logo.png 2>/dev/null || true

