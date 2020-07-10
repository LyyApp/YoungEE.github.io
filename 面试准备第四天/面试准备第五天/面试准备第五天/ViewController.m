//
//  ViewController.m
//  面试准备第五天
//
//  Created by YoungEE on 2020/7/10.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "ViewController.h"
#import "Count.h"

@interface ViewController ()
@property(nonatomic ,strong)Count *count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"引用计数 %ld\n",CFGetRetainCount((__bridge_retained CFTypeRef)self));
//    NSLog(@"引用计数 %ld\n",CFGetRetainCount((__bridge_retained fCFTypeRef)self.count));
    
    self.count = [[Count alloc] init];
    NSLog(@"引用计数 %ld\n",CFGetRetainCount((__bridge_retained CFTypeRef)self.count));
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"引用计数 %ld\n",CFGetRetainCount((__bridge_retained CFTypeRef)self.count));
        NSLog(@"引用计数 %ld\n",CFGetRetainCount((__bridge_retained CFTypeRef)self));
    });
    
    // Do any additional setup after loading the view.
}


@end
