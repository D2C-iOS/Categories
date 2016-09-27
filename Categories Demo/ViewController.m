//
//  ViewController.m
//  Categories Demo
//
//  Created by 翟泉 on 2016/9/27.
//  Copyright © 2016年 云之彼端. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSInteger a = 1 << 1;
    NSInteger b = 1 << 2;
    NSInteger c = 1 << 3;
    
    
    NSLog(@"%ld %ld %ld",a,b,c);
    
    NSInteger d = a | b;
    
    
    if (d & a) {
        NSLog(@"xxxx");
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
