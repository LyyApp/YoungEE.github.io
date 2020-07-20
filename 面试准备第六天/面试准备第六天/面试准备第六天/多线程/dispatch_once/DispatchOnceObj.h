//
//  DispatchOnceObj.h
//  面试准备第六天
//
//  Created by YoungEE on 2020/7/20.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DispatchOnceObj : NSObject
+(instancetype) shareInstance;
+(instancetype) shareInstance1;
@end

NS_ASSUME_NONNULL_END
