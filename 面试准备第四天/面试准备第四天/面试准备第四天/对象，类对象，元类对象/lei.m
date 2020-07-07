//
//  lei.m
//  面试准备第四天
//
//  Created by YoungEE on 2020/7/6.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "lei.h"

@implementation lei

-(instancetype)init{
    self = [super init];
    if (self) {
        /*
         两句答应的都是当前类 打印为lei
         第一句：实际调用的是objc_msgSend(void(id self,SEL OP ,...))id就是当前类
         第二句：实际调用的是objc_msgSendSuper(void(Struts objc_super *super,SEL op,...))其中结构体objc_super里面的receiver指向的就是当前对象
         所以这两种写法都是打印的当前类
         */
        NSLog(@"self-->%@",NSStringFromClass([self class]));
        NSLog(@"super-->%@",NSStringFromClass([super class]));
    }
    return self;
}

@end
