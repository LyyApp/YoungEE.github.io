//
//  ViewController.m
//  面试准备第四天
//
//  Created by YoungEE on 2020/7/6.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "ViewController.h"
#import "lei.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    lei *l = [lei new];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:4];
    [array addObject:@"1"];
    [array addObject:@"2"];
    [array addObject:@"3"];
    [array addObject:@"4"];
    NSLog(@"%@",array);
    array = [NSMutableArray arrayWithCapacity:8];
    [array addObject:@"5"];
    [array addObject:@"6"];
    [array addObject:@"7"];
    [array addObject:@"8"];
    NSLog(@"%@",array);
}


@end
