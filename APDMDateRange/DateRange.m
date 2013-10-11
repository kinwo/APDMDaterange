//
//  DateRange.m
//  APDMDateRange
//
//  Created by HENRY CHAN on 11/10/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "DateRange.h"

@interface DateRange()

@property(nonatomic, strong) NSDate* start;
@property(nonatomic, strong) NSDate* end;

@end

@implementation DateRange

+ (id) createWithStartDate:(NSDate*)start endDate:(NSDate*)end {
    if (![self checkInvariant:start endDate:end]) {
        return nil;
    }
    
    return [[self alloc] initWithStartDate:start endDate:end];
}

+ (BOOL) checkInvariant:(NSDate*)start endDate:(NSDate*)end {
    return [start compare:end] == NSOrderedAscending;
}

- (id) initWithStartDate:(NSDate*)start endDate:(NSDate*)end {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.start = start;
    self.end = end;
    
    return self;
}

- (NSDate*) truncateDateToDay:(NSDate*) date {
    NSDate* truncatedDate;
    [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit startDate:&truncatedDate interval:NULL forDate:date];
    return truncatedDate;
}

// Prevent default init from being used to create DateRange
- (id) init {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"DateRange model has to be initialized with valid start and end date." userInfo:nil];
}

@end
