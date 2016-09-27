//
//  UINavigationController+PushFrame.h
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (PushFrame)

@property (assign, nonatomic, readonly) __kindof UIViewController *currentViewController;

@property (strong, nonatomic, readonly) __kindof UIViewController *firstViewController;

@property (assign, nonatomic, readonly) __kindof UIViewController *lastViewController;




@end
