//
//  ViewController.m
//  面试准备第一天
//
//  Created by YoungEE on 2020/6/28.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "ViewController.h"
#import "AssignController.h"

#import "CopyDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =UIColor.whiteColor;
//    [self.navigationController pushViewController:[AssignController new] animated:YES];
    
    CopyDemo *demo = [CopyDemo new];
    
    // Do any additional setup after loading the view.
}


@end
