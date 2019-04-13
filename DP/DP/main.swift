//
//  main.swift
//  DP
//
//  Created by 酒井綾菜 on 2019-04-11.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//

import Foundation

func moveZeroes(_ nums: inout [Int]) -> [Int] {
    
    var zeroCount = 0
    for i in 0..<nums.count
    {
         if(nums[i] == 0) {
            zeroCount += 1
        }
    }
    
    var res: Array<Int> = Array()
    for i in 0..<nums.count
    {
        if(nums[i] != 0) {
            res.append(nums[i])
        }
    }
    
    while (zeroCount != 0)
    {
        res.append(0)
        zeroCount -= 1
    }
    
    for i in 0..<nums.count
    {
        nums[i] = res[i];
    }
    
    return nums
}

var nums = [0, 0, 0, 3, 9, 11, 0, 20]
print(moveZeroes(&nums))

