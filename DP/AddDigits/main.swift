//
//  main.swift
//  AddDigits
//
//  Created by 酒井綾菜 on 2019-04-12.
//  Copyright © 2019 Ayana Sakai. All rights reserved.
//

import Foundation

func addDigits(_ num: Int) -> Int {
    
    if (num <= 0) {
        return num
    } else if (num % 9 == 0) {
        return 9
    } else {
        return num % 9
    }
}

print(addDigits(140))

