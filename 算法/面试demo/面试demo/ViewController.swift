//
//  ViewController.swift
//  面试demo
//
//  Created by YoungEE on 2020/7/29.
//  Copyright © 2020 YoungEE. All rights reserved.
//

import UIKit

//给一个有序数组,如[1,1,2,2,3,4,5,5],使用 O(1) 额外空间,要求每个数字只出现一次，并返回数组新长度

class ViewController: UIViewController {
    let nums = [1,1,2,2,3,4,5,5]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.method())
        //买彩票 总共有三个盒子只有一个盒子有奖品 随便选一个的概率是1/3概率，现在我选一个，另外一个人选一个，售票员选一个，那么这个时候每个人的概率是1/3，这时候售票员打开一个盒子没有奖品，那么我要不要和另外一个人换？
        //我在选一个现在两个 其中一个打开  里面没有奖品
        //
        // Do any additional setup after loading the view.
    }
  
    func method() -> Set<Int>{
//        var temp = [Int]()
        //定义一个集合来装载数据
        var temp1 = Set<Int>()
        //遍历当前数组
        for (_ , val) in nums.enumerated(){
            //如果集合中未包含当前的数字加入到结合当中，由当前
            if !temp1.contains(val) {
                temp1.insert(val);
            }
        }
        return temp1
    }

}

