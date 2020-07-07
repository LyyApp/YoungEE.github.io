//
//  RuntimeObjc.m
//  面试准备第四天
//
//  Created by YoungEE on 2020/7/7.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "RuntimeObjc.h"

@implementation RuntimeObjc

/**
 消息转发机制第一部动态方法解析
 */
////类方法
//+ (BOOL)resolveClassMethod:(SEL)sel{
//
//}
//实例方法
+(BOOL) resolveInstanceMethod:(SEL)sel{
    //如果是test方法打印日志
    if (sel == @selector(test)) {
        NSLog(@"resolveInstanceMethod");
        
        //如果返回的是yes那么就会执行对象中的函数，然后结束转发流程
        //如果返回的是NO，那么就会执行消息转发的第二步快速消息转发机制，这里返回NO是为了模拟进行第二步
        return NO;
    }else{
        //如果不是则调用父类的方法
        return [super resolveInstanceMethod:sel];
    }
}

/**
 消息转发机制第二步：快速消息转发机制
 如果返回nil或者self则会执行消息转发机制的第三步：标准消息转发机制
 如果返回的是一个id对象，那么就会开始对SEL的执行
 */

-(id)forwardingTargetForSelector:(SEL)aSelector{
    NSLog(@"forwardingTargetForSelector");
    return nil;
}

/**
 消息转发机制的第三步：标准消息转发机制
 首先会调用第一个方法来获取方法的参数与返回值，如果返回的是nil则调用doesNotRecognizeSelector并抛出异常
 如果是返回有效的NSMethodsignature对象则执行forwardInVocation函数发送消息给目标对象
 */

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    //返回nil  *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[RuntimeObjc test]: unrecognized selector sent to instance 0x600001fc01e0'
//    return nil;
    
    
    //v@: 这是type encoding技术  v代表方法返回类型为void @当前对象self  :代表方法选择器
    if (aSelector == @selector(test)) {
        NSLog(@"methodSignatureForSelector");
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }else{
       return [super methodSignatureForSelector:aSelector];
    }
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    return NSLog(@"forwardInvocation");
}
@end
