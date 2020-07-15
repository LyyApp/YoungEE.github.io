//
//  BlockModifierController.m
//  面试准备第六天
//
//  Created by YoungEE on 2020/7/14.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "BlockModifierController.h"

@interface BlockModifierController ()

@end

@implementation BlockModifierController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self method2];
}

-(void) method1{
    //什么情况下用__block修饰符
    NSMutableArray *array1 = [NSMutableArray array];
    void(^array1Block)(void) = ^{
        [array1 addObject:@123];
    };
    array1Block();
    NSLog(@"array1 is %@",array1);
    
//    NSMutableArray *array2 = nil;
//    void(^array2Block)(void) = ^{
//        //Variable is not assignable (missing __block type specifier)
//        //编译不通过，编译报错提示我们要用__block修饰array2
//        array2 = [NSMutableArray array];
//    };
//    array2Block();
}

-(void) method2{
    __block int age = 10;
    NSLog(@"block之前-->%p",&age);
    void(^Block)(void)= ^{
        NSLog(@"block之中-->%p",&age);
        NSLog(@"age -->%d",age);
    };
    NSLog(@"block之后-->%p",&age);
    age = 20;
    Block();
    NSLog(@"%@",Block);
    
    
}
@end
