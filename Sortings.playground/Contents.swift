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
func merge(left:[Int],right:[Int]) -> [Int] {
    var mergedList = [Int]()
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedList.append(left.removeFirst())
        } else {
            mergedList.append(right.removeFirst())
        }
    }
    
    print(mergedList)
    
    return mergedList + left + right
}

func mergeSort(arraySorted:[Int]) -> [Int] {
    guard arraySorted.count > 1 else {
        return arraySorted
    }
    
    let leftArray = Array(arraySorted[0..<arraySorted.count/2])
    let rightArray = Array(arraySorted[arraySorted.count/2..<arraySorted.count])
    
    return merge(left: mergeSort(arraySorted:leftArray), right: mergeSort(arraySorted:rightArray))
}

print(mergeSort(arraySorted: sampleArray))



// 5. Quick Sort O(n log n)
// Space-Complexity O(1) (in-place)
func quickSort(arraySorted: [Int]) -> [Int] {
    if arraySorted.isEmpty { return [] }
    
    let first = arraySorted.first!
    
    let smallerOrEqual = arraySorted.dropFirst().filter { $0 <= first }
    let larger = arraySorted.dropFirst().filter { $0 > first }
    
    return quickSort(arraySorted: smallerOrEqual) + [first] + quickSort(arraySorted: larger)
}

print(quickSort(arraySorted: sampleArray))

// quickSort()
// partition() -> Int
// - picks the last elem as pivot
// - move around
// - return index of pivot
