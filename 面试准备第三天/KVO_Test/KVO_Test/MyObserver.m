//
//  MyObserver.m
//  KVO_Test
//
//  Created by YoungEE on 2020/7/1.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "MyObserver.h"

@implementation MyObserver


//-(void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
//    if  {
//        <#statements#>
//    }
//}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([object isKindOfClass:[MyObject class]]) {
        //获取value的新值
        NSNumber *valueNum = [change valueForKey:NSKeyValueChangeNewKey];
        NSLog(@"value--->%@",valueNum);
    }
}
@end
