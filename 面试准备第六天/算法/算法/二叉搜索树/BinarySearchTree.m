//
//  BinarySearchTree.m
//  算法
//
//  Created by YoungEE on 2020/7/21.
//  Copyright © 2020 YoungEE. All rights reserved.
//

/**
 二叉搜索树
 按照给定的数组的数据拿出数组中的第一个元素放入根节点
 把第二个元素拿出来与第一个元素进行比较，比第一个元素小放在左边，比第一个元素大放在右边
 依次类推直到放到最后一个元素
 
 注意二叉树每个根节点下面只有两个子节点
 */

#import "BinarySearchTree.h"
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



@interface BinarySearchTree (){
    NSMutableArray *array;
    
}

@end

@implementation BinarySearchTree

- (void)viewDidLoad {
    [super viewDidLoad];
    array = [NSMutableArray array];
    [array addObject:@1];
    [array addObject:@2];
    [array addObject:@3];
    
    [self getTree];
}

-(void) getTree{
    if (array.count <=0) {
        NSLog(@"数组为空");
        return;
    }
    NSLog(@"%@",[self mixTree]);
}

-(NSMutableArray*) mixTree{
    NSMutableArray *resArray = [NSMutableArray array];
        
    if (array.count == 1) {
        NSMutableArray *tempArray = [NSMutableArray array];
//        TreeNode *node = [TreeNode new];
//        node.val = [array[0] intValue];
        [tempArray addObject:array[0]];
        [resArray addObject:tempArray];
    }else{
        for(int i=0;i < array.count-1;i++){
            NSMutableArray *tempArray = [NSMutableArray array];
            [tempArray addObject:<#(nonnull id)#>]
            for (int j = 0; j < array.count -1 ; j++) {
                if (i != j) {
                    
                }
            }
            
            [resArray addObject:tempArray];
        }
    }
    
    return resArray;
}

//class Solution {
//    func generateTrees(_ n: Int) -> [TreeNode?] {
//        let res:Array<TreeNode> = [TreeNode]()
//        if n == 0{
//            return res
//        }
//        return recursionForRes(start: 1, end: n)
//
//    }
//
//    private func recursionForRes(start:Int,end:Int) -> [TreeNode?]{
//        var res:[TreeNode?] = [TreeNode]()
//        if start > end {
//            res.append(nil)
//            return res
//        }
//        if start == end {
//            let tmp:TreeNode = TreeNode.init(start)
//            res.append(tmp)
//            return res
//        }
//        for i in start...end {
//            let leftTrees = recursionForRes(start: start, end: i - 1)
//            let rightTrees = recursionForRes(start: i + 1, end: end)
//            for tmpLeft:TreeNode? in leftTrees {
//                for tmpRight:TreeNode? in rightTrees{
//                    let root:TreeNode = TreeNode.init(i)
//                    root.left = tmpLeft
//                    root.right = tmpRight
//                    res.append(root)
//                }
//            }
//        }
//        return res
//    }
//}
@end
