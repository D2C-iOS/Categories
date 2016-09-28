//
//  NSObject+SafeObject.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSObject+SafeObject.h"

@implementation NSObject (SafeObject)

- (id)safeObjectIndex:(NSInteger)index {
    if (self) {
        if ([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSMutableArray class]]) {
            NSArray *object = (NSArray *)self;
            if ([object count] > index) {
                return [object objectAtIndex:index];
            }
            return nil;
        }
        return nil;
    }
    return nil;
}
@end
