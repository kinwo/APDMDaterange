//
//  NSDate+Truncate.m
//  APDMDateRange
//
//  Created by HENRY CHAN on 11/10/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "NSDate+Truncate.h"

@implementation NSDate (Truncate)

- (NSDate*) truncateDateToDay
{
    NSDate* truncatedDate;
    [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit startDate:&truncatedDate interval:NULL forDate:self];
    return truncatedDate;
}

@end
