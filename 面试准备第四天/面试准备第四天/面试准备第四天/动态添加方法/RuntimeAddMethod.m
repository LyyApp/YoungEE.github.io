//
//  RuntimeAddMethod.m
//  面试准备第四天
//
//  Created by YoungEE on 2020/7/8.
//  Copyright © 2020 YoungEE. All rights reserved.
//  runtime的动态添加方法

#import "RuntimeAddMethod.h"
#import <objc/runtime.h>


@implementation RuntimeAddMethod


+(BOOL) resolveInstanceMethod:(SEL) sel{
    class_addMethod(self, @selector(test), testIMP, "v@:");
    
    return YES;
}
void testIMP(void){
    NSLog(@"testIMP");
}

@end
