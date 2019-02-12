//
//  main.swift
//  Leetcode_TwoSum
//
//  Created by JiaMeng.Zheng on 2019/2/12.
//  Copyright © 2019 live.bilibili.com. All rights reserved.
//

import Foundation

func twoSum(nums: [Int], target: Int) -> (index1: Int, index2: Int) {
    var lookup = [Int : Int]()

    var result = (-1, -1)

    for (index, value) in nums.enumerated() {
        if lookup.keys.contains(target - value) {
            result = (index, lookup[target - value]!)
            return result
        } else {
            lookup[value] = index
        }
    }
    return result

}

let result = twoSum(nums: [3, 2, 4], target: 6)

print(result)

