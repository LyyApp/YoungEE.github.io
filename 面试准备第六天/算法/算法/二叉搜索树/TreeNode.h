//
//  TreeNode.h
//  算法
//
//  Created by YoungEE on 2020/7/21.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject
@property(nonatomic , assign)int val;
@property(nonatomic , strong)TreeNode *left;
@property(nonatomic , strong)TreeNode *right;

@end

NS_ASSUME_NONNULL_END
