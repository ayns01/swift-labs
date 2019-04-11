//
//  main.swift
//  SquareSum
//
//  Created by 酒井綾菜 on 2019-04-11.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//
// a^2 + b^2 = c
// target^2 = c - a^2

import Foundation

func judgeSquareSum(_ c: Int) -> Bool {
    let sqrtC = Int(Double(c).squareRoot())
    for a in stride(from: 0, through: sqrtC, by: 1) {
        let target = c - (a * a)
        // binarySearch to check if target^2 exists (target^2 = c - a^2)
        if binarySearch(lower: 0, upper: target, target: target) {
            return true
        }
    }
    return false
}

func binarySearch(lower: Int, upper: Int, target: Int) -> Bool {
    var lower = lower
    var upper = upper
    while lower <= upper {
        let mid = (lower + upper) / 2
        if mid * mid == target {
            return true
        } else if mid * mid > target {
            upper = mid - 1
        } else {
            lower = mid + 1
        }
    }
    return false
}

print(judgeSquareSum(7))


