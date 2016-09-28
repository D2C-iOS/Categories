//
//  UIAlertView+Block.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Block)

// 点击确定回调
@property(copy, nonatomic) void (^clickedButtonBlock)(void);

// 点击返回的索引
@property(copy, nonatomic) void (^clickedButtonCallback)(NSInteger index);

// 展示UIAlertView 点击确定回调
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles ClickedButtonBlock:(void (^)(void))clickedButtonBlock;

// 展示UIAlertView 点击对应索引回调
+ (UIAlertView *)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles ClickedButtonCallback:(void (^)(NSInteger index))clickedButtonCallback;

@end
