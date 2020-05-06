//
//  PropertyController.m
//  学习代码
//
//  Created by YoungEE on 2020/5/6.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "PropertyController.h"

@interface PropertyController (){
    NSString *name;
}

@end

@implementation PropertyController
@synthesize proName = name;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSLog(@"name-->%@",self->name);
    NSLog(@"proName-->%@",self.proName);
    // Do any additional setup after loading the view.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
