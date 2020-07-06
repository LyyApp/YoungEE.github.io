//
//  baseLei.m
//  面试准备第四天
//
//  Created by YoungEE on 2020/7/6.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "baseLei.h"

@implementation baseLei

-(instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"baseSelf-->%@",NSStringFromClass([self class]));
        NSLog(@"baseSuper-->%@",NSStringFromClass([super class]));
    }
    return self;
}

@end
