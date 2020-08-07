//
//  ViewController.m
//  KVO_Test
//
//  Created by YoungEE on 2020/7/1.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic , strong)NSString *myStr;
typedef void(^Block)(void);
@property (nonatomic,copy) Block block;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.myStr = @"11";
    __weak typeof(self) weakSelf = self;
//    weakSelf.block = ^{
//        self.myStr = @"123";
//    };
//    NSLog(@"myStr-->%@",self.myStr);
    self.block = ^{
//        __strong typeof(weakSelf) strongSelf = weakSelf;
        weakSelf.myStr =@"456";
//        NSLog(@"myStr-->%@",strongSelf.myStr);
    };
    self.block();
    NSLog(@"myStr-->%@",self.myStr);
    // Do any additional setup after loading the view.
}


@end
