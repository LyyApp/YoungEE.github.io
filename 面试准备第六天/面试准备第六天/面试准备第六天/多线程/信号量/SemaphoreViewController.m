//
//  SemaphoreViewController.m
//  面试准备第六天
//
//  Created by YoungEE on 2020/8/7.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "SemaphoreViewController.h"

@interface SemaphoreViewController ()

@end

@implementation SemaphoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
-(void) Method{
    dispatch_semaphore_t sema = dispatch_semaphore_create(1);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        sleep(2);
        NSLog(@"1");
        dispatch_semaphore_signal(sema);
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        sleep(2);
        NSLog(@"2");
        dispatch_semaphore_signal(sema);
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        sleep(2);
        NSLog(@"3");
        dispatch_semaphore_signal(sema);
    });
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self Method];
}
@end
