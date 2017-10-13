//
//  LongestString.swift
//  LeetCode
//
//  Created by Narasimha Rao Kundanapalli on 10/12/17.
//  Copyright © 2017 Narasimha Rao Kundanapalli. All rights reserved.
//

import Foundation

/*Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.


*/

class longest_String {
    static func longestString(_ s: String) -> Int {
        var str = [Character](s.characters)
        if(str.count <= 1) {
            return str.count
        }
        var maxLen = 1
        var tempLen = 1
        var dict = Dictionary<Character, Int>()
        dict[str[0]] = 0
        for i in 1..<str.count {
            if let lastPos = dict[str[i]] {
                if lastPos < i - tempLen {
                    tempLen += 1
                } else {
                    tempLen = i - lastPos
                }
            } else {
                tempLen += 1
            }
            dict[str[i]] = i
            if tempLen > maxLen {
                maxLen = tempLen
            }
        }
        return maxLen
    }
}
