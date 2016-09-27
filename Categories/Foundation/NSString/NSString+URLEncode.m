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
    NSString *URLString = self;
    NSRange range = [URLString rangeOfString:@".com"];
    if (range.length > 0) {
        URLString = [self substringFromIndex:range.location+range.length];
    }
    return CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(nil, (__bridge CFStringRef)URLString, nil, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingASCII));
}

- (NSString *)URLDeCode {
    NSString *decodedString=(__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}
@end
