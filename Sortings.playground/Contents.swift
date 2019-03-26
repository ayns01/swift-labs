//
//  Sortings.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-12.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

var sampleArray:Array = [3, 2, 5, 9, 1, 6]

// 1. Bubble Sort O(n^2)
// - too many swaps
// - bubble up the largest one to the right
func bubbleSort(arraySorted: [Int]) -> [Int] {
    
    var result = arraySorted
    
    for i in 1..<result.count {
        for j in 0..<result.count - i {
            if(result[j] > result[j+1]) {
                let temp = result[j]
                result[j] = result[j+1]
                result[j+1] = temp
            }
        }
    }
    
    print(result)
    
    return result
    
}

bubbleSort(arraySorted: sampleArray)


// 2. Selection Sort O(n^2)
// - each scan select min and put it the left
// - swap
func selectionSort(arraySorted: [Int]) -> [Int] {
    
    var result = arraySorted
    
    for i in 0 ..< result.count - 1 {
        
        var lowest = i
        for x in i + 1 ..< result.count {
            if result[x] < result[lowest] {
                lowest = x
            }
        }
        
        if i != lowest {
            result.swapAt(i, lowest)
        }
    }
    
    print(result)
    
    return result
}

selectionSort(arraySorted: sampleArray)


// 3. Insertion Sort O(n^2)
// - sorted | unsorted
// - inserting elem from unsorted portion into sorted portion
// - shift
func insertionSort(arraySorted: [Int]) -> [Int] {
    
    var tempArray = arraySorted
    
    for i in 1..<tempArray.count { // i marks where the sorted pile ends and unsorted pile begins. EX: [8,| 3, 4]
        var x = i
        while x > 0 && tempArray[x] < tempArray[x - 1] {
            let temp = tempArray[x]
            tempArray[x] = tempArray[x - 1]
            tempArray[x - 1] = temp
            x -= 1
        }
    }
    
    print(tempArray)
    
    return tempArray
}

insertionSort(arraySorted: sampleArray)

// 4. Merge Sort O(n log n)
// Space-Complexity O(n)


// 5. Quick Sort O(n log n)
// Space-Complexity O(1) (in-place)

// quickSort()
// partition() -> Int
// - picks the last elem as pivot
// - move around
// - return index of pivot
