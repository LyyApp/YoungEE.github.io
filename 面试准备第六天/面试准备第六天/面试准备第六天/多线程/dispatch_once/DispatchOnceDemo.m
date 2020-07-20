//
//  DispatchOnceDemo.m
//  面试准备第六天
//
//  Created by YoungEE on 2020/7/20.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "DispatchOnceDemo.h"
#import "DispatchOnceObj.h"

@interface DispatchOnceDemo (){
    DispatchOnceObj *obj;
}

@end

@implementation DispatchOnceDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"第一次调用单例");
    obj = [DispatchOnceObj shareInstance1];
    DispatchOnceObj *obj2 = [[DispatchOnceObj alloc] init];
    NSLog(@"%p,%p",&obj,&obj2);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"第二次调用单例");
        obj = [DispatchOnceObj shareInstance1];
    });
    
    
//    DispatchOnceObj
}
@end
