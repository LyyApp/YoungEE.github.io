//
//  GCDDemo.m
//  面试准备第六天
//
//  Created by YoungEE on 2020/7/20.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "GCDDemo.h"

@interface GCDDemo (){
    //定义一个并发队列
    dispatch_queue_t concurrentQueue;
    //用户数据中心，可能多个线程需要用户访问
    NSMutableDictionary *userCenter;
}

@end

@implementation GCDDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void) initInstance{
    concurrentQueue = dispatch_queue_create("read_write_queue",DISPATCH_QUEUE_CONCURRENT);
    userCenter = [NSMutableDictionary dictionary];
}
//dispatch_barrier_async
//gcd的多读单写，多读单写就是读者与读者并发，读者与写者互斥，写者与写者互斥
-(void) Method1{
    
}

//读，并发操作 同步立马返回结果
-(id) objectForKey:(NSString*) key{
    __block id result;
    dispatch_sync(concurrentQueue, ^{
        result = [userCenter objectForKey:key];
    });
    return result;
}
//写，异步
-(void) setObject:(id) obj forkey:(NSString*) key{
    //异步栅栏调用设置数据
    dispatch_barrier_async(concurrentQueue, ^{
        [self->userCenter setObject:obj forKey:key];
    });
}
 

@end
