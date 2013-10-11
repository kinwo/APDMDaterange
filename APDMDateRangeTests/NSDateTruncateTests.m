//
//  NSDateTruncateTests.m
//  APDMDateRange
//
//  Created by HENRY CHAN on 11/10/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+Truncate.h"

@interface NSDateTruncateTests : XCTestCase

@end

@implementation NSDateTruncateTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate* expectedDate = [formatter dateFromString:@"2010-09-01 00:00:00"];
    NSDate* actualDate = [[formatter dateFromString:@"2010-09-01 18:00:00"] truncateDateToDay];
    
    XCTAssertTrue([actualDate compare:expectedDate] == NSOrderedSame, @"Actual date should be identical to expected date.");
}

@end
