//
//  ArrayRotation.swift
//  LeetCode
//
//  Created by Narasimha Rao Kundanapalli on 10/10/17.
//  Copyright © 2017 Narasimha Rao Kundanapalli. All rights reserved.
//

import Foundation

//Problem: Rotate an array of n elements to the right by k steps. For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated to [5,6,7,1,2,3,4].

// Time Complexity: O(n)
// Space Complexity: O(n)
func rotate1(_ array: [Int]?, _ pos: Int?) {
    guard let arr = array else { return }
    guard var startPos = pos else { return }
    if startPos > arr.count {
        startPos %= arr.count
    }
    var result: [Int] = Array(repeating: 0, count: arr.count)
    var index = 0;
        for _ in 0..<startPos {
        result[index] = arr[arr.count-startPos + index]
        index += 1
    }
    var rotateIndex = 0
    for _ in startPos..<arr.count {
        result[index] = arr[rotateIndex]
        index += 1
        rotateIndex += 1
    }
    print(arr)
    print(result)
    
}

//Bubble Rotate
// TimeComplexity: O(n*K)
//Space Complexity: O(n)

func rotate2(_ array:[Int]?, _ pos: Int?) {
    guard var arr = array else { return }
    guard var startPos = pos, startPos > 0 else  { return }
    if startPos > arr.count {
        startPos %= arr.count
    }
    
    for _ in 0..<startPos {
        for j in stride(from: arr.count - 1, to: 0, by: -1) {
            let temp = arr[j]
            arr[j] = arr[j-1]
            arr[j-1] = temp
        }
    }
}

/*Can we do this in O(1) space and in O(n) time? The following solution does. Assuming we are given 1,2,3,4,5,6 and order 2. The basic idea is:
1. Divide the array two parts: 1,2,3,4 and 5, 6
2. Rotate first part: 4,3,2,1,5,6
3. Rotate second part: 4,3,2,1,6,5
4. Rotate the whole array: 5,6,1,2,3,4
*/

func rotate(_ array: inout [Int], _ pos: Int) {
    if(array.count < 0 || pos == 0) {
        return
    }
    var startPos = pos
    if(startPos > array.count) {
        startPos %= array.count
    }
    let firstPart = array.count - startPos
    reverse(&array, 0, firstPart - 1)
    reverse(&array, firstPart, array.count - 1)
    reverse(&array, 0, array.count - 1)
}

func reverse(_ array: inout [Int], _ start: Int, _ end: Int) {
    if(array.count <= 1) {
        return
    }
    var left = start
    var right = end
    while left < right {
        let temp = array[left]
        array[left] = array[right]
        array[right] = temp
        left += 1
        right -= 1
        
    }
}
