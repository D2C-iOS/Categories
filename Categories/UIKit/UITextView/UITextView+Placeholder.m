//
//  UITextView+Placeholder.m
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UITextView+Placeholder.h"
#import <objc/runtime.h>

#import "Macros_Color.h"

@implementation UITextView (Placeholder)




#pragma mark - Set
- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholderLabel.text = placeholder;
}

- (void)setFont:(UIFont *)font {
    self.placeholderLabel.font = font;
}

#pragma mark - Get
- (NSString *)placeholder {
    return self.placeholderLabel.text;
}

- (UILabel *)placeholderLabel {
    UILabel *label = objc_getAssociatedObject(self, _cmd);
    if (!label) {
        label = [[UILabel alloc] init];
        label.font = self.font;
        label.textColor = ColorWhite(186);
        [self addSubview:label];
        objc_setAssociatedObject(self, _cmd, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return label;
}

@end
