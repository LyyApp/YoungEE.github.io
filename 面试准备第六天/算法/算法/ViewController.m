//
//  ViewController.m
//  算法
//
//  Created by YoungEE on 2020/7/21.
//  Copyright © 2020 YoungEE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *data;
}
@end

@implementation ViewController

//leetCode编号1013
//给你一个整数数组 A，只有可以将其划分为三个和相等的非空部分时才返回 true，否则返回 false。
//
//形式上，如果可以找出索引 i+1 < j 且满足 A[0] + A[1] + ... + A[i] == A[i+1] + A[i+2] + ... + A[j-1] == A[j] + A[j-1] + ... + A[A.length - 1] 就可以将数组三等分。
//
//
//
//示例 1：
//
//输入：[0,2,1,-6,6,-7,9,1,2,0,1]
//输出：true
//解释：0 + 2 + 1 = -6 + 6 - 7 + 9 + 1 = 2 + 0 + 1
//示例 2：
//
//输入：[0,2,1,-6,6,7,9,-1,2,0,1]
//输出：false
//示例 3：
//
//输入：[3,3,6,5,-2,2,5,1,-9,4]
//输出：true
//解释：3 + 3 = 6 = 5 - 2 + 2 + 5 + 1 - 9 + 4
//
//
//提示：
//
//3 <= A.length <= 50000
//-10^4 <= A[i] <= 10^4
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/partition-array-into-three-parts-with-equal-sum
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Method];
}

-(void) initData{
    //[3,3,6,5,-2,2,5,1,-9,4]
    data = [NSMutableArray array];
    //i=2 j=3
//    [data addObject:@3];
//    [data addObject:@3];
//
//    [data addObject:@6];
//
//    [data addObject:@5];
//    [data addObject:@(-2)];
//    [data addObject:@2];
//    [data addObject:@5];
//    [data addObject:@1];
//    [data addObject:@(-9)];
//    [data addObject:@4];

    

//i=2 j =8
//    [data addObject:@0];
//    [data addObject:@2];
//    [data addObject:@1];
//
//    [data addObject:@(-6)];
//    [data addObject:@6];
//    [data addObject:@(-7)];
//    [data addObject:@9];
//    [data addObject:@1];
//
//    [data addObject:@2];
//    [data addObject:@0];
//    [data addObject:@1];
    
    
    [data addObject:@6];
    [data addObject:@7];
    [data addObject:@1];
}

-(BOOL) Method{
    [self initData];
    //数组求和
    NSNumber *sum = [data valueForKeyPath:@"@sum.self"];
    //先将数组求和如果不能被3整除直接返回false
    if ([sum intValue] % 3 != 0) {
        NSLog(@"不能被3整除");
        return false;
    }
    
    int average = [sum intValue] / 3;
    NSLog(@"average-->%d",average);
    //定义两个指针分别指向数组头尾，在一次的遍历周期内考察头尾指针所遍历过的元素的累和是否能达到sum的三等分
    int i = 0;
    int j = data.count-1;
    int sumHead = 0;
    int sumTail = 0;
    
    while (i < j) {
        NSLog(@"i=%d,j=%d",i,j);
        if (sumHead != average) {
            NSLog(@"sumHead-->%d",sumHead);
            sumHead += [data[i] intValue];
            NSLog(@"sumHead-->%d",sumHead);
            i += 1;
        }
        
        if (sumTail != average) {
            NSLog(@"sumTail-->%d",sumTail);
            sumTail += [data[j] intValue];
            NSLog(@"sumTail-->%d",sumTail);
            j -= 1;
        }
        
        if (sumHead == average && sumTail == average) {
            NSMutableArray *fArray = [NSMutableArray array];
            NSMutableArray *mArray = [NSMutableArray array];
            NSMutableArray *eArray = [NSMutableArray array];
            [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (idx <i) {
                    [fArray addObject:obj];
                }else if(idx >j){
                    [eArray addObject:obj];
                }else{
                    [mArray addObject:obj];
                }
            }];
            NSLog(@"fArray-->%@",fArray);
            NSLog(@"mArray-->%@",mArray);
            NSLog(@"eArray-->%@",eArray);
            return true;
        }
    }
    return false;
}


@end
