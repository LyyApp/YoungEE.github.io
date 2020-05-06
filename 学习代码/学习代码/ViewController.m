//
//  ViewController.m
//  学习代码
//
//  Created by YoungEE on 2020/4/27.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "ViewController.h"
#import "PropertyController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    PropertyController *vc = [PropertyController new];
//    vc.proName = @"propertyName";
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    PropertyController *vc = [PropertyController new];
    vc.proName = @"propertyName";
    [self.navigationController pushViewController:vc animated:NO];
}
@end
