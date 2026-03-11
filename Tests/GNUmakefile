#
# SmallReSiever unit tests (RSSItem, RSSFeed — no parser/libxml)
# Build from SmallReSiever: make -f Tests/GNUmakefile
# Run: ./Tests/obj/test_SmallReSiever
#

include $(GNUSTEP_MAKEFILES)/common.make

TOOL_NAME = test_SmallReSiever
test_SmallReSiever_OBJC_FILES = SmallReSieverTests.m ../RSS/RSSItem.m ../RSS/RSSFeed.m
test_SmallReSiever_INCLUDE_DIRS = -I.. -I../App -I../RSS -I../Compat
test_SmallReSiever_INCLUDE_DIRS += -I../../SmallStepLib/SmallStep/Core -I../../SmallStepLib/SmallStep/Platform/Linux -I../../SmallStepLib/Tests
test_SmallReSiever_TOOL_LIBS = -lgnustep-base -lobjc

include $(GNUSTEP_MAKEFILES)/tool.make
