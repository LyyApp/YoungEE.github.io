//
//  lei.m
//  面试准备第四天
//
//  Created by YoungEE on 2020/7/6.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "lei.h"

@implementation lei

-(instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"self-->%@",NSStringFromClass([self class]));
        NSLog(@"super-->%@",NSStringFromClass([super class]));
    }
    return self;
}

@end
