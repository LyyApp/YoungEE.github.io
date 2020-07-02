//
//  AppDelegate.m
//  KVO_Test
//
//  Created by YoungEE on 2020/7/1.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "AppDelegate.h"
#import "MyObject.h"
#import "MyObserver.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    MyObject *obj = [MyObject new];
    MyObserver *observer = [MyObserver new];
    //在这里打印 po object_getClassName(obj)类型为 "MyObject"
    [obj addObserver:observer forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:NULL];
    //在这里打印 po object_getClassName(obj)类型为 ""NSKVONotifying_MyObject""
    obj.value = 1;
    
    //综上所述当我们在调用KVO时，会在运行时给我们动态创建一个当前类的子类NSKVONotifying_MyObject，当前的isa指针已经发现变化从原先的类指向了新创建的子类
    
    
    
//    1、通过KVC的方式能否生效？
    [obj setValue:@"2" forKey:@"value"];
    
//    2、通过成员变量赋值能否生效?
    [obj increase];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
