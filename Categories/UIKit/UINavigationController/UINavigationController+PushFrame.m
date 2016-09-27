//
//  UINavigationController+PushFrame.m
//  Categories
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "UINavigationController+PushFrame.h"

@implementation UINavigationController (PushFrame)


- (void)pushViewController:(UIViewController *)viewController frameIndex:(NSInteger)index animated:(BOOL)animated {
    if (index + 1 > self.viewControllers.count) {
        return;
    }
    else if (index + 1 == self.viewControllers.count) {
        [self pushViewController:viewController animated:animated];
        return;
    }
    
    
    
}

#pragma mark - Get
- (UIViewController *)currentViewController {
    return self.viewControllers[self.viewControllers.count];
}

- (UIViewController *)lastViewController {
    if (self.viewControllers.count < 2) {
        return NULL;
    }
    return self.viewControllers[self.viewControllers.count-2];
}

- (UIViewController *)firstViewController {
    return self.viewControllers.firstObject;
}

@end
