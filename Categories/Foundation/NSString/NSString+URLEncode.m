//
//  NSString+URLEncode.m
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "NSString+URLEncode.h"

@implementation NSString (URLEncode)

- (NSString *)URLEncode {
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(nil, (__bridge CFStringRef)self, nil, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingASCII));
}

- (NSString *)URLDeCode {
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}
@end
