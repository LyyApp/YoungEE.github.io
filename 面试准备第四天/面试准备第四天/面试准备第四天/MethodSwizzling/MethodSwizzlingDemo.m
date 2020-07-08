//
//  MethodSwizzlingDemo.m
//  面试准备第四天
//
//  Created by YoungEE on 2020/7/8.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "MethodSwizzlingDemo.h"
#import <objc/runtime.h>

@implementation MethodSwizzlingDemo

+(void)load{
    Method test = class_getInstanceMethod(self,@selector(test));
    Method otherTest = class_getInstanceMethod(self,@selector(otherTest));
    method_exchangeImplementations(test, otherTest);
}

-(void)test{
    NSLog(@"test");
}

-(void)otherTest{
//    [self test];
   NSLog(@"otherTest");
}

@end
