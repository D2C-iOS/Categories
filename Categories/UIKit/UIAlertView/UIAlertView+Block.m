//
//  UIAlertView+Block.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UIAlertView+Block.h"
#import <objc/runtime.h>

@implementation UIAlertView (Block)

- (void)setClickedButtonBlock:(void (^)(void))clickedButtonBlock {
    objc_setAssociatedObject(self, @selector(clickedButtonBlock), clickedButtonBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(void))clickedButtonBlock {
    return objc_getAssociatedObject(self, @selector(clickedButtonBlock));
}

- (void)setClickedButtonCallback:(void (^)(NSInteger))clickedButtonCallback; {
    objc_setAssociatedObject(self, @selector(clickedButtonCallback), clickedButtonCallback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(NSInteger))clickedButtonCallback {
    return objc_getAssociatedObject(self, @selector(clickedButtonCallback));
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles ClickedButtonBlock:(void (^)(void))clickedButtonBlock {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    alertView.delegate = alertView;
    alertView.clickedButtonBlock = clickedButtonBlock;
    [alertView show];
}

+ (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles ClickedButtonCallback:(void (^)(NSInteger))ClickedButtonCallback {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    for (NSString *title in otherButtonTitles) {
        [alertView addButtonWithTitle:title];
    }
    alertView.delegate = alertView;
    alertView.clickedButtonCallback = ClickedButtonCallback;
    [alertView show];
    return alertView;
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.clickedButtonBlock != NULL) {
        if (buttonIndex == 1) {
            self.clickedButtonBlock();
        }
    }
    self.clickedButtonCallback? self.clickedButtonCallback(buttonIndex) : NULL;
}

@end
