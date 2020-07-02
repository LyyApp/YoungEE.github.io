//
//  MyObject.m
//  KVO_Test
//
//  Created by YoungEE on 2020/7/1.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "MyObject.h"

@implementation MyObject

-(instancetype)init{
    self = [super init];
    if (self) {
        _value = 0;
    }
    return self;
}

////判断通过KVC的方式是否能够生效
//-(void)setValue:(int)value{
//    NSLog(@"赋值-->%d",value);
//}


//验证通过成员变量直接赋值是否生效
-(void)increase{
    //成员变量直接赋值此种设置方法不能生效
    _value += 1;
    
    //要想使成员变量赋值生效必须要加上两个方法
    //这种方式叫做手动设置KVO
    [self willChangeValueForKey:@"value"];
    _value += 1;
    [self didChangeValueForKey:@"value"];
}

@end
