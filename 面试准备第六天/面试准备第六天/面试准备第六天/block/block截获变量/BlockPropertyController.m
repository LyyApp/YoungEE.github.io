//
//  BlockPropertyController.m
//  面试准备第六天
//
//  Created by YoungEE on 2020/7/14.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "BlockPropertyController.h"

@interface BlockPropertyController ()


@end

//全局变量
int gloable = 3;
//全局静态变量
static int gloable_static = 5;

@implementation BlockPropertyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //局部变量
    int part = 1;
    //局部静态变量
    static int part_static = 2;
    
    
    
    
    int(^PartBlock)(int) = ^int(int num){
        return num * part;
    };
    
    int(^PartStaticBlock)(int) = ^(int num){
        return num * part_static;
    };
    
    int(^GloableBlock)(int) = ^(int num){
        return num *gloable;
    };
    
    int(^GloableStaticBlock)(int) = ^(int num){
        return num * gloable_static;
    };
    
    part = 100;
    NSLog(@"part is %d",PartBlock(2));//打印2
    
    part_static = 100;
    NSLog(@"part_Static is %d",PartStaticBlock(2));//打印200
    
    gloable = 100;
    NSLog(@"gloable is %d",GloableBlock(2));//打印200
    
    gloable_static = 100;
    NSLog(@"gloable_Static is %d",GloableStaticBlock(2));//打印200
    
    
    
}

@end
