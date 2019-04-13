//
//  main.swift
//  SingleNumber
//
//  Created by 酒井綾菜 on 2019-04-12.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var res = nums[0];
    for i in 1..<nums.count
    {
    res = res ^ nums[i];
    }
    
    return res;
}

var nums = [4,1,2,1,2]
print(singleNumber(nums))

