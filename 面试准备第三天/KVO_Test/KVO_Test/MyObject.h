//
//  MyObject.h
//  KVO_Test
//
//  Created by YoungEE on 2020/7/1.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyObject : NSObject
@property(nonatomic , assign) int value;
-(void) increase;
@end

NS_ASSUME_NONNULL_END
