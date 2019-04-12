//
//  main.swift
//  MakeOne
//
//  Created by 酒井綾菜 on 2019-04-11.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//
// There are 3 operations that can be used for integer X:
// If X is divisible by 3, divide by 3.
// If X is divisible by 2, divide by 2.
// Subtract 1.
// Given an integer N, print the minimum number of operations used to make 1.
// N (1 <= N <= 1000000)
// Print the minimum number of operations performed.
// (Hint: 10 -> 9 -> 3 -> 1)

import Foundation

func minOperations(n: Int) -> Int {
    var d = [Int](repeating: 0, count: 100)
    d[1] = 0
    for i in 2...n {
        d[i] = d[i-1] + 1 // subtract 1
        if (i % 2 == 0 && d[i] > d[i/2] + 1) {
            d[i] = d[i/2] + 1 // divide by 2
        }
        if (i % 3 == 0 && d[i] > d[i/3] + 1) {
            d[i] = d[i/3] + 1 // divide by 3
        }
    }
    return d[n]
}

print(minOperations(n: 10))



