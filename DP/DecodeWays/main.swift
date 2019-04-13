//
//  main.swift
//  DecodeWays
//
//  Created by 酒井綾菜 on 2019-04-12.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//

import Foundation

func numDecodings(s: String) -> Int {
    let n = s.count
    if (n == 0) { return 0 }

    var memo = Array(repeating: 0, count: n+1)
    memo[n] = 1
    let lastIndex = s.last
    memo[n-1] = lastIndex != "0" ? 1 : 0

    for i in (0 ..< n-2).reversed()
    {
        let index = s.index(s.startIndex, offsetBy: i)
        if (s[index] == "0") {
            continue
        }else {
            memo[i] = Int(s.substring(i,i+2))<=26) ? memo[i+1]+memo[i+2] : memo[i+1]
        }
    }
    

    return memo[0]
}
