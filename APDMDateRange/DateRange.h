//
//  DateRange.h
//
//  DateRange Model
//
//  Created by HENRY CHAN on 11/10/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateRange : NSObject

/**
 Create a new DateRange object.
 Returns nil if start >= end otherwise returns a DateRange object.
 */
+ (id) createWithStartDate:(NSDate*)start endDate:(NSDate*)end;

/**
 Return number of days between the range in float.
 */
- (NSInteger) numberOfDaysBetween;

/**
 Return number of months between the range in float. 
 Assume 1 month - 30 days.
 */
- (float) numberOfMonthsBetween;

/**
 Check if the provided data is within the range.
 Return YES if in range, otherwise NO.
 */
- (BOOL) isInsideRange:(NSDate*)date;

@end
