//
//  main.swift
//  SquareSum2
//
//  Created by 酒井綾菜 on 2019-04-11.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//
//11 = 3^2 + 1^2 + 1^2 (3 terms)
//11 = 2^2 + 2^2 + 1^2 + 1^2 + 1^2 (5 terms)
//The minimum number of squared terms to represent 11 is 3.
//Write a program to find the minimum number of squares needed to sum to N.


import Foundation

func sumOfSquares2(_ c: Int) -> Int {
    let N = Int(readLine()!)!
    var d = [Int](repeating: 0, count: N+1)
    for i in 1...N {
        d[i] = i
        let srqtI = Int(Double(i).squareRoot())
        for j in stride(from: 1, through: srqtI, by: 1) {
            if d[i] > d[i - j * j] {
                // get min
                d[i] = d[i - j * j]
            }
        }
    }
    return d[N]
}

print(sumOfSquares2(11))

