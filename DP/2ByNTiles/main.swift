//
//  main.swift
//  2ByNTiles
//
//  Created by 酒井綾菜 on 2019-04-11.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//
// 2 x N tiles
// Count how many possible ways you can fill up the 2xN tiles by using 2x1 tiles and 1x2 tiles
// N (1 <= N <= 100)
// Print the number of ways to fill up the 2xN tiles.

import Foundation

//Brute Force
func howManyTiles(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }else if n == 2 {
            return 2
        }else {
            return howManyTiles(n-1) + howManyTiles(n-2)
        }
}

// Dinamic Programming
func howManyTilesDp(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: n+1)
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }
    dp[1] = 1;
    dp[2] = 2;
    for i in 3...n {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

print(howManyTilesDp(5))



