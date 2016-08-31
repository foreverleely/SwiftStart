//
//  main.swift
//  Tour_3
//
//  Created by liyangly on 16/8/31.
//  Copyright © 2016年 liyang. All rights reserved.
//

import Foundation

protocol ExampleProtocol {
    var simpleDescription:String {get}
    mutating func adjust()
}
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherPeoperty:Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
    
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
print(aDescription)

struct SimpleStructure: ExampleProtocol{
    var simpleDescription: String = "A simple struct"
    //结构体自身无法修改protocol的方法，需要添加关键字mutating
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
print(bDescription)

enum SimpleEnum:ExampleProtocol {
    mutating internal func adjust() {
        
    }

    internal var simpleDescription: String {
        return "A simple enum"
    }

}

extension Int: ExampleProtocol {
    var simpleDescription:String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
    
}
print(4.simpleDescription)

extension Double: ExampleProtocol {
    mutating internal func adjust() {
        
    }

    var simpleDescription:String {
        return "The doublevalue is \(self)"
    }
    
}

let protocolValue:ExampleProtocol = a
print(protocolValue.simpleDescription)

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
    
} catch {
    print(error)
}
do {
    let pringerResponse = try send(job: 1440, toPrinter: "Gutembery")
    print(pringerResponse)
    
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire")
} catch let printerError as PrinterError {
    print("Print error: \(printerError)")
} catch {
    print(error)
}

let printSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailyre = try? send(job: 1885, toPrinter: "Never Has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

//方法中的 defer 最后执行
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
    
}

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
let makearray = makeArray(repeating: "knock", numberOfTimes: 4)
print(makearray)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger:OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
let any = anyCommonElements([1,2,3], [9])
print(any)





