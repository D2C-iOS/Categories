//
//  UIButton+BadgeValue.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIButton+BadgeValue.h"
#import <objc/runtime.h>
#import "Macros.h"
#import "Foundation_Categories.h"

@implementation UIButton (BadgeValue)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(layoutSubviews) swizzledSelector:@selector(aop_layoutSubviews)];
    });
}
- (NSString *)badgeValue {
    return objc_getAssociatedObject(self, @selector(badgeValue));
}
- (void)setBadgeValue:(NSString *)badgeValue {
    if ([badgeValue isValid]) {
        self.badgeLabel.text = badgeValue;
        self.badgeLabel.hidden = NO;
    }
    else if (self.badgeValue != nil) {
        self.badgeLabel.hidden = YES;
    }
    else {
        
    }
    [self setNeedsLayout];
    objc_setAssociatedObject(self, @selector(badgeValue), badgeValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UILabel *)badgeLabel {
    UILabel *object = objc_getAssociatedObject(self, _cmd);
    if (NULL == object) {
        object = [[UILabel alloc] init];
        object.font = Font(10);
        object.textAlignment = NSTextAlignmentCenter;
        object.textColor = [UIColor whiteColor];
        object.backgroundColor = ColorRGB(253, 85, 98);
        object.layer.cornerRadius = 7;
        object.layer.masksToBounds = YES;
        [self addSubview:object];
        objc_setAssociatedObject(self, _cmd, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return object;
}
- (void)aop_layoutSubviews {
    [self aop_layoutSubviews];
    if ([self.badgeValue isValid]) {
        CGFloat width = [self.badgeValue widthWithFont:self.badgeLabel.font height:14];
        if (width + 7 > 14) {
            self.badgeLabel.frame = CGRectMake(self.frame.size.width - 10, -8, 14, 14);
        }else{
            self.badgeLabel.frame = CGRectMake(self.frame.size.width - 10, -8, width + 7, 14);
        }
    }
}
@end
