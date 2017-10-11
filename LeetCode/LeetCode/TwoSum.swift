//
//  TwoSum.swift
//  LeetCode
//
//  Created by Narasimha Rao Kundanapalli on 10/10/17.
//  Copyright © 2017 Narasimha Rao Kundanapalli. All rights reserved.
//

import Foundation

/* Problem: Given an array of integers and an integer target, return the indices of two numbers that add up to the target.*/


//Solution1 :There are a variety of solutions to this problem (some better than others). The following solutions both run in O(n) time.

//Time Complexity: O(n)
//Space Complexity: O(n)
func twoSum(_ nums: [Int], _ target: Int) -> ((Int, Int))? {
    var map = [Int : Int]()
    
    for(index, num) in nums.enumerated() {
        let complement = target - num
        if let complementIndex = map[complement] {
            return (complementIndex, index)
        }
        map[num] = index
    }
    return nil
}
