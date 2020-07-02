//
//  CopyDemo.m
//  面试准备第一天
//
//  Created by YoungEE on 2020/7/2.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "CopyDemo.h"

@interface CopyDemo()

@property(nonatomic , strong)NSMutableArray *mutabArray;

@property(nonatomic , strong)NSArray *array;
@end

@implementation CopyDemo

-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.mutabArray = [NSMutableArray array];
        
        self.array = [NSArray array];
        
        //分别对可变数组和不可变数组进行copy/mutableCopy，观察是否是可变对象还是不可变对象
        NSLog(@"mutablearray-->copy%@", [[self.mutabArray copy] class]);
        NSLog(@"mutablearray-->mutableCopy%@", [[self.mutabArray mutableCopy] class]);
        NSLog(@"array-->copy%@", [[self.array copy] class]);
        NSLog(@"array-->mutableCopy%@", [[self.array mutableCopy] class]);
        
        //验证可变数组和比可变数组进行copy/mutableCopy，是浅/深拷贝
        NSLog(@"可变对象指针的原内存 %p",self.mutabArray);
        NSLog(@"可变对象进行copy-->%p",[self.mutabArray copy]);
        NSLog(@"可变对象进行mutableCopy-->%p",[self.mutabArray mutableCopy]);
        
        NSLog(@"不可变对象指针的原内存%p",self.array);
        NSLog(@"不可变对象进行copy-->%p",[self.array copy]);
        NSLog(@"可变对象进行mutableArray-->%p",[self.mutabArray mutableCopy]);
        
    //从打印的结果可以看出
//        可变对象在进行copy操作后 变成不可变对象，指针指向的内存区块发生变化是深拷贝
//        可变对象在进项mutableCopy操作后  可变对象，指针指向的内存区块发生变化是深拷贝
//        不可变对象在进项copy操作后 变成不可变对象，指针指向的内存区块未发生变化是浅拷贝
//        不可变对象在进行mutableCopy操作后 变成可变对象，指针指向的内存区块发生变化是深拷贝
    }
    return self;
}

@end
