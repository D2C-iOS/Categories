//
//  NSString+Date.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSString+Date.h"

@implementation NSString (Date)

- (NSString *)interval {
    return self;
}

- (NSString *)intdata {
    return self;
}

- (NSString *)intCdate {
    return self;
}

- (NSString *)intPAdate {
    return self;
}

- (NSTimeInterval) dateConverter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd hh:mm:ss"];
    NSDate *date = [[NSDate alloc] init];
    date = [dateFormatter dateFromString:self];
    NSTimeInterval timeInterval = [date timeIntervalSince1970];
    return timeInterval;
}

@end
