//
//  NSObject+SafeObject.h
//  Categories
//
//  Created by fengjiwen on 16/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSObject (SafeObject)

//安全取数组方法
-(id)safeObjectIndex:(NSInteger)index;

@end
