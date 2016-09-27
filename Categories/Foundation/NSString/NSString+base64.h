//
//  NSString+base64.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (base64)

// base64解码
-(NSString *)stringFromBase64;

// base64加密
-(NSString *)base64Fromstring;

@end
