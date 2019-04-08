//
//  main.swift
//  Leetcode_AddTwoNumbers
//
//  Created by JiaMeng.Zheng on 2019/2/13.
//  Copyright © 2019 live.bilibili.com. All rights reserved.
//

import Foundation

class ListNode {
    var value: Int
    var next: ListNode?

    init(_ value: Int) {
        self.value = value
    }
}

class List {
    var head: ListNode?
    var tail: ListNode?

    // 尾插法
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }

    // 头插法
    func appendToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
}



func addTwoNumbers(l1: ListNode?, l2: ListNode?) -> ListNode? {
    var l3: ListNode?

    guard let _ = l1 else {
        return l3
    }
    guard let _ = l2 else {
        return l3
    }

    let list1 = l1!
    let list2 = l2!

    if list1.value + list2.value < 10 {
        l3 = ListNode(list1.value + list2.value)
        l3?.next = addTwoNumbers(l1: list1.next, l2: list2.next)
    } else {
        l3 = ListNode(list1.value + list2.value - 10)
        l3?.next = addTwoNumbers(l1: list1.next, l2: addTwoNumbers(l1: list2.next, l2: ListNode(1)))
    }
    return l3
}

let list1 = List()
list1.appendToTail(2)
list1.appendToTail(4)
list1.appendToTail(3)

print(list1)

let list2 = List()
list2.appendToTail(5)
list2.appendToTail(6)
list2.appendToTail(4)

print(list2)

let reuslt = addTwoNumbers(l1: list1.head, l2: list2.head)

if let l = reuslt {
    print(l)
}

