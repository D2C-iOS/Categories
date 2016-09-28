//
//  UIControl+Extension.m
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>
@implementation UIControl (Extension)
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *uxy_ignoreEventKey            = "uxy_ignoreEventKey";

+ (void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__uxy_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)__uxy_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.uxy_ignoreEvent.boolValue) {
        return;
    }
    
    if (self.uxy_acceptEventInterval > 0) {
        self.uxy_ignoreEvent = @(YES);
        [self performSelector:@selector(setUxy_ignoreEvent:) withObject:@(NO) afterDelay:self.uxy_acceptEventInterval];
    }
    [self __uxy_sendAction:action to:target forEvent:event];
}

#pragma mark - Get
- (NSTimeInterval)uxy_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}
-(NSNumber *)uxy_ignoreEvent {
    return objc_getAssociatedObject(self, uxy_ignoreEventKey);
}

#pragma mark - Set
- (void)setUxy_acceptEventInterval:(NSTimeInterval)uxy_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(uxy_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)setUxy_ignoreEvent:(NSNumber *)uxy_ignoreEvent {
    objc_setAssociatedObject(self, uxy_ignoreEventKey, uxy_ignoreEvent, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
