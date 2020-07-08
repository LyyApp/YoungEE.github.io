//
//  ViewController+methodSwizzling.m
//  面试准备第四天
//
//  Created by YoungEE on 2020/7/8.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "ViewController+methodSwizzling.h"

@implementation UIViewController (Swizzling)

-(void) swizzling_viewWillAppear:(BOOL) animated{
    //加上这些后就会把系统的默认类给剔除掉
     NSArray *arr = @[@"UIEditingOverlayViewController",@"UIInputWindowController",@"UICompatibilityInputViewController",@"UIApplicationRotationFollowingControllerNoTouches"];
    if([arr containsObject:NSStringFromClass([self class])]){
        return;
    }
    
    //如果这样打印的话 会包含UIInputWindowController，UIEditingOverlayViewController
    NSLog(@"swizzling_viewWillAppear %@",[self class]);
    [self swizzling_viewWillAppear:animated];
}

@end
