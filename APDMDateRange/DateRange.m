//
//  DateRange.m
//  APDMDateRange
//
//  Created by HENRY CHAN on 11/10/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "DateRange.h"
#import "NSDate+Truncate.h"

@interface DateRange()

@property(nonatomic, strong) NSDate* start;
@property(nonatomic, strong) NSDate* end;

@end

@implementation DateRange

+ (id) createWithStartDate:(NSDate*)start endDate:(NSDate*)end
{
    if (![self checkInvariant:start endDate:end]) {
        return nil;
    }
    
    return [[self alloc] initWithStartDate:start endDate:end];
}

+ (BOOL) checkInvariant:(NSDate*)start endDate:(NSDate*)end
{
    return [start compare:end] == NSOrderedAscending;
}

- (id) initWithStartDate:(NSDate*)start endDate:(NSDate*)end
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.start = [start truncateDateToDay];
    self.end = [end truncateDateToDay];
    
    return self;
}

- (NSInteger) numberOfDaysBetween
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSDayCalendarUnit;
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:self.start
                                                  toDate:self.end options:0];
    return [components day];
}

// Assume 1 month = 30 days
- (float) numberOfMonthsBetween
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:self.start
                                                  toDate:self.end options:0];
    float numOfMonths = [components month] + ([components day] / 30.0f);
    return numOfMonths;
}

- (BOOL) isInsideRange:(NSDate*)date
{
    if ([date compare:self.start] == NSOrderedSame || [date compare:self.end] == NSOrderedSame) {
        return YES;
    } else if ([date compare:self.start] == NSOrderedDescending && [date compare:self.end] == NSOrderedAscending) {
        return YES;
    }
    
    return NO;
}

// Prevent default init from being used to create DateRange
- (id) init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"DateRange model has to be initialized with valid start and end date." userInfo:nil];
}

@end
