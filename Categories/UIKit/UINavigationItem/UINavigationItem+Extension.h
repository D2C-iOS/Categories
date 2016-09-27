//
//  UINavigationItem+Extension.h
//  Categories
//
//  Created by d2c_cyf on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (Extension)
@property (strong, nonatomic) NSArray<__kindof UIButton *> *noticeLeftBarButtons;
@property (strong, nonatomic) NSArray<__kindof UIButton *> *leftBarButtons;
@property (strong, nonatomic) NSArray<__kindof UIButton *> *rightBarButtons;
@property (strong, nonatomic) UILabel *countLabel;

-(void)setMessageCountWithCount:(NSNumber *)count;
@end
