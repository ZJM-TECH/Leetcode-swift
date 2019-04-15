//
//  main.swift
//  ReverseInteger
//
//  Created by JiaMeng.Zheng on 2019/4/15.
//  Copyright © 2019 live.bilibili.com. All rights reserved.
//

import Foundation

func reverse(_ x: Int64) -> Int64 {
    if x < 0 {
        return -reverse(-x)
    }
    var value = x

    var res = Int64(0)
    while value != 0 {
        res = (res * 10) + (value % 10)
        value = value / 10
    }

    return res <= 0xffffffff ? res : 0

}

let s = reverse(1234560)
print(s)

