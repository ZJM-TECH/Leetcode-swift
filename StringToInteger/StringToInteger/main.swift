//
//  main.swift
//  StringToInteger
//
//  Created by JiaMeng.Zheng on 2019/4/17.
//  Copyright © 2019 live.bilibili.com. All rights reserved.
//

import Foundation

func myAtoi(_ str: String) -> Int64 {
    var s = str.replacingOccurrences(of: " ", with: "")

    if s.count == 0 {
        return 0
    }

    var positive = true
    if s[s.startIndex] == "+" || s[s.startIndex] == "-" {
        if s[s.startIndex] == "-" {
            positive = false
        }
        let range = s.index(after: s.startIndex) ..< s.endIndex

        s = String(s[range])
    } else if s[s.startIndex] < "0" || s[s.startIndex] > "9" {
        return 0
    }

    var strNum: Int64 = 0
    for c in s {
        guard _isDigit(c) else {
            break
        }
        strNum = strNum * 10 + Int64(String(c))!


    }
    if strNum > Int64.max - 1 {
        if !positive {
            return -Int64.max
        } else {
            return Int64.max - 1
        }
    }
    if !positive {
        strNum = 0 - strNum
    }

    return strNum
}

func _isDigit(_ char: Character) -> Bool {
    return char >= "0" && char <= "9"
}

let a = myAtoi(" - 234abd")
print(a)


//let aaa = "a   hahahaha".replacingOccurrences(of: " ", with: "")
//print(aaa)

