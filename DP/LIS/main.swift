//
//  main.swift
//  LIS
//
//  Created by 酒井綾菜 on 2019-04-11.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var d = [Int](repeating: 1, count: nums.count)
    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[j] < nums[i] && d[i] < d[j] + 1 {
                d[i] = d[j] + 1
            }
        }
    }
    return d.max()!
}

let nums = [10, 3, 5, 3, 9, 11, 1, 20]
print(lengthOfLIS(nums))

