//
//  AddTwoNumbers.swift
//  LeetCode
//
//  Created by Narasimha Rao Kundanapalli on 10/11/17.
//  Copyright © 2017 Narasimha Rao Kundanapalli. All rights reserved.
//

import Foundation

/* You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8 */

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.value = val
        self.next = nil
    }
    
    init(_ val: Int, _ nextNode: ListNode?) {
        self.value = val
        self.next = nextNode
    }
    
    static func display(_ node: ListNode?) {
        var displayNode: ListNode? = node
        while(displayNode != nil) {
            if let nextNode = displayNode {
                print(nextNode.value)
                displayNode = nextNode.next
            }
        }
    }
}

class AddTwoNumbers {
    
    static func addNumbers(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1: ListNode? = list1
        var l2: ListNode? = list2
        let result: ListNode = ListNode(0)
        var tempNode: ListNode = result
        var sum: Int = 0
        
        while(l1 != nil || l2 != nil) {
            sum = sum / 10
            if let node = l1 {
                sum += node.value
                l1 = node.next
            }
            
            if let node = l2 {
                sum += node.value
                l2 = node.next
            }
            tempNode.next = ListNode(sum % 10)
            if let node = tempNode.next {
                tempNode = node
            }
        }
        
        if(sum / 10 == 1) {
            tempNode.next = ListNode(1)
        }
        return result.next
        
    }
}
