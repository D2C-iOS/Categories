//
//  UITabBar+badge.h
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)
/**
 *  显示小红点
 *
 *  @param index <#index description#>
 *
 *  @param carCount <#index description#>
 *
 */
- (void)showBadgeOnItemIndex:(int)index count:(NSInteger)carCount;
/**
 *  隐藏小红点
 *
 *  @param index <#index description#>
 */
- (void)hideBadgeOnItemIndex:(int)index;
@end
