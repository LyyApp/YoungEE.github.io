//
//  DispatchGroup.m
//  面试准备第六天
//
//  Created by YoungEE on 2020/7/20.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "DispatchGroup.h"

@interface DispatchGroup ()
{
    dispatch_queue_t current_queue;
    NSMutableArray *arrayUrls;
}
@end

@implementation DispatchGroup

- (void)viewDidLoad {
    [super viewDidLoad];
    current_queue = dispatch_queue_create("dispatch_group", DISPATCH_QUEUE_CONCURRENT);
    arrayUrls = [NSMutableArray array];
    [arrayUrls addObject:@"1"];
    [arrayUrls addObject:@"2"];
    [arrayUrls addObject:@"3"];
    [arrayUrls addObject:@"4"];
    
    [self Method];
}

-(void) Method{
    //创建group
    dispatch_group_t group = dispatch_group_create();
    //for循环遍历各个元素执行操作
    for (NSURL *url in arrayUrls) {
        //异步组分派到并发队列中
        dispatch_group_async(group, current_queue, ^{
            //根据URL去下载图片
            NSLog(@"-------------");
            
            NSLog(@"url is %@",url);
            sleep(10);
        });
    };
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       //当添加到组中的所有任务执行完成之后会调用此block
        //从打印的结果可以看出来  只要执行完数组中的所有操作完成后才会去响应;可以想象到的引用场景就是APP启动后出现欢迎页面 我们在欢迎页面去请求首页数据广告数据一些loading需要的数据 完成之后再去看是否请求到广告数据，没有请求到则进入首页，请求到了展示开屏广告页
        NSLog(@"所有的URL执行完成");
    });
}

@end
