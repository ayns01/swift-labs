//
//  main.swift
//  FindTheDifference
//
//  Created by 酒井綾菜 on 2019-04-12.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//

import Foundation

func findTheDifference(_ s: String, _ t: String) -> Character {
    let sSorted = Array(s).sorted()
    let tSorted = Array(t).sorted()
    
    for i in stride(from:0, to:s.count, by:1) {
        if sSorted[i] != tSorted[i] {
            return tSorted[i]
        }
    }
    return tSorted.last!
}

print(findTheDifference("abcd", "abcde"))

