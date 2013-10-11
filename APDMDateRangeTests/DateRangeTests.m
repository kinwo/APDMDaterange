//
//  APDMDateRangeTests.m
//  APDMDateRangeTests
//
//  Created by HENRY CHAN on 11/10/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DateRange.h"

@interface DateRangeTests : XCTestCase

@end

@implementation DateRangeTests {
    NSDateFormatter* formatter;
}


- (void)setUp
{
    [super setUp];
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCreateValidDateRange
{
    NSDate* start = [formatter dateFromString:@"2013-10-12 12:13:14"];
    NSDate* end = [formatter dateFromString:@"2013-10-13 13:15:15"];
    
    DateRange* dateRange = [DateRange createWithStartDate:start endDate:end];
    XCTAssertTrue(dateRange != nil, @"dateRange should be valid object.");
}


- (void)testCreateInvalidDateRange
{
    NSDate* start = [formatter dateFromString:@"2013-10-13 14:13:14"];
    NSDate* end = [formatter dateFromString:@"2013-10-12 13:15:15"];
    
    DateRange* dateRange = [DateRange createWithStartDate:start endDate:end];
    XCTAssertTrue(dateRange == nil, @"dateRange should be nil.");
}

- (void)testInRange
{
    NSDate* start = [formatter dateFromString:@"2013-10-11 13:13:14"];
    NSDate* end = [formatter dateFromString:@"2013-10-13 15:15:15"];
    NSDate* test = [formatter dateFromString:@"2013-10-11 16:00:15"];
    
    DateRange* dateRange = [DateRange createWithStartDate:start endDate:end];
    BOOL isInRange = [dateRange isInsideRange:test];
    XCTAssertTrue(isInRange == YES, @"should be in range");
}

- (void)testNotInRange
{
    NSDate* start = [formatter dateFromString:@"2013-10-11 13:13:14"];
    NSDate* end = [formatter dateFromString:@"2013-10-13 15:15:15"];
    NSDate* test = [formatter dateFromString:@"2013-10-10 16:00:15"];
    
    DateRange* dateRange = [DateRange createWithStartDate:start endDate:end];
    BOOL isInRange = [dateRange isInsideRange:test];
    XCTAssertTrue(isInRange == NO, @"should be out of range");
    
    test = [formatter dateFromString:@"2013-10-15 10:00:15"];
    isInRange = [dateRange isInsideRange:test];
    XCTAssertTrue(isInRange == NO, @"should be out of range");
}

- (void)testNumberOfDays
{
    NSDate* start = [formatter dateFromString:@"2010-09-01 10:01:10"];
    NSDate* end = [formatter dateFromString:@"2010-09-16 02:02:20"];
    
    DateRange* dateRange = [DateRange createWithStartDate:start endDate:end];
    NSInteger days = [dateRange numberOfDaysBetween];
    XCTAssertTrue(days == 15, @"should be 15 days");
}

- (void)testNumberOfMonthsExactlyOneMonth
{
    NSDate* start = [formatter dateFromString:@"2010-09-01 14:13:14"];
    NSDate* end = [formatter dateFromString:@"2010-10-01 13:15:15"];
    
    DateRange* dateRange = [DateRange createWithStartDate:start endDate:end];
    float months = [dateRange numberOfMonthsBetween];
    XCTAssertTrue(months == 1, @"should be 1 month");
}

- (void)testNumberOfMonths
{
    NSDate* start = [formatter dateFromString:@"2010-09-01 14:13:14"];
    NSDate* end = [formatter dateFromString:@"2010-10-16 13:15:15"];
    
    DateRange* dateRange = [DateRange createWithStartDate:start endDate:end];
    float months = [dateRange numberOfMonthsBetween];
    XCTAssertTrue(months == 1.5, @"should be 1.5 months");
}


- (void)testNumberOfMonthsInDecimalOnly
{
    NSDate* start = [formatter dateFromString:@"2010-09-01 14:13:14"];
    NSDate* end = [formatter dateFromString:@"2010-09-16 13:15:15"];
    
    DateRange* dateRange = [DateRange createWithStartDate:start endDate:end];
    float months = [dateRange numberOfMonthsBetween];
    XCTAssertTrue(months == 0.5, @"should be 0.5 month");
}


@end
