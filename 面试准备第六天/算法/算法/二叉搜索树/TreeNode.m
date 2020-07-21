//
//  TreeNode.m
//  算法
//
//  Created by YoungEE on 2020/7/21.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "TreeNode.h"

/**
* Definition for a binary tree node.
* public class TreeNode {
*     public var val: Int
*     public var left: TreeNode?
*     public var right: TreeNode?
*     public init() { self.val = 0; self.left = nil; self.right = nil; }
*     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
*     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
*         self.val = val
*         self.left = left
*         self.right = right
*     }
* }
*/

@implementation TreeNode

-(instancetype)init{
    self = [super init];
    if (self) {
        self.val = 0;
        self.left = nil;
        self.right = nil;
    }
    return self;
}

@end
