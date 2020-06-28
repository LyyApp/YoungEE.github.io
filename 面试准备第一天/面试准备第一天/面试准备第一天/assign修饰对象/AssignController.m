//
//  AssignController.m
//  面试准备第一天
//
//  Created by YoungEE on 2020/6/28.
//  Copyright © 2020 YoungEE. All rights reserved.
//

//总所周知assgin是用来修饰基本数据类型的如以下写法,但是我们用来修饰对象呢？
//@property(nonatomic , assign)CGFloat correctMethod;
#import "AssignController.h"
#import "TestObject.h"

@interface AssignController ()
@property(nonatomic , assign)CGFloat correctMethod;

@property(nonatomic , assign)TestObject *testObject;
@end

@implementation AssignController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
//    [self test1];
    [self test2];
}

-(void) test1{
    //Assigning retained object to unsafe property; object will be released after assignment
    //这样定义的话会报这样的错，将保留对象分配给不安全的属性；分配后将释放此对象
    //编译的话会报错Thread 1: EXC_BAD_ACCESS (code=1, address=0x126d479da6e0)
    //分析：对象创建出来没有任何强指针去指向他，所以创建完成后就会被释放。但是self.testObject指针指向了这个对象，就造成了指针指向一个释放的内存地址(空闲地址)，已经不可读写，所以就形成了野指针
    self.testObject = [TestObject new];
    self.testObject.age = @"12";
}

-(void) test2{
    //这种写法不会报错编译也可以运行但是当在方法体外继续调用self.testObject就会报错EXC_BAD_ACCESS
    //分析：方法体内打印self.testObject <TestObject: 0x6000025c82d0> 方法体外打印self.testObject 0x00006000025c82d0， 因为self.testObject是用assign修饰的不是强引用，所以在方法体外tstObj会被释放，从而导致野指针
    TestObject *tstObj = [TestObject new];
    self.testObject = tstObj;
    self.testObject.age = @"12";
}
@end
