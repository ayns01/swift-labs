//
//  main.swift
//  PrettyNumber
//
//  Created by 酒井綾菜 on 2019-04-11.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//
// Let’s take a look at the number 45656.
// This number has a difference of 1 between all adjacent digits. This number is called “pretty number”.
// Given integer N (the number of digits), write a program to print the total number of pretty numbers.
// (A number cannot start with 0)
// N (1 <= N <= 100): the number of digits (length)
// Print the number of pretty numbers.
// - d[N][L] = d[N-1][L-1] + d[N-1][L+1] (where 1 <= L <= 8)

import Foundation

func nunOfPrettyNums(_ d: Int) -> Int{
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 100), count: 100)
    for i in 1...9 {
        dp[1][i] = 1;
    }
    for i in 2...d {
        for j in 0...9 {
            if (j >= 1) {
                dp[i][j] += dp[i-1][j-1]
            }
            if (j <= 8) {
                dp[i][j] += dp[i-1][j+1]
            }
        }
    }
    // memoization done!
    var ans = 0;
    for i in 0...9 {
        ans += dp[d][i]
    }
    return ans;
}

print(nunOfPrettyNums(2))



