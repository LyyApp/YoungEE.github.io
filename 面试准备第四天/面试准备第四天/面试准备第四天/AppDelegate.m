//
//  AppDelegate.m
//  面试准备第四天
//
//  Created by YoungEE on 2020/7/6.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "AppDelegate.h"
#import "RuntimeObjc.h"
#import "MethodSwizzlingDemo.h"

#import <objc/runtime.h>
#import "ViewController+methodSwizzling.h"
#import "RuntimeAddMethod.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

void  Swizzling(Class c,SEL old,SEL new){
    Method oldMethod = class_getInstanceMethod(c,old);
    Method newMethod = class_getInstanceMethod(c,new);
    method_exchangeImplementations(oldMethod,newMethod);
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    Swizzling([UIViewController class], @selector(viewWillAppear:), @selector(swizzling_viewWillAppear:));
    
    // Override point for customization after application launch.
//    RuntimeObjc *timeObjc = [RuntimeObjc new];
//    [timeObjc test];
    
//    MethodSwizzlingDemo *demo = [MethodSwizzlingDemo new];
//    [demo test];
//    [demo otherTest];
    
    
    RuntimeAddMethod *method = [RuntimeAddMethod new];
    [method test];
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
