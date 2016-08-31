//
//  main.swift
//  Tour_2
//
//  Created by liyangly on 16/8/31.
//  Copyright © 2016年 liyang. All rights reserved.
//

import Foundation

//没有定义 rawValue 的系统是会自动给他们进行分配的，并且自动分配的枚举值从小到大赋值的
//比如下面这个枚举值类型为 Int 的例子，如果连 two 的 rawValue 也不定义，那么 ace 到 king 的 rawValue 值就是0-12
//第一个枚举值没定义的话，其 rawValue 为 0，如果在它的后面 添加一个 rawValue 为0的枚举，就有出现
//枚举不唯一的问题，如果 two 的 rawValue 为1，那么 three 的 rawValue 应该为 >1的整数，设置 four 的
//rawValue 为2，也会枚举不唯一的问题
enum Rank: Int {
    case ace = 0
    case two = 1, three, four = 21, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let jack = Rank.five
let jackRawValue = jack.rawValue
print("text1 \(jack) \(jackRawValue)")

//我们不能直接定义除Int外的其它基本数据类型，如果想让它对应其他基本数据类型，可以像下面这样做
//如果没有定义枚举返回，取到的枚举就是它自己
enum BatteryVoltage: Int {
    case v3v7
    case v5v0
    case v7v4
    case v11v1
    case v12v0
    
    var doubleValue: Double {
        switch self {
        case .v3v7:
            return 3.7
        case .v5v0:
            return 5.0
        case .v7v4:
            return 7.4
        case .v11v1:
            return 11.1
        case .v12v0:
            return 12.0
        }
    }
}

let v3v7 = BatteryVoltage.v3v7
let v3v7RawValue = v3v7.rawValue
let v3v7DoubleValue = v3v7.doubleValue
print(v3v7)
print("\(v3v7RawValue) \(v3v7DoubleValue) \n")

func compareRabk(rank1: Rank, rank2: Rank) -> Rank {
    if rank1.rawValue > rank2.rawValue {
        return rank1
    } else {
        return rank2
    }
}
let resultrank = compareRabk(rank1: Rank.ace, rank2: Rank.king)
print("\(resultrank)")

if let convertedRank = Rank(rawValue: 2) {
    //有没有 Rank(rawValue: 2) 这个枚举值，有的话 定义出 convertedRank 并执行if条件
    let threeDescription = convertedRank.simpleDescription()
    print("!!! \(threeDescription)")
} else {
    print("@@@")
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self {
        case .spades:
            return "black"
        case .hearts:
            return "red"
        case .diamonds:
            return "red"
        case .clubs:
            return "black"
        }
    }
}
let spades = Suit.spades
let color = spades.color()
print("\(color) \n")

//结构体不存在继承，而类可以继承引用
struct Card {
    var rank: Rank
    var suit: Suit
    func simplDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simplDescription()
print(threeOfSpadesDescription)

enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failyre ... \(message)")
}














