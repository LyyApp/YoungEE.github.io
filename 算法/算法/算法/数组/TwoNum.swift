//
//  TwoNum.swift
//  算法
//
//  Created by YoungEE on 2020/7/29.
//  Copyright © 2020 YoungEE. All rights reserved.
//


//给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
//
//你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
//
//
//
//示例:
//
//给定 nums = [2, 7, 11, 15], target = 9
//
//因为 nums[0] + nums[1] = 2 + 7 = 9
//所以返回 [0, 1]
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/two-sum
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import UIKit

class TwoNum: UIViewController {
    let nums = [2, 7, 11, 15]
    let taretNum = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(self.goNums())
        print(self.goNums1())
        // Do any additional setup after loading the view.
    }
    
    //暴力循环
    func goNums() -> [Int]{
        var res = [Int]()
        for (first , val) in nums.enumerated(){
            let match = taretNum - val
            for second in first+1 ..< nums.count{
                if nums[second] == match {
                    res = [first,second]
                    break;
                }
            }
            
            if res.count > 0{
                break;
            }
        }
        
        return res;
        
    }
    
    //采用一遍hash算法
    func goNums1() -> [Int]{
        var res = [Int]()
        var resSet = Set<Int>()
        for (index , val) in nums.enumerated(){
            print("val-->",val)
            let match = taretNum - val
            if resSet.contains(match) {
                print("--------包含----------")
                print(resSet)
                let first = nums.firstIndex(of: match)!
                res.append(first)
                res.append(index)
            }else{
                print("--------bu包含----------")
                
                resSet.insert(val)
            }
            print(resSet)
        }
        return res;
    }
}
