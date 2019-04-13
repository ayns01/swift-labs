//
//  main.swift
//  ReverseVowls
//
//  Created by 酒井綾菜 on 2019-04-12.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//

import Foundation

func reverseVowels(_ s: String) -> String {
    let vowel = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    var array = Array(s)
    var vowelChar:[Character] = []
    var vowelIndex:[Int] = []
    
    for i in 0..<array.count{
        if vowel.contains(String(array[i])){
            vowelChar.append(array[i])
            vowelIndex.append(i)
        }
    }
    
    for i in 0..<vowelIndex.count{
        array[vowelIndex[i]] = vowelChar[vowelIndex.count-1-i]
    }
    
    return String(array)
}

print(reverseVowels("apple"))
