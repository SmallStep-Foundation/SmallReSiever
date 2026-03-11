//
//  SmallReSieverTests.m — SmallReSiever unit tests (RSSItem, RSSFeed)
//

#import <Foundation/Foundation.h>
#import "SSTestMacros.h"
#import "../RSS/RSSItem.h"
#import "../RSS/RSSFeed.h"

static void testRSSItem(void)
{
    CREATE_AUTORELEASE_POOL(pool);
    RSSItem *item = [[RSSItem alloc] init];
    SS_TEST_ASSERT(item != nil, "RSSItem alloc init");
    item.title = @"Test Title";
    item.link = @"http://example.com/1";
    SS_TEST_ASSERT_EQUAL_STR(item.title, @"Test Title", "title");
    SS_TEST_ASSERT_EQUAL_STR(item.link, @"http://example.com/1", "link");
#if defined(GNUSTEP) && !__has_feature(objc_arc)
    [item release];
#endif
    RELEASE(pool);
}

static void testRSSFeed(void)
{
    CREATE_AUTORELEASE_POOL(pool);
    RSSFeed *feed = [[RSSFeed alloc] init];
    SS_TEST_ASSERT(feed != nil, "RSSFeed alloc init");
    feed.title = @"My Feed";
    feed.feedURL = @"http://example.com/feed.xml";
    feed.items = [NSArray array];
    SS_TEST_ASSERT_EQUAL_STR(feed.title, @"My Feed", "title");
    SS_TEST_ASSERT([feed items] != nil && [[feed items] count] == 0, "items empty");
#if defined(GNUSTEP) && !__has_feature(objc_arc)
    [feed release];
#endif
    RELEASE(pool);
}

int main(int argc, char **argv) {
    (void)argc;(void)argv;
    CREATE_AUTORELEASE_POOL(pool);
    testRSSItem();
    testRSSFeed();
    SS_TEST_SUMMARY();
    RELEASE(pool);
    return SS_TEST_RETURN();
}
