//
//  NSDate+Truncate.h
//
//  NSDate category with truncate date utility.
//
//  Created by HENRY CHAN on 11/10/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Truncate)

/**
 Truncate the date into day level and return a new NSDate object
 */
- (NSDate*) truncateDateToDay;

@end
