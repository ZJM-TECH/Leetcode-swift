//
//  main.swift
//  LongestPalindrome
//
//  Created by JiaMeng.Zheng on 2019/4/10.
//  Copyright © 2019 live.bilibili.com. All rights reserved.
//

import Foundation

func longestPalindrome(s: String) -> String {
    var l = 0
    var r = 0
    var max_len = 0
    let n = s.count
    for i in 0 ..< n {
        for j in 0 ..< min(i+1, n-i) {
            if s[s.index(s.startIndex, offsetBy: (i-j))] != s[s.index(s.startIndex, offsetBy: (i+j))] {
                break
            }
            if 2 * j + 1 > max_len {
                max_len = 2 * j + 1
                l = i - j
                r = i + j
            }
        }

        if (i + 1 < n) && s[s.index(s.startIndex, offsetBy: i)] == s[s.index(s.startIndex, offsetBy: (i+1))] {
            for j in 0 ..< min(i+1, n-i-1) {
                if s[s.index(s.startIndex, offsetBy: (i-j))] != s[s.index(s.startIndex, offsetBy: (i+1+j))] {
                    break
                }
                if 2 * j + 2 > max_len {
                    max_len = 2 * j + 2
                    l = i - j
                    r = i + 1 + j
                }
            }
        }
    }
    let range = s.index(s.startIndex, offsetBy: l) ..< s.index(s.startIndex, offsetBy: (r + 1))
    let str = s[range]
    return String(str)
}

let output = longestPalindrome(s: "babad")
print(output)

