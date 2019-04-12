//
//  main.swift
//  NonDecreasingDigits
//
//  Created by 酒井綾菜 on 2019-04-11.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//
// A Number with digits in non-decreasing order: 2234, 3678, 11119
// These numbers are not in non-decreasing order: 2232, 3676, 91111
// Given a length of digits, write a program to print the total number of non-decreasing digits.
// (A number can start with 0)
// N (1 <= N <= 1000): the number of digits (length)
// Print the # of non-decreasing digits numbers.

import Foundation

func countNonDecreasing(n: Int) -> Int {
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 100), count: 100)
    
    // Fill table for non decreasing # of length 1
    // Base cases 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    for i in 0..<10
    {
        dp[i][1] = 1
    }
    
    // Fill the table in bottom-up manner
    for digit in 0...9
    {
        // Compute total # of non decreasing
        // numbers of length 'len'
        for len in 2...n
        {
            // sum of all numbers of length of len-1
            // in which last digit x is <= 'digit'
            for x in 0...digit
            {
                dp[digit][len] += dp[x][len-1]
            }
        }
    }
    
    // memoization done!
    var count = 0;
    
    // There total nondecreasing numbers of length n
    // will be dp[0][n] +  dp[1][n] ..+ dp[9][n]
    for i in 0..<10
    {
        count += dp[i][n];
    }
    return count;
}

print(countNonDecreasing(n: 2))
