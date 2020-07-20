//
//  DispatchOnceObj.m
//  面试准备第六天
//
//  Created by YoungEE on 2020/7/20.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "DispatchOnceObj.h"

@interface DispatchOnceObj(){
    int onceStatus;
}

@end

@implementation DispatchOnceObj

/**
 使用dispatch_once实现单例
 */
+(instancetype) shareInstance{
    static DispatchOnceObj *onceObj;
    static dispatch_once_t onceToken;
    NSLog(@"====>%ld",onceToken);
    dispatch_once(&onceToken,^{
        NSLog(@"====>block内:%ld",onceToken);
        onceObj = [[DispatchOnceObj alloc] init];
    });
    NSLog(@"======>block外:%ld",onceToken);
    return onceObj;
}

/**
 不是用dispatch_once实现单例
 */
+(instancetype) shareInstance1{
    static DispatchOnceObj *onceObj;
    @synchronized (self) {
        if (!onceObj) {
            NSLog(@"11111");
            onceObj = [[DispatchOnceObj alloc] init];
        }
    }
    return onceObj;
}

@end
