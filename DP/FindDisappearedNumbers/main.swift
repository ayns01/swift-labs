//
//  main.swift
//  FindDisappearedNumbers
//
//  Created by 酒井綾菜 on 2019-04-12.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//
// 1 ≤ a[i] ≤ n (n = size of array)

import Foundation

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    if nums.count == 0 {
        return []
    }
    
    let compareSet = Set(1...nums.count)
    let disappearedNum = Array(compareSet.symmetricDifference(nums))
    
    return disappearedNum.sorted()
}

var nums = [4,3,2,7,8,2,3,1]
print(findDisappearedNumbers(nums))

