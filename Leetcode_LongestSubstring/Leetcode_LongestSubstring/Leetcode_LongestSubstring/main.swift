//
//  main.swift
//  Leetcode_LongestSubstring
//
//  Created by JiaMeng.Zheng on 2019/4/8.
//  Copyright © 2019 live.bilibili.com. All rights reserved.
//

import Foundation

func lengthOfLongestSubstring(s: String?) -> Int {

    guard let _ = s else {
        return 0
    }

    var start = 0
    var end = 0
    var result = 0
    var lookup = Set<Character>()
    let str = s!
    let length = str.count
    while start < length && end < length {
        let endCharacter = str[str.index(str.startIndex, offsetBy: end)]
        if !lookup.contains(endCharacter) {
            lookup.insert(endCharacter)
            result = max(result, end-start+1)
            end += 1
        } else {
            let startCharacter = str[str.index(str.startIndex, offsetBy: start)]
            lookup.remove(startCharacter)
            start += 1
        }
    }
    return result
}

func lengthOfLongestSubstringV2(s: String?) -> Int {

    guard let _ = s else {
        return 0
    }

    let str = s!
    var result = 0
    var start = 0
    let n = str.count
    var lookup = [Character : Int]()

    for i in 0 ..< n {
        let value = str[str.index(str.startIndex, offsetBy: i)]
        let index = lookup[value] ?? -1

        start = max(start, index + 1)
        result = max(result, i - start + 1)
        lookup[value] = i
    }

    return result
}



let str = "abcabcdbb"

let length = lengthOfLongestSubstringV2(s: str)

print(length)

